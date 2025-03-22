 
Database was last updated on 2025-03-19 20:25:12.092946
 
For additional details/description beyond what is available here, please contact: ftsiboe@hotmail.com
 
The Archive folder in this directory contains the raw files downloaded from the sources listed below, and the Output folder 
contains the cleaned files. Both Archive and Output have sub-folders corresponding to the type of Summary of Business defined below.
Each Output sub-folders has the final clean data organized by year
The column definitions of the data are defined at the end of this readMe file.
 
Type of Cause of Loss
COLIND    : Cause of Loss Historical Data Files Indemnities Only 
COLINDMNT : Cause of Loss Historical Data Files Indemnities with Month of Loss 
COLSOB    : Cause of Loss Historical Data Files Summary of Business with Month of Loss
 
Raw data sources:
      https://ftp.rma.usda.gov/pub/Miscellaneous_Files/cause_of_loss
      https://www.rma.usda.gov/Information-Tools/Summary-of-Business/Cause-of-Loss
 
***********************************************************************************************************************************************************************************************************************
The RMA sources describe the data column as follows
The Format column specifies the maximum length and data type for each of the elements. A format of 9 indicates that the value can only be numeric, 
while a format of X can be alpha-numeric values. Decimal formats will include a V with the number of places to the right of the decimal specified
to the left of the V, while the decimal precision is specified to the right of the V (e.g. 9(08)V9(02) would be 00000000.00). An S as the first character 
in the specification of format, indicates that the value in that element can contain negatives when applicable.
 
name            Field                              Format        Definition
county          County Name                        X(30)         Name of the county.
county_cd       County Code                        9(03)         The FIPS code that denotes the County in which the insured farm islocated.
cov_typ         Coverage Category                  X(01)         Code that identifies the category of coverage elected : A = Buyup ; C = CAT ; E = Existing Coverage Policy ; L = Limited Coverage
crop            Commodity Name                     X(30)         Name of the crop/commodity
crop_cd         Commodity Code                     9(04)         The Risk Management Agency (RMA) code that denotes thecrop/commodity for which the policy is issued.
crop_yr         Commodity Year Identifier          9(04)         The identifier that represents the year in which the crop/commodity isnormally harvested and indicates the policy year for which coverage wasprovided.
damage          Cause of Loss Description          X(35)         Description of the cause of loss.
damage_cd       Cause of Loss Code                 9(02)         The RMA code that identifies the peril that caused the loss on the crop
det_acre_qty    Net Determined Quantity            9(12)V9(02)   Number of acres, tons, pounds, etc. loss due to damage after the insured’sshare is applied
edr_acre_qty    Net Endorsed Acres                 9(12)V9(02)   Number of acres insured under an endorsement (e.g. SCO, STAX, MarginProtection)
indem_amt       Indemnity Amount                   S9(12)        The total amount of the loss for the designated peril.
ins_plan_ab     Insurance Plan Name Abbreviation   X(05)         Abbreviation of the Insurance Plan Name
ins_plan_cd     Insurance Plan Code                9(02)         Code that denotes the type of insurance coverage is selected for theinsured crop (e.g.APH, Revenue, Dollar, etc.)
liability_amt   Liability                          9(12)         The maximum dollar amount of insurance for the crop
lr              Loss Ratio                         9(5)V9(02)    Calculated: Indemnity / Total Premium.
month           Month of Loss Name                 X(03)         Name of the month when the loss occurred
month_cd        Month of Loss                      9(02)         Month when the loss occurred
pnt_acre_qty    Net Planted Quantity               9(12)V9(02)   Number of acres, tons, pounds, etc. planted to the crop after the insured’sshare is applied.
pol_indem_cnt   Policies Indemnified               9(09)         Count of the number of crop policies with a reported loss
pol_prem_cnt    Policies Earning Premium           9(09)         Count of the number of crop policies with premium NOTE : Not availablefor years prior to 1989.
prod_prem       Producer Paid Premium              9(12)         Premium paid by the producer
stage_cd        Stage Code                         X(02)         See Stage Code Listing
state_ab        State Abbreviation                 X(02)         USPS state abbreviation
state_cd        State Code                         9(02)         The FIPS code that denotes the State in which the insured farm is located.
subsidy         Subsidy                            9(12)         Amount of subsidized premium.
subsidy_add     Additional Subsidy                 9(12)         An additional subsidy from a program or other process. 2021 and 2022Additional Subsidy represents Pandemic Cover Crop Program amount.
subsidy_efa     EFA Premium Discount               9(12)         NA
subsidy_prvt    State/Private Subsidy              9(12)         Subsidy provided by a state or private entity
total_prem      Total Premium                      9(12)         Premium before application of any subsidies. In general, the basepremium rates times liability (Also called the base premium)
year_loss       Year of Loss                       9(04)         Year the loss occurred
