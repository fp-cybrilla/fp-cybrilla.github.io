---
title: Restoration of KYC services
---
##  Restoration of KYC services
#### Restarting KYC services with Axis AMC

The KYC services which were earlier discontinued has now been restored and FP customers can perform fresh KYC of non compliant resident individual investors via our new partner i.e Axis AMC.

### Highlights of changes
1. Aadhaar will be used as both identity proof and address proof going forward.
2. Addition of 9 new attributes to KYC request object
  - FATCA fields which were optional earlier and are now mandatory has to be collected  (Income slab, Political Exposure)
  - Fields whose values were earlier derived from tax status have to be explicitly collected (Nationality)
  - Additional FATCA attributes required due to recent changes at KRAs.(Place of birth, Citizenship countries, Non Indian tax residencies if any) 
3. Bank account details and IPV Video are no longer needed to perform KYC via AXIS AMC. If provided, the details will be ignored.
4. Definitions of the states

### Details of these changes
#### 1. Aadhaar will be used as both identity proof and address proof going forward
Going ahead, only Aadhaar will be the supported proof type for both identity and address. All other types of proof like Passport, Voter Id etc will no longer be supported. 

**Why?**  
- This is due to the fact that fresh KYC will be successful only if the KRA is able to validate the investor's record with the corresponding Aadhaar
- By doing this, we can also pick the investors' photo and address details as present in Aadhaar which would avoid prompting your investors to share these details, thereby resulting in a better UX

**How do I use Aadhaar as identity proof and address proof?**  
- You have to create an Identity Document with type = aadhaar
- FP will then fetch the aadhaar details from the investor's Digilocker account once the investor has authorised the same
- You will have to use the ID of Identity Document and append it against identity_proof and address.proof attributes in the kyc_request

> We will use photo and address present in Aadhaar and you don't have to share these details explicitly.  

#### 2: Addition of 9 new attributes to KYC request object -
We have modified the `kyc_request` object to explicitely collect some FATCA details of the investor based on recent regulatory changes. Previously some of these fields were non-mandatory and some of them were to be assumed based on the investor's tax status. The newly added attributes as per compliance requirements are as listed down -

| **Attribute** | **Type** | **Description** |
| - | - | - |
| `citizenship_countries` | array | List of countries where the investor has a citizenship. Currently only one value is supported |
| `nationality_country` | string | ANSI code of investor's country of nationality |
| `place_of_birth` | string | Text input of investor's birth place |
| `income_slab` | string | Investor's income slab. Allowed values are - `upto_1lakh`, `above_1lakh_upto_5lakh`, `above_5lakh_upto_10lakh`, `above_10lakh_upto_25lakh`, `above_25lakh_upto_1cr`, `above_1cr` |
| `pep_details` |string|To determine if the investor is politically exposed or related to a politically exposed person. Allowed values are - `pep_exposed`, `pep_related`, `not_applicable` |
| `tax_residency_other_than_india`|boolean|If investor is a tax payer in any country other than India, you have to explicitly declare the same. Allowed values are `true` or `false`| 
| `non_indian_tax_residency_1` | hash | If investor is a tax payer in any country other than India, such details have to mentioned here. This is an optional input |
| `non_indian_tax_residency_2` | hash | If investor is a tax payer in any country other than India, such details have to mentioned here. This is an optional input |
| `non_indian_tax_residency_3` | hash | If investor is a tax payer in any country other than India, such details have to mentioned here. This is an optional input |

##### Non Indian Tax Residency hash details 

| **Attribute** | **Type** | **Description** |
| - | - | - |
| `country` | string | ANSI code of the country where the investor is a tax payer. This is mandatory if the `non_indian_tax_residency` hash is given in the `kyc_request` object |
| `taxid_number` | string | Investor's tax identification number in the corresponding country. This is mandatory if the `non_indian_tax_residency` hash is given in the `kyc_request` object |

The kyc_request object with all these changes, would look like below -
```json
{
  "object": "kyc_request",
  "id": "kycr_724198d524004ceb8ba8203d06a32e26",

  "status": "successful",

  "name": "Rani Gupta",
  "pan": "SKLPA9239S",
  "aadhaar_number": "1210",
  "father_name": "Rajesh Gupta",
  "mother_name": "",
  "spouse_name": "",
  "gender": "female",
  "date_of_birth": "1980-10-19",
  "marital_status": "unmarried",
  "country_of_birth": "in",
  "residential_status": "resident_individual",
  "occupation_type": "private_sector",

  "citizenship_countries": ["in"],
  "nationality_country": "in",
  "country_of_birth": "in",
  "place_of_birth": "in",
  "income_slab": "above_25lakh_upto_1cr",
  "pep_details": "not_applicable",
  "tax_residency_other_than_india": true,
  "non_indian_tax_residency_1": {
    "country": "us",
    "taxid_number": "SSN0123890AS"
  },
  "non_indian_tax_residency_2": null,
  "non_indian_tax_residency_3": null,
  
  "email": "rani@example.com",
  "mobile": {
    "isd": "+91",
    "number": "8160597103"
  },
  
  "signature": "file_9109577dfdc04c239e740684eed3d952",
  "identity_proof": "iddoc_a6408e3bc7404706baef39aec303f51b",
  
  "address": {
    "proof": "iddoc_a6408e3bc7404706baef39aec303f51b",
    "proof_type": "aadhaar",
  },

  "geolocation": {
    "latitude": 12.354,
    "longitude": 77.453
  },

  "bank_account": null,
  "photo": null,
  "ipv_video": null,
  "otp": null,
  
  "requirements": {
    "fields_needed": []
  },
  
  "verification": {
    "status": "pending",
    "details": null,
    "details_verbose": null
  }
  
  "created_at": "2019-11-09T13:26:38.946+0530",
  "updated_at": "2019-11-09T13:28:38.946+0530",
  "expires_at": "2019-11-14T13:26:38.946+0530",
  "esign_required_at": null,
  "submitted_at": null,
  "successful_at": null,
  "rejected_at": null,
}
```


#### 3: Bank account details and IPV Video are no longer needed to perform KYC
- Bank account details are collected for AMC compliance reasons and currently these are not required for KYC processing with Axis AMC. These details will be ignored if shared in the API.
- Additionally, since liveliness of investor is verified via Aadhaar fetching from Digilocker, the IPV Video can also be skipped and will be ignored if shared in the API.


#### 4: Definitions of states -
The definition of all the states are as follows -

| **State**  | **Definition**                    |
|------------|--------------------------------|
| pending  | Record created but incomplete |
| esign_required | Required fields are all provided; KYC application is ready to be esigned |
| submitted  | Investor has successfully submitted the esigned KYC application |
| successful  | The KRA has accepted the KYC application |
| rejected  | Submission to KRA failed |
| expired | The KYC request has been expired |