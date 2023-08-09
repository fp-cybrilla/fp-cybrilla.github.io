---
title: Investment account for private limited company
---

> Read about the [Alpha program](/upcoming/alpha/overview)

## Open an investment account for a private limited company

#### Use this guide to create an investment account for your private limited company

Follow the below steps to create a profile for private limited company, business details, beneficiaries, authorised persons and an investment account before placing orders.

#### 1. Create a non individual profile for private limited company

The following information about the private limited company is needed to set up investment account

1. Type of entity (private limited)
2. PAN number of the company
3. Email ID and mobile number
4. Residential status (basis the country from where more than 50% of company's managmenet is carried out for the financial year)
5. Address 
6. Bank account details
7. Occupation
8. Other info (political exposure of the company)
9. Tax identification details eg. GIIN and country of GIIN registration if applicable
10. Tax exemption category if country of incorporation or country of tax residence  is US


Refer API docs to create [non individual profile](https://fintechprimitives.com/docs/api/#create-an-investor-profile), [phone numbers](https://fintechprimitives.com/docs/api/#create-a-phone-number), [bank accounts](https://fintechprimitives.com/docs/api/#create-a-bank-account), and [email addresses](https://fintechprimitives.com/docs/api/#create-an-email-address).

Sample Request

```json
{
  "type": "non-individual",
  "residential_status": "resident_individual",
  "name": "name_of_business",
  "date_of_birth": "2002-09-18", //Date of incorporation of business
  "occupation": "business",
  "pan": "DWECS2837G", 
  "country_of_birth": "IN",  //Country of incorporation of business
  "use_default_tax_residences": "false",
  "first_tax_residency": {
    "country": "US",
    "taxid_type": "giin",
    "taxid_number": "giin_number"
  },
  tax_exemption_category:"not_applicable",
  "pep_details": "not_applicable",
  "ip_address": "192.92.12.39"
}
```

### Note on data verification

#### Email ID and mobile number

As part of the regulatory guidelines, the email id and mobile number of the private limited company has to be verified for its validity. You can use any method of your choice to do the verification. Sending an OTP or a link is the most common method.  
Currently we don't offer APIs for email and mobile verification. FP APIs assume that the verification is done at your end.

#### Bank Account

As part of the regulatory requirement, you need to verify the account ownership of the bank account given by the private limited company. There are three ways you can do the verification at present:  
a) Conduct penny drop validation and match the bank a/c holder name that is returned, with the private limited company
b) Accept a cancelled cheque copy and manually match the name on the cheque with the private limited company
c) Use FP's bank account verification service 

The names may not match 100% all the time. You have to be reasonably sure that the a/c belongs to the sole proprietor. There are no set guidelines on what should be the match %.

