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
`addresses`,  `bank_accounts`, `investor_profiles`, `kyc_requests`, `demat_accounts`, `email_addresses`, `phone_numbers`, `related_parties`

**Payments Related**  
`mandates`

**Orders Related**  
`mf_folios`(`mf_folio_bank_accounts`, `mf_folio_addresses`), `mf_investment_accounts`, `mf_purchases`, `mf_redemptions`, `mf_switches`, `mf_switch_plans`, `mf_purchase_plans`, `mf_redemption_plans`, `transactions`

The table `data_sync_info` contains metadata about when the data was synced. You can use that information in your queries.

#### Data Availability
The data for a given day (all activity from 12am to 12midnight) is available to query, by 6am the following day.