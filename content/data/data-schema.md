---
title: Data Schema
---
## Data Schema
#### Learn what data is available

FP data schema is modeled to be as close as possible to the FP API Objects. Refer the [FPDocs, API Documentation](https://fintechprimitives.com/docs/api/) to understand the meaning of each column.

#### Dataset
The following tables are available

**Reference Data**  
`amcs`, `fund_details`, `holdings`, `data_sync_info`  

**Investor Related**  
`addresses`,  `bank_accounts`, `investor_contact_details`, `investor_profile`, `kyc_request`  

**Payments Related**  
`mandate`  

**Orders Related**  
`mf_folio`, `mf_investment_account`, `mf_purchase`, `mf_redemption`, `mf_switch`, `mf_purchase_plan`, `mf_redemption_plan`  

The table `data_sync_info` contains metadata about when the data was synced. You can use that information in your queries.

#### Data Availability
The data for a given day (all activity from 12am to 12midnight) is available to query, by 6am the following day.