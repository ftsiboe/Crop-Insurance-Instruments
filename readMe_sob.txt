Database was last updated on 2024-08-19 15:10:53.792885
 
For additional details, please contact Francis Tsiboe at francis.tsiboe@usda.gov or ftsiboe@hotmail.com

Type of Summary of Business
      SOBSCC    : Summary of Business Historical Data by State/County/Crop 
      SOBCOV    : Summary of Business Historical Data by State/County/Crop/Coverage Level

Raw data sources: https://legacy.rma.usda.gov/data/sob/scc/index.html

Definitions for each data column in the file are included below. All columns are as they appear in RMA's Summary of Business files. 

Column           Name                               	  Definition
crop_yr          Commodity Year.                     	  The identifier that represents the year in which the crop/commodity is normally harvested and indicates the policy year for which coverage was provided.
state_ab         Location State Abbreviation.         	  USPS state abbreviation
state_cd         Location State Code.                	  The FIPS code that denotes the State in which the insured farm is located.
county           Location County Name               	  Name of the county.
county_cd        Location County Code               	  The FIPS code that denotes the County in which the insured farm is located.
crop             Commodity Name                     	  Name of the crop/commodity
crop_cd          Commodity Code                     	  The Risk Management Agency (RMA) code that denotes the crop/commodity for which the policy is issued.

ins_plan_ab      Insurance Plan Name Abbreviation   	  Abbreviation of the Insurance Plan Name
ins_plan_cd      Insurance Plan Code                	  Code that denotes the type of insurance coverage is selected for the insured crop (e.g. APH, YP, RP, etc.)
delivery_sys     Delivery Type                            RCAT – Reinsured CAT coverage; RBUP – Reinsured Buyup coverage; FCAT – Federal CAT coverage (RMA or FSA); FBUP – Federal Buyup coverage (RMA or FSA)
cov_lvl          Coverage Level                     	  Elected by the insured, its complement is the deductible. The base to which it applies differs by insurance plan (e.g. - yield, revenue, dollar, or inventory).

pol_indem_cnt    Policies Indemnified Count               The number of policies for which losses have been reported to RMA
pol_prem_cnt     Policies Earning Premium Count           The number of policies for which acreage has been reported to RMA.
pol_sold_cnt     Policies Sold Count                      The number of policies reported to RMA as being sold.
unit_indem_cnt   Units Indemnified Count                  The number of units for which losses have been reported to RMA.
unit_prem_cnt    Units Earning Premium Count              The number of units for which acreage has been reported to RMA.

net_acre_typ     Reporting Level Type               	  The description of the quantity type associated with Net Commodity Reporting Level Amount. Values include acres, tons, colonies, pounds, or trees.
net_acre_qty     Net Reported Quantity              	  Number of acres, tons, pounds, etc. reported as being planted adjusted by the insured’s share in the commodity. (e.g. reported acres * insured’s share)
edr_acre_qty     Endorsed/Companion Acres                 Number of acres insured under an endorsement and/or companion option (e.g. SCO, STAX, Margin Protection)

liability_amt    Liability Amount ($)               	  The maximum dollar amount of insurance for this crop unit line item
total_prem       Total Premium Amount ($)           	  Premium before application of any subsidies. In general, the base premium rate times liability. Also called base premium
subsidy          Subsidy Amount ($)                 	  Amount of subsidized premium.
subsidy_add      Additional Subsidy ($)                   An additional subsidy from a program or other process. 2021 and 2022 Additional Subsidy represents Pandemic Cover Crop Program amount.
subsidy_efa      EFA Premium Discount ($)                 NA
subsidy_prvt     State/Private Subsidy ($)                Subsidy provided by a state or private entity
indem_amt        Indemnity Amount ($)               	  The total amount of the loss
lr               Loss Ratio                               Ratio of losses to premium (indemnity / total premium)


