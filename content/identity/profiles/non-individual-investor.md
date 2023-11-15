---
title: Create an investor profile (Non Individual)
---
## Create an investor profile (Non Individual)
#### Learn dealing with non individual investor's data

Capture the following data points for a non individual investor.

- Entity information
- Financial details: [bank a/c](/identity/profiles/bank-accounts/) and [demat a/c](/identity/profiles/demat-accounts/)
- Contact details: [address, telephone number, email address](/identity/profiles/contact-details/)
- [Beneficial owner details](/identity/profiles/beneficial-owners/)
- [Fatca & Crs declaration](/identity/profiles/fatca-crs/)

1. Create profile  
Call [FPDocs, create non individual investor](https://fintechprimitives.com/docs/api/#create-an-non-individual-investor-profile) with the following json (the minimum required information to create)
```json
{
    "entity_name": "ABC Infotech Private Ltd.",
    "type": "private_limited"
}
```
An investor profile (non individual) will be created. Use the `id` from the response object to call the other apis below.

2. Update profile as you keep collecting more information  
Call [FPDocs, update non individual investor](https://fintechprimitives.com/docs/api/#modify-an-non-individual-investor-profile) with the following json
```json
{
    "pan": "arrpc7775n",
    "residential_status": "resident"
}
```

`residential_status` attribute captures the India income tax residential status of the investor for that financial year as known at the time of capturing this information.

<!--
### Resources
To download a Postman collection to create non individual investor profile click <a href="/resources/onbording_postman_collection.json" download="" title="download">here</a>.
-->
