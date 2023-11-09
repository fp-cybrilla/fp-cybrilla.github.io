---
title: Create an investor profile (Non Individual)
---
## Create an investor profile (Non Individual)
#### Learn dealing with non individual investor's data

Capture the following data points for a non individual investor.

- Entity information
- Financial details: bank a/c and demat a/c
- Contact details: address, telephone number and email address
- [Beneficial owner details](/identity/profiles/beneficial-owners/)
- [Tax residencies](/identity/profiles/tax-residencies/)

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

3. Add address, bank a/c, demat a/c, beneficiary owner details, tax residencies as needed  
Call [FPDocs, create address](https://fintechprimitives.com/docs/api/#create-an-address) with the following json
```json
{
    "profile": "invpni_9abd706565144b839324df4b498bc95e98",
    "line1": "1661, 27th main, hsr layout",
    "postal_code": "560102",
    "country": "in"
}
```

Call [FPDocs, create bank a/c](https://fintechprimitives.com/docs/api/#create-a-bank-account) with the following json
```json
{
    "profile": "invpni_9abd706565144b839324df4b498bc95e98",
    "account_number": "9876543210",
    "primary_account_holder_name": "ABC Infotech Private Ltd.",
    "type": "current",
    "ifsc_code": "ICIC0000047"
}
```
<!--
### Resources
To download a Postman collection to create non individual investor profile click <a href="/resources/onbording_postman_collection.json" download="" title="download">here</a>.
-->