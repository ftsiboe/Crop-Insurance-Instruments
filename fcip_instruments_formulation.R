
# Prepared By Francis Tsiboe (ftsiboe@hotmail.com)  
# Citation requirement;
# 1. Tsiboe,F. and Turner, D., 2023. Econometric identification of crop insurance participation. Agricultural and Resource Economics Review, 52(3):476-497. https://doi.org/10.1017/age.2023.13
# 2. Tsiboe,F. and Turner, D., 2023. The crop insurance demand response to premium subsidies: Evidence from US Agriculture. Food Policy, 119. https://doi.org/10.1016/j.foodpol.2023.102505

rm(list=ls(all=TRUE));gc();library(data.table);library(magrittr)
# Read and process the Sum of Business Coverages (SOBCOV) dataset
sobcov <- as.data.frame(
  data.table::rbindlist(
    lapply(
      list.files(recursive = T,full.names = T,pattern = "sobcov_"),
      function(file){
        return(readRDS(file))
      }), fill = TRUE))

sobcov$net_acre_qty <- ifelse(grepl("ACRE", sobcov$net_acre_typ), sobcov$net_acre_qty, 0)
setDT(sobcov) 
sobcov <- sobcov[, .(net_acre = sum(net_acre_qty, na.rm = TRUE),
                     liability_amt = sum(liability_amt, na.rm = TRUE),
                     indem_amt = sum(indem_amt, na.rm = TRUE)),
                 by = c("crop_yr","state_cd","state_ab","county_cd","county","crop_cd","crop")]

# Read and process the Sum of Business Coverage for Standard Commodity (SOBSCC) dataset
sobscc <- readRDS("sobscc_1948_1990.rds")
setDT(sobscc)
sobscc <- sobscc[, .(net_acre = sum(net_acre_qty, na.rm = TRUE),
                     liability_amt = sum(liability_amt, na.rm = TRUE),
                     indem_amt = sum(indem_amt, na.rm = TRUE)),
                 by = c("crop_yr","state_cd","state_ab","county_cd","county","crop_cd","crop")]

# Combine datasets, splitting at the year 1989
soball <- rbind(sobscc[crop_yr < 1989], sobcov[crop_yr >= 1989])

# Aggregate over the new dataset without specific crop codes
soball00 <- sobscc[, .(net_acre = sum(net_acre, na.rm = TRUE),
                       liability_amt = sum(liability_amt, na.rm = TRUE),
                       indem_amt = sum(indem_amt, na.rm = TRUE)),
                   by = c("crop_yr","state_cd","state_ab","county_cd","county")]
soball00[, crop_cd := 0]
soball00[, crop := "All crops"]
# Append datasets, excluding the generic crop code from the combined dataset
soball <- rbind(soball00, soball[!crop_cd %in% 9999])

# Remove temporary datasets to free up memory
rm(soball00, sobscc, sobcov)

# Calculate Loss Cost Ratio (LCR) for risk assessment
soball[, lcr := indem_amt/liability_amt]

