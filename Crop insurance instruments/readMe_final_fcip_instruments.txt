Database was last updated on 2024-08-19 15:10:53.792885
 
For additional details, please contact Francis Tsiboe at francis.tsiboe@usda.gov or ftsiboe@hotmail.com

Definitions for each data column in the file are included below 

crop_yr:The identifier that represents the year in which the crop/commodity is normally harvested and indicates the policy year for which coverage was provided.

state_ab: USPS state abbreviation

state_cd: The FIPS code that denotes the State in which the insured farm is located.

county: Name of the county.

county_cd: The FIPS code that denotes the County in which the insured farm is located.

crop: Name of the crop/commodity

crop_cd: The Risk Management Agency (RMA) code that denotes the crop/commodity for which the policy is issued.

tau_sob: An approximation of the “target rate” as described by (Tsiboe & Turner, 2023). Tau effectively tracks changes in the cost of crop insurance that are plausible exogenous to any one producer. It is estimaetd from historic SOB data

tau_adm: An approximation of the “target rate” as described by (Tsiboe & Turner, 2023). Tau effectively tracks changes in the cost of crop insurance that are plausible exogenous to any one producer. It is estimaetd by aggregating directly from RMA’s actuarial data master 

tau_final: Same as tau_adm with missing data filled in with tau_sob (as is). 

subsidy_rate_65: national subsidy rate for 65% coverage level individual crop insurance policies. Constructed as described by (Yu et al., 2018), see footnote on Figure 1. This can be used as an instrument on its own or interacted with tau for greater temporal variation.

subsidy_rate_75: national subsidy rate for 65% coverage level individual crop insurance policies. Constructed as described by (Yu et al., 2018), see footnote on Figure 1. This can be used as an instrument on its own or interacted with tau for greater temporal variation.


