---
title: ONDC Gateway
---
## ONDC Gateway
#### Process orders through ONDC Gateway

#### Lumpsum Purchase
The following changes are required compared to [RTA gateway workflow](/mf-transactions/onetime-purchases/)  

1. Check if a fund scheme is available on ondc  
GET `/ondc_schemes?store=cybrilla`  
Gets you a list of ISINs that are available on ondc  
```jsonc
{
    "object": "list",
    "data": [
        {"isin": "INF277K010L9"},
        {"isin": "INF587K055B2"}
    ]
}
```

2. Use `gateway` as `ondc` while creating `mf_purchase`

3. Get the terms and conditions to be shown to the investor from `terms_and_conditions` attribute of `mf_purchase`

4. Use `provider_name` as `ondc` while creating payments
