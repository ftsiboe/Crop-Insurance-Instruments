 
Database was last updated on 2025-03-19 20:31:17.393148
 
For additional details/description beyond what is available here, please contact: ftsiboe@hotmail.com
 
The Archive folder in this directory contains the raw files downloaded from the sources listed below, and the Output folder 
contains the cleaned files. Both Archive and Output have sub-folders corresponding to the type of Summary of Business defined below.
Each Output sub-folders has the final clean data organized by year
The column definitions of the data are defined at the end of this readMe file.
 
Type of Summary of Business
      SOBSCC    : Summary of Business Historical Data by State/County/Crop 
      SOBCOV    : Summary of Business Historical Data by State/County/Crop/Coverage Level
      SOBSCCTPU : Summary of Business Historical Data by State/County/Crop/Type/Practice/Unit Structure
 
Raw data sources:
      https://www.rma.usda.gov/en/Information-Tools/Summary-of-Business/State-County-Crop-Summary-of-Business
      https://legacy.rma.usda.gov/data/sob/scc/index.html
      https://prodwebnlb.rma.usda.gov/apps/SummaryOfBusiness
 
*********************************************************************************************************************************************************************************************************************************************************************************************************
The RMA sources describe the data column as follows
The Format column specifies the maximum length and data type for each of the elements. A format of 9 indicates that the value can only be numeric, 
while a format of X can be alpha-numeric values. Decimal formats will include a V with the number of places to the right of the decimal specified
to the left of the V, while the decimal precision is specified to the right of the V (e.g. 9(08)V9(02) would be 00000000.00). An S as the first character 
in the specification of format, indicates that the value in that element can contain negatives when applicable.
 
name             Field                                       Format        Definition
comm_amt         Net Reporting Level Amount                  9(16)         The quantity of the commodity insured adjusted by the insured's share of the commodity. Depending on the commodity, this could be acres, tons, colonies, pounds, or trees as identified by the Commodity Reporting Level Type.
comm_end_amt     Endorsed Commodity Reporting Level Amount   9(16)         Number of acres insured under an endorsement (e.g. SCO, STAX, Margin Protection)
comm_typ         Reporting Level Type                        X(25)         The description of the quantity type associated with Net Commodity Reporting Level Amount. Values include acres, tons, colonies, pounds, or trees.
county           Location County Name                        X(30)         Name of the county.
county_cd        Location County Code                        9(03)         The FIPS code that denotes the County in which the insured farm islocated.
cov_lvl          Coverage Level                              9(01)V9(04)   Elected by the insured, its complement is the deductible. The base to which it applies differs by insurance plan (e.g. - yield, revenue, dollar, or inventory). Expressed as a decimal
cov_typ          Coverage Category                           X(01)         Code that identifies the category of coverage elected : A = Buyup ; C = CAT ; E = Existing Coverage Policy ; L = Limited Coverage
crop             Commodity Name                              X(30)         Name of the crop/commodity
crop_cd          Commodity Code                              9(04)         The Risk Management Agency (RMA) code that denotes thecrop/commodity for which the policy is issued.
crop_yr          Commodity Year                              9(04)         The identifier that represents the year in which the crop/commodity isnormally harvested and indicates the policy year for which coverage wasprovided.
delivery_sys     Delivery Type                               X(04)         RCAT – Reinsured CAT coverage; RBUP – Reinsured Buyup coverage; FCAT – Federal CAT coverage (RMA or FSA); FBUP – Federal Buyup coverage (RMA or FSA)
edr_acre_qty     Endorsed/Companion Acres                    9(15)         Number of acres insured under an endorsement and/or companion option (e.g. SCO, STAX, Margin Protection)
indem_amt        Indemnity Amount ($)                        S9(15)        The total amount of the loss
ins_plan_ab      Insurance Plan Name Abbreviation            X(05)         Abbreviation of the Insurance Plan Name
ins_plan_cd      Insurance Plan Code                         9(02)         Code that denotes the type of insurance coverage is selected for theinsured crop (e.g.APH, Revenue, Dollar, etc.)
liability_amt    Liability Amount ($)                        9(15)         The maximum dollar amount of insurance for this crop unit line item
lr               Loss Ratio                                  9(04)V9(02)   Ratio of losses to premium (indemnity / total premium)
net_acre_qty     Net Reported Quantity                       9(10)         Number of acres, tons, pounds, etc. reported as being planted adjusted by the insured’s share in the commodity. (e.g. reported acres * insured’s share)
net_acre_typ     Quantity Type                               X(25)         Identifies the type of quantity (e.g. Acres, Tons, Pounds, etc.)
pol_indem_cnt    Policies Indemnified Count                  9(08)         The number of policies for which losses have been reported to RMA
pol_prem_cnt     Policies Earning Premium Count              9(08)         The number of policies for which acreage has been reported to RMA.
pol_sold_cnt     Policies Sold Count                         9(08)         The number of policies reported to RMA as being sold.
pract            Practice Name                               X(50)         The name of the practice for which the policy is issued.
pract_cd         Practice Code                               X(03)         The RMA code of the practice for which the policy is issued denoting a specific farming practice used by the producer (e.g. irrigated, non- irrigated, no practice specified).
state            State Name                                  X(30)         The name of the State in which the insured farm is located.
state_ab         Location StateAbbreviation                  X(02)         USPS state abbreviation
state_cd         Location State Code                         9(02)         The FIPS code that denotes the State in which the insured farm is located.
struct           Unit Structure Name                         X(50)         The name of the unit structure for which the policy is issued.
struct_cd        Unit Structure Code                         X(02)         The RMA code of the unit structure for which the policy is issued.
subsidy          Subsidy Amount ($)                          9(15)         Amount of subsidized premium.
subsidy_add      Additional Subsidy ($)                      9(15)         An additional subsidy from a program or other process. 2021 and 2022 Additional Subsidy represents Pandemic Cover Crop Program amount.
subsidy_efa      EFA Premium Discount ($)                    9(15)         NA
subsidy_prvt     State/Private Subsidy ($)                   9(15)         Subsidy provided by a state or private entity
total_prem       Total Premium Amount ($)                    9(15)         Premium before application of any subsidies. In general, the base premium rate times liability. Also called base premium
typ              Type Name                                   X(50)         The name of the commodity type for which the policy is issued.
typ_cd           Type Code                                   X(03)         The RMA code of the commodity type for which the policy is issued denoting a type, class or variety.
unit_indem_cnt   Units Indemnified Count                     9(12)         The number of units for which losses have been reported to RMA.
unit_prem_cnt    Units Earning Premium Count                 9(12)         The number of units for which acreage has been reported to RMA.
