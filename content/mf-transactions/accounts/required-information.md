---
title: Required Information (Accounts)
---
## Required Information (Accounts)
#### All the data points needed for placing an order

<!-- Investment account is the holding account for all your investor's mutual fund investments.

Call [FPDocs, create investment a/c]() with the following json

```json
{
  "primary_investor": "invpni_c55240e4b09d4617812bb9557b399a42",
  "folio_defaults": {
    "communication_email_address": "email_bf1026954d0545e190727de1537d9e66",
    "communication_mobile_number": "phone_0f4a90134705474eb2e354d9b5ba5f56",
    "communication_address": "addr_8c50b6930ebf4ec7a7ddd58c34bdf1d8",
    "payout_bank_account": "bac_8c50b6930ebf4ec7a7ddd58c34bdf1d8"
  }
}
```

FP uses the information in `folio_defaults` while creating a new folio

--- -->

#### Non Individuals

For successful account creation and placing an order, make sure the following information is collected from the investor

**Details about the entity**  
1. Name of the entity (`innvpni.entity_name`)
2. Type of the entity (`innvpni.type`)
3. Residential status (`innvpni.residential_status`)
4. Entity's PAN (`innvpni.pan`)
5. Incorporation details (`innvpni.incorporation`)
6. Declaration of services provided (`innvpni.services_provided`)
7. Entity's Networth (`innvpni.networth`)
8. Beneficial owner details (not required if the investor is a listed company)
9. Fatca & Crs declaration (`tax_residencies`, `invpni.specified_us_person_exemption`, `invpni.entity_classification`)
10. Payout Bank Account (`folio_defaults.payout_bank_account`)
10. Address for communication (`folio_defaults.communication_address`)
11. Email address for communication (`folio_defaults.communication_email_address`)
12. Phone number for communication (`folio_defaults.communication_mobile_number`)

**Details about Beneficial Owners** (currently we support beneficial owners who have an Indian PAN)  

1. Name (`invp.name`)
2. PAN (`invp.pan`)
3. Residential Status in India (`invp.tax_status`)
4. Gender (`invp.gender`)
5. Place of birth (`invp.place_of_birth`)
6. Country of birth (`invp.country_of_birth`)
7. Address (with nature)
8. Tax residencies


#### Individuals

For successful account creation and placing an order, make sure the following information is collected from the investor

**Details about the Investor**

1. Name  (`invp.name`)
2. PAN  (`invp.pan`)
3. Residential Status in India (`invp.tax_status`)
4. Gender (`invp.gender`)
5. Place of birth (`invp.place_of_birth`)
6. Country of birth (`invp.country_of_birth`)
7. Tax residencies (`invp.first_tax_residency, invp.second_tax_residency etc`)
8. Occupation (`invp.occupation`)
9. Source of wealth (`invp.source_of_wealth`)
10. Income slab (`invp.income_slab`)
11. Investor politics exposure  (`invp.pep_details`)
12. Payout Bank Account (`folio_defaults.payout_bank_account`)
13. Address for communication (`folio_defaults.communication_address`)
14. Email address for communication (`folio_defaults.communication_email_address`)
15. Phone number for communication (`folio_defaults.communication_mobile_number`)