# Loop through years to process data and calculate target rate (tau).
instruments <- as.data.frame(
  data.table::rbindlist(
    lapply(
      (min(soball$crop_yr)+22):max(soball$crop_yr),
      function(year){
        tryCatch({
          # year <- 1970
          # Extract relevant years of data for each county
          statplan <- soball[crop_yr %in% (year-2):(year-21)] 
          
          # List of unique state and county combinations
          worklist <- unique(statplan[, .(state_cd, county_cd)])
          
          # Read contiguous county data for spatial analysis
          contiguous <- readRDS("ContiguousCounty.rds")
          contiguous$state_cd  <- contiguous$State.Code
          contiguous$county_cd <- contiguous$County.Code
          setDT(contiguous)
          
          # Process data for each county, calculating unloaded rate (ULR)
          ADM <- data.table::rbindlist(
            lapply(
              1:nrow(worklist),
              function(ss){
                tryCatch({
                  # ss <- 1
                  # The calculations in this loop are based on procedures found on page 65-70 of 2009 FCIC Rate Methodology Handbook APH
                  # https://legacy.rma.usda.gov/pubs/2008/ratemethodology.pdf
                  group_data <- worklist[ss][contiguous, on = .(state_cd, county_cd), nomatch = 0
                  ][, .(state_cd = Contiguous.State.Code, county_cd = Contiguous.County.Code)]
                  
                  target_data <- worklist[ss][statplan, on = .(state_cd, county_cd), nomatch = 0]
                  group_data  <- unique(rbind(group_data[statplan  , on = .(state_cd, county_cd), nomatch = 0],target_data))
                  
                  # County Group LCR and Variance(includes target):
                  group_data <- group_data[, .(
                    c_alpha = mean(net_acre,na.rm=T),c_a = var(lcr,na.rm=T),
                    c_u = mean(lcr,na.rm=T)), by = .(crop_cd)]
                  
                  # Target County LCR & Variance
                  target_data <- target_data[, .(
                    c_v = var(lcr,na.rm=T), c_x = mean(lcr,na.rm=T),
                    c_net_acre = sum(net_acre,na.rm=T)), by = .(state_cd,county_cd,crop_cd)]
                  
                  data <- target_data[group_data, on = .(crop_cd), nomatch = 0]
                  data[, c_P := c_net_acre/c_alpha]
                  data[, c_K := c_v/c_a]
                  data[, c_Z := c_P/(c_P+c_K)]
                  data[, tau := c_Z*c_x + (1-c_Z)*c_u] # County Unloaded Rate (same as target rate).
                  return(as.data.frame(data)[c("state_cd","county_cd","crop_cd","tau")])
                }, error = function(e){return(NULL)})
              }), fill = TRUE)
          
          # Fill in missing values using contiguous counties' mean
          setDT(ADM)
          contiguous <- readRDS("ContiguousCounty.rds")
          setDT(contiguous)
          contiguous[, state_cd := Contiguous.State.Code]
          contiguous[, county_cd := Contiguous.County.Code]
          contiguous_adm <- unique(contiguous, by = c("State.Code", "County.Code"))
          
          contiguous_adm <- data.table::rbindlist(
            lapply(
              1:nrow(contiguous_adm),
              function(ss){
                tryCatch({
                  # ss <- 1
                  data <- contiguous_adm[ss][contiguous, on = .(State.Code, County.Code), nomatch = 0][
                    ADM, on = .(state_cd, county_cd), nomatch = 0]
                  
                  data <- data[, .(tau_c = mean(tau, na.rm = TRUE)),by = .(State.Code, County.Code, crop_cd)]
                  
                  setnames(data, old = c("State.Code", "County.Code"), new = c("state_cd", "county_cd"))
                  return(data)
                }, error = function(e){return(NULL)})
              }), fill = TRUE)
          
          ADM <- ADM[contiguous_adm, on = intersect(names(ADM), names(contiguous_adm)), nomatch = 0]
          ADM[, tau_sob := fifelse(tau %in% c(NA, Inf, -Inf, NaN) | tau == 0, tau_c, tau)]
          rm(contiguous_adm);gc()
          ADM <- as.data.frame(ADM)
          ADM <- ADM[names(ADM)[!names(ADM) %in% c("tau_c","tau")]]
          ADM <- ADM[!ADM$tau %in% c(NA, Inf, -Inf, NaN,0),]
          ADM <- dplyr::inner_join(unique(as.data.frame(soball[crop_yr %in% year])[c("crop_yr","state_cd","state_ab","county_cd","county","crop_cd","crop")]),
                                   ADM, by=names(ADM)[names(ADM) %in% c("crop_yr","state_cd","state_ab","county_cd","county","crop_cd","crop")])
          gc()
          return(ADM)
        }, error = function(e){return(NULL)})
      }), fill = TRUE))

# merge Instrument (i.e., target rate) aggregated directly from RMA’s actuarial data master 
adm <- readRDS("fcip_instruments_from_adm.rds")
instruments <- dplyr::full_join(instruments,adm, by=names(instruments)[names(instruments) %in% names(adm)])

# formulate and merge national subsidy rate instrument as described by (Yu et al., 2018)
yu2018 <- as.data.frame(
  data.table::rbindlist(
    lapply(
      list.files(recursive = T,full.names = T,pattern = "sobcov_"),
      function(file){
        return(readRDS(file))
      }), fill = TRUE))
yu2018 <- yu2018[yu2018$delivery_sys %in% c("RBUP","FBUP"),]
yu2018 <- yu2018[yu2018$ins_plan_cd %in% c(1:3,90,44,25,42),]
yu2018$cov_lvl  <- paste0("subsidy_rate_",(round((yu2018$cov_lvl/0.05))*0.05)*100)
yu2018 <- yu2018[yu2018$cov_lvl %in% c("subsidy_rate_65","subsidy_rate_75"),]
yu2018 <- doBy::summaryBy(subsidy+total_prem~crop_yr+cov_lvl,data=yu2018,FUN=sum,na.rm=T,keep.names = T)
yu2018$subsidy <- yu2018$subsidy/yu2018$total_prem
yu2018 <- yu2018[c("crop_yr","cov_lvl","subsidy")] %>% tidyr::spread(cov_lvl, subsidy)
instruments <- dplyr::full_join(instruments,yu2018, by=names(instruments)[names(instruments) %in% names(yu2018)])

# tau_final: Same as tau_adm with missing data filled in with tau_sob (as is). 
instruments$tau_final <- ifelse(instruments$tau_adm %in% c(NA,Inf,-Inf,NaN,0),instruments$tau_sob,instruments$tau_adm)

instruments <- instruments[c("crop_yr","state_ab","state_cd","county","county_cd","crop","crop_cd",
                             "tau_sob","tau_adm","tau_final","subsidy_rate_65","subsidy_rate_75")]
instruments <- instruments[!instruments$tau_final %in% c(NA,Inf,-Inf,NaN,0),]

# Save the processed data to an RDS file for use
saveRDS(instruments, "final_fcip_instruments.rds")


