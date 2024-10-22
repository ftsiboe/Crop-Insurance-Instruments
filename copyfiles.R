rm(list=ls(all=TRUE));library(data.table)

farmpolicydata <-ifelse(toupper(Sys.getenv("USERNAME")) %in% "FRANCIS.TSIBOE",
                        "C:/Users/Francis.Tsiboe/USDA/Turner, Dylan - REE-ERS - farmpolicydata/","")

file.copy(from=paste0(farmpolicydata,"data-raw/rmaFCIPdata/rmaSumOfBussiness/Output/SOBCOV.rds"),
          to = "SOBCOV.rds", overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from=paste0(farmpolicydata,"data-raw/rmaFCIPdata/rmaSumOfBussiness/Output/SOBSCC.rds"),
          to = "SOBSCC.rds", overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

file.copy(from=paste0(farmpolicydata,"data-raw/rmaFCIPdata/rmaActuarialDataMaster/Archive/2024/2024_A01230_ContiguousCounty_YTD.rds"),
          to = "ContiguousCounty.rds", overwrite = TRUE, recursive = FALSE, copy.mode = TRUE)

adm <- readRDS(paste0(farmpolicydata,"data-raw/rmaFCIPdata/rmaTargetRates/Output/FCIPInstruments/FCIPInstruments_adm_county_crop.rds"))
adm <- adm[adm$crop_yr>=2011,]
adm <- adm[adm$protect %in% "Pooled",]
adm <- adm[complete.cases(adm),]
adm$tau_adm <- adm$Rr_adm_mean + adm$Rf_adm_mean
adm00 <- adm
adm00$crop_cd <- 0
adm <- doBy::summaryBy(tau_adm~crop_yr + state_cd + county_cd + crop_cd,data=rbind(adm00,adm),FUN=mean,na.rm=T,keep.names = T)
saveRDS(adm, paste0("fcip_instruments_from_adm.rds"))