Refer API doc for [FP's Bank verification service](https://fintechprimitives.com/docs/api/#create-bank-verification)

#### 2. Check the private limited company's kyc status

Depending on the private limited company's kyc status, you might need to collect additional information. Use the [kyc check guide](/identity/kyc-check) to learn how to check the kyc status. The KYC will be peformed for PAN of the private limited company in this case.

#### 3. Perform digital kyc _conditional step for the private limited company_

As part of the regulatory guidelines, KYC of the private limited company must be completed before making investments.
Currently we don't offer APIs for private limited company's KYC application. You can complete the KYC application processing at your end and use FP's [kyc check guide](/identity/kyc-check)  to determine the succfessful completion of KYC verification before proceeding with investments


#### 4. Create business details

The following information about the private limited company is needed to  set up investment account

1. Net worth amount
2. Net worth as on date
3. Category i.e  `Foreign financial institute(FFI)`, `Non financial foreign entity (NFFE)`, `Not applicable`
4. Sub category applicable if business category is `NFFE` Possible values are active or passive NFFE, related to listed company
5. Sub category reason applicable  if business sub category is active NFFE.  
6. Type applicable if sub category is active or passive NFFE. Possible values are  `software`, `manufacturing`, etc
7. Service provided


Sample Request

```json
{
  "profile": "invp_9abd706565144b83947f4b498bc95e98",
  "net_worth": "500000",
  "net_worth_as_on": "2023-07-18",
  "category": "not_applicable",
  "sub_category": null,
  "sub_category_reason": null,
  "type": null,
  "services_provided": "others",

}
```
#### 5. Create related parties

Beneficiaries and authorised persons should be added as the related parties to a private limited company's profile. You can create the related parties after the individual investor profile is setup each of beneficiary and authorised person as below.

##### 5.1 Check the individual's kyc status

Depending on the individual's kyc status, you might need to collect additional information. Use the [kyc check guide](/identity/kyc-check) to learn how to check the kyc status. The KYC will be peformed for the individual's PAN
If the individual is kyc compliant, skip step 5.3 and jump to step 5.4 directly.

##### 5.2 Create an individual investor profile for a beneficiary or authorised person

Refer [investor profile](https://fintechprimitives.com/docs/api/#create-an-investor-profile). Choose type as `individual` and respective residential status.

##### 5.3 Perform digital kyc _conditional step for the individual_

You need to collect the following additional details about the investor apart from the details collected in step 5.2:

1. Mother's name in full
2. Last 4 digits of the Aadhaar number
3. Father or spouse name
4. Marital status
5. Address proof
6. Individual's PAN card copy
7. Photo of signature on a white paper
8. Photograph of individual
9. In person verification video
10. Personal bank account belonging to the individual. If the business name of the sole proprietor is different, then ensure that the bank account belongs to indvidual and not the sole proprietor business.
11. A signed cancelled cheque copy of the  personal bank account
12. Geo location
13. Electronic signature on the application form

Refer [API doc](/identity/kyc-request) to perform digital kyc verification.

##### 5.4 Map beneficiaries and authorised person as related parties to the private limited company

Refer [related party API](https://fintechprimitives.com/docs/api/#create-a-related-party) to associate the beneficariay and authorised persons to the company.

Sample Requests

```json
{
  "profile": "invp_9abd706565144b83947f4b498bc95e98",
  "related_party": "invp_r65d706565144b83947f4b498bc96776",
  "relationship": "director"
}

{
  "profile": "invp_9abd706565144b83947f4b498bc95e98",
  "related_party": "invp_83d7206565144b83947f4b498bc95263",
  "relationship": "employee"
}
```

#### 6. Create an investment account

To avoid any rejection of orders, make sure the private limited company and all related parties are KYC compliant before creating an investment a/c.

Refer API doc for [investment account creation](https://fintechprimitives.com/docs/api/#create-an-mf-investment-account) with the following json. Use the investor id received in step 1 to create an investment account.

Sample Request

```json
{
  "primary_investor": "invp_9abd706565144b83947f4b498bc95e98",
  "holding_pattern": "single"
}
```
> Only single holding pattern is allowed for a private limited company

#### 7. Set folio defaults in the investment account

Update beneficiaries and authorised persons in the investment account's folio default hash. This will ensure that the beneficiary details are added to the private limited company's folios. Authorised persons will be allowed to place buy or sell orders on behalf of the private limited company.

Refer API doc for [investment account updation](https://fintechprimitives.com/docs/api/#update-an-mf-investment-account) with following json. Use the investor id received in step 1 to create an investment account.

Sample request

```json
{
  "id": "mfia_14bafabfbfbc423d9b54412dd577981b",
  "folio_defaults": {
      "beneficiary1":"relp_r65d706565144b83947f4b498bc96776",
      "beneficiary2":null,
      "beneficiary3":null,
      "authorised_person1":"relp_9abd706565144b83947f4b498bc95e98",
      "authorised_person2":null,
      "authorised_person3":null

  }
}
```

## Place mutual fund orders for  private limited company 

#### 1. Purchase mutual funds

Only authorised persons will be allowed to place orders. Authorised persons will need login using thier individual profile login and access the  `investment_account_id` of the private company to place the purchase orders on behalf. This can be fetched by PAN at any time.

Once investment account is created, [one time](https://docs.fintechprimitives.com/mf-transactions/orders-introduction/) or [recurring orders](https://docs.fintechprimitives.com/mf-transactions/transaction-plans/) can be placed.

#### 2. View folio details

Once the orders are processed, folios will be created. Authorised persons will be able to view all the folios. Folio's tax status will be marked as `Private_limited`

Refer API doc to [fetch a folio](https://fintechprimitives.com/docs/api/#fetch-all-folios)

#### 3. Redeem mutual funds

Authorised persons will need need `investment_account_id` and `folio_number` to place redemption orders.

Refer API doc to [place redemption orders](https://fintechprimitives.com/docs/api/#create-a-mf-redemption)

