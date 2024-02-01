---
title: Required Information (Accounts)
---
## Required Information (Accounts)
#### All the data points needed for placing an order

#### Individuals

For successful investment account creation and placing an order, make sure the following information is collected from the investor

**Details about the Investor**

1. Name  (`invp.name`)
2. PAN  (`invp.pan`)
3. Residential Status in India (`invp.tax_status`)
4. Type of the entity (`invp.type`)
4. Gender (`invp.gender`)
5. Birth place details  (`invp.place_of_birth`, `invp.country_of_birth`)
7. Fatca & Crs declaration  (`invp.pep_details`, Tax residency details using `invp.use_default_tax_residences` or one of `invp.first_tax_residency`, `invp.second_tax_residency`, `invp.third_tax_residency`, `invp.fourth_tax_residency` )
8. Financial details (`invp.occupation`, `invp.source_of_wealth`, `invp.income_slab`)
12. Payout bank account (`folio_defaults.payout_bank_account`)
13. Address for communication (`folio_defaults.communication_address` or if NRI `folio_defaults.overseas_communication_address`)
14. Email address for communication (`folio_defaults.communication_email_address`)
15. Phone number for communication (`folio_defaults.communication_mobile_number`)
15. Demat details if opting for demat unit delivery (`folio_defaults.demat_account`)

**Details about Nomination** 

If opting out of nomnination you can skip this. Otherwise provide atleast one nominee details in `folio_defaults.nominee1` and declare the percentage allocation of funds for each nominee in `folio_defaults.nominee1_allocation_percentage`, `folio_defaults.nominee2_allocation_percentage`, `folio_defaults.nominee3_allocation_percentage`. You can add upto 3 nominees to a folio.

1. Name (`related_party.name`)
2. PAN (`related_party.relationship`)

[Follow this](/identity/profiles/individual-investor/) to create an individual investor profile

---

#### Non Individuals

For successful account creation and placing an order, make sure the following information is collected from the investor

**Details about the entity**  
1. Name of the entity (`invpni.entity_name`)
2. Type of the entity (`invpni.type`)
3. Residential status (`invpni.residential_status`)
4. Entity's PAN (`invpni.pan`)
5. Incorporation details (`invpni.incorporation`)
6. Declaration of services provided (`invpni.services_provided`)
7. Entity's Networth (`invpni.networth`)
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
8. Tax residencies(`invp.use_default_tax_residences` or one of `invp.first_tax_residency`, `invp.second_tax_residency`, `invp.third_tax_residency`, `invp.fourth_tax_residency` )

[Follow this](/identity/profiles/non-individual-investor/) to create a non individual investor profile

---

#### Note on data verification

**Email ID and mobile number**  

As part of the regulatory guidelines, the email id and mobile number of the investor has to be verified for its validity. You can use any method of your choice to do the verification. Sending an OTP or a link is the most common method.  
Currently we don't offer APIs for email and mobile verification. FP APIs assume that the verification is done at your end.

**Bank Account**  

As part of the regulatory requirement, you need to verify the account ownership of the bank account given by the investor. There are two ways you can do the verification at present:  
a) Penny drop and match the bank a/c holder name that is returned, with the investor name  
b) Accept a cancelled cheque copy from the investor and manually match the name on the cheque with the investor name

The names may not match 100% all the time. You have to be reasonably sure that the a/c belong to the investor. There are no set guidelines on what should be the match %.
You can use FP's [bank a/c verification service](/identity/verification/perform-bank-account-verification/) or use your own mechanism to verify.
