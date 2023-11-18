---
title: Data
---
## Data
#### Learn how to access and get insights of your data

>FP's data offering is in beta and available to only select customers

With FP, you can access all your transactional data in the following ways

1. Query your data on FP Dashboard
2. Get your data pushed into your data warehouse

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

#### Querying

Using the query editor,
1. Write custom sql queries to extract information in the format that suits your use case.
2. Export data in csv format
3. Schedule automatic fetch of your data (coming up)

For example, use the below query to fetch list of active purchase plans with next installment due in 2 days
```sql
SELECT
mf_investment_account,
id,
scheme,
amount,
next_installment_date
FROM mf_purchase_plan
WHERE
state = 'active'
and next_installment_date is not null
and next_installment_date >= current_date
and next_installment_date <= (current_date + interval '2' day)
```