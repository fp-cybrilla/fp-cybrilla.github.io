---
title: Partner tagging
---

## Partner tagging 
#### Learn how to tag partners to orders

Partner is your business partner who helps in distributing mf schemes. Partners can be of different types. FP currently supports sub-brokers

#### Onboard a partner
You can onboard a sub-broker by providing his ARN number and associated EUINs.

Call [FPDocs, create parnter](https://fintechprimitives.com/docs/api/#create-a-partner) with the following json

```json
{
    "name": "Harish Gupta",
    "license_code": "ARN-123456",

    // this is your internal reference number for the partner
    // use the same code for both cams and karvy
    "default_broker_codes": {
        "cams": "SB9876",
        "karvy": "SB9876"
    },
    "location": "Bangalore",

    // euins mapped to the above ARN, which you'll use
    "euins": ["E123456"]
}
```

#### Tag orders
You can pass partner references while creating onetime and recurring orders.

Example: creating `mf_purchase`  
```json
{
    // skipping other attributes for brevity

    // fp object id of the partner
    "partner": "ptnr_234234234sdfdf",
    
    // This should be available in the list of euins in partner profile
    "euin": "E123456"
}
```
