---
title: Data
---
## Data
#### Learn how to access and get insights of your data

>FP's data offering is in beta and available to only select customers

With FP, you can access all your transactional data in the following ways

1. Query your data on FP Dashboard
2. Get your data pushed into your data warehouse

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

#### Get data in your data lake

FP makes your data available in your data lake setup in Apache Iceberg format. You can connect and query from any query engine that support Iceberg format like Amazon Athena, Google BigQuery etc.
