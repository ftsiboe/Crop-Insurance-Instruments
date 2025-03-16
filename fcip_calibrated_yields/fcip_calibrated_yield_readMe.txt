 
Database was last updated on 2024-08-19 15:10:53.792885
 
For additional details, please contact Francis Tsiboe at francis.tsiboe@usda.gov or ftsiboe@hotmail.com

Definitions for each data column in the file are included below. All columns, with the exception of `yield_raw` and `yield_adj`, are as they appear in RMA's Summary of Business files. 

Column           Name                               	  Definition
crop_yr          Commodity Year.                     	  The identifier that represents the year in which the crop/commodity is normally harvested and indicates the policy year for which coverage was provided.
state            State Name.                        	  The name of the State in which the insured farm is located.
state_ab         Location State Abbreviation.         	  USPS state abbreviation
state_cd         Location State Code.                	  The FIPS code that denotes the State in which the insured farm is located.
county           Location County Name               	  Name of the county.
county_cd        Location County Code               	  The FIPS code that denotes the County in which the insured farm is located.
crop             Commodity Name                     	  Name of the crop/commodity
crop_cd          Commodity Code                     	  The Risk Management Agency (RMA) code that denotes the crop/commodity for which the policy is issued.
typ              Type Name                          	  The name of the commodity type for which the policy is issued.
typ_cd           Type Code                          	  The RMA code of the commodity type for which the policy is issued denoting a type, class or variety.
pract            Practice Name                      	  The name of the practice for which the policy is issued.
pract_cd         Practice Code                      	  The RMA code of the practice for which the policy is issued denoting a specific farming practice used by the producer (e.g. irrigated, non- irrigated, no practice specified).
struct           Unit Structure Name                	  The name of the unit structure for which the policy is issued.
struct_cd        Unit Structure Code                	  The RMA code of the unit structure for which the policy is issued.
ins_plan_ab      Insurance Plan Name Abbreviation   	  Abbreviation of the Insurance Plan Name
ins_plan_cd      Insurance Plan Code                	  Code that denotes the type of insurance coverage is selected for the insured crop (e.g. APH, YP, RP, etc.)
cov_lvl          Coverage Level                     	  Elected by the insured, its complement is the deductible. The base to which it applies differs by insurance plan (e.g. - yield, revenue, dollar, or inventory).
net_acre_qty     Net Reported Quantity              	  Number of acres, tons, pounds, etc. reported as being planted adjusted by the insured’s share in the commodity. (e.g. reported acres * insured’s share)
comm_typ         Reporting Level Type               	  The description of the quantity type associated with Net Commodity Reporting Level Amount. Values include acres, tons, colonies, pounds, or trees.
liability_amt    Liability Amount ($)               	  The maximum dollar amount of insurance for this crop unit line item
total_prem       Total Premium Amount ($)           	  Premium before application of any subsidies. In general, the base premium rate times liability. Also called base premium
subsidy          Subsidy Amount ($)                 	  Amount of subsidized premium.
indem_amt        Indemnity Amount ($)               	  The total amount of the loss
yield_raw        Raw Calibrated yield (bu/acre)	          The raw calibrated yield
yield_adj        Benchmarked Calibrated yield (bu/acre)	  The raw calibrated yield benchmarked to RMA historical yields


