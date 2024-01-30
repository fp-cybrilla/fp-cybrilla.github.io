---
title: Create an investor profile (Individual)
---
## Create an investor profile (Individual)
#### Learn dealing with individual investor's data

Capture the following data points for an individual investor.

- Demographic information
- Financial details: [bank a/c](/identity/profiles/bank-accounts/) and [demat a/c](/identity/profiles/demat-accounts/)
- Contact details: [address, telephone number, email address](/identity/profiles/contact-details/)
- [Related parties](/identity/profiles/related-parties/)
- [Fatca & Crs declaration](/identity/profiles/fatca-crs-individuals/)

**1. Create profile**  
Call [FPDocs, create individual investor](https://fintechprimitives.com/docs/api/#create-an-non-individual-investor-profile) with the following json (the minimum required information to create)

```json
{
  "type": "individual"
}
```
An investor profile will be created. Use the `id` from the response object to call the other apis below.

**2. Update profile as you keep collecting more information from your customer**  
Call [FPDocs, update individual investor](https://fintechprimitives.com/docs/api/#modify-an-investor-profile) with the following json

```json
{
  "pan": "arrpp7775n",
  "tax_status": "resident_individual",
  "name": "Tony Soprano",
  "date_of_birth": "2002-09-18",
  "gender": "male"
}
```
`tax_status` attribute captures the India income tax residential status of the investor for that financial year as known at the time of capturing this information.

The following information cannot be changed once captured: `type`, `tax_status`, `pan`, `date_of_birth`, `country_of_birth` and `place_of_birth`.
