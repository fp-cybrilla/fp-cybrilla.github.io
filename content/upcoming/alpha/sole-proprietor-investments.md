---
title: Investment account for sole proprietor
---

> Read about the [Alpha program](/upcoming/alpha/overview)

## Open an investment account for a sole proprietor

#### Use this guide to create an investment account for your sole proprietor

A sole proprietor business is owned by a single person and hence is identified using the individual investor. Follow the below steps to create an investor, sole proprietor business details and an investment account before placing orders.

#### 1. Create an investor

The following information about the investor is needed to set up investment account

1. Full name of the investor
2. PAN number of the investor
3. Email ID and mobile number of the investor
4. Date of birth
6. Gender
7. Country of birth (Country code)
9. Residential status
10. Occupation
11. Address
12. Source of wealth
13. Bank account details
14. Nominee details
15. Country of citizenship
16. Other info (political exposure of the investor, Country of tax residence other than India)

Refer API docs to create [investor profile](https://fintechprimitives.com/docs/api/#create-an-investor-profile), [phone numbers](https://fintechprimitives.com/docs/api/#create-a-phone-number), [bank accounts](https://fintechprimitives.com/docs/api/#create-a-bank-account), [email addresses](https://fintechprimitives.com/docs/api/#create-an-email-address), [nominees](https://fintechprimitives.com/docs/api/#create-a-related-party).

### Note on data verification

#### Email ID and mobile number

As part of the regulatory guidelines, the email id and mobile number of the investor has to be verified for its validity. You can use any method of your choice to do the verification. Sending an OTP or a link is the most common method.  
Currently we don't offer APIs for email and mobile verification. FP APIs assume that the verification is done at your end.

#### Bank Account

As part of the regulatory requirement, you need to verify the account ownership of the bank account given by the sole proprietor. There are three ways you can do the verification at present:  
a) Conduct penny drop validation and match the bank a/c holder name that is returned, with the sole proprietor name  
b) Accept a cancelled cheque copy and manually match the name on the cheque with the sole proprietor name 
c) Use FP's bank account verification service 

The names may not match 100% all the time. You have to be reasonably sure that the a/c belongs to the sole proprietor. There are no set guidelines on what should be the match %.

Refer API doc for [FP's Bank verification service](https://fintechprimitives.com/docs/api/#create-bank-verification)

#### 2. Check the sole proprietor's kyc status

Depending on the sole proprietor's kyc status, you might need to collect additional information. Use the [kyc check guide](/identity/kyc-check) to learn how to check the kyc status. The KYC will be peformed for the individual who owns the sole proprietorship in this case.
If the sole proprietor is kyc compliant, skip step 3 and jump to step 4 directly.

#### 3. Perform digital kyc _conditional step for the individual who owns sole proprietorship_

KYC should be performed for the individual who is also sole proprietor. You need to collect the following additional details about the investor apart from the details collected in step 1:

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

> KYC verification will be done for the individual who is a sole proprietor. Please provide perosnal details in the KYC request.

Refer [API doc](/identity/kyc-request) to perform digital kyc verification.

#### 4. Create sole proprietor business details
The following information about the sole proprietor business is needed to  set up investment account

1. Name (Provide if name of individual and business are different)
2. Date of incorporation
3. Net worth amount of the business
4. Net worth as on date
5. Service provided by the business
6. Bank account object id (Provide if name of individual and business are different). Create a bank account object in FP and add it to the business details. The name in the bank account should match the name of the sole proprietor business.

Sample Request

```json
{
  "profile": "invp_c55240e4b09d4617812bb9557b399a42",
  "name": "name_of_business",
  "date_of_incorporation": "2002-09-18",
  "net_worth": "500000",
  "net_worth_as_on": "2023-07-18",
  "services_provided": "others",
  "bank_account": "bac_8c50b6930ebf4ec7a7ddd58c34bdf1d8"

}
```

#### 5. Create an investment account

To avoid any rejection of orders, make sure the investor is kyc compliant before creating an investment a/c.

Refer API doc for [investment account creation](https://fintechprimitives.com/docs/api/#create-an-mf-investment-account) with the following json. Use the investor id received in step 1 to create an investment account.

Sample Request

```json
{
  "primary_investor": "invp_c55240e4b09d4617812bb9557b399a42",
  "holding_pattern": "single"
}
```
> Only single holding pattern is allowed for a sole proprietor

#### 6. Set folio defaults in the investment account

Update the business object id in the investment account's folio default hash. This will ensure that any new investment that is created, will be created for the `sole proprietor`. If the business object id is `null` in folio defaults, the investment will be processed for `individual` investor.

Refer API doc for [investment account updation](https://fintechprimitives.com/docs/api/#update-an-mf-investment-account) with following json. Use the investor id received in step 1 to create an investment account.

Sample request

```json
{
  "id": "mfia_14bafabfbfbc423d9b54412dd577981b",
  "folio_defaults": {
    
    "business": "bsns_156e3c3bb66e447d8fe7e44d7d941f5a"
  }
}
```

## Place mutual fund orders for sole proprietor

#### 1. Purchase mutual funds

You will need  `investment_account_id` to place the purchase orders. You can fetch this by PAN at any time.

Once investment account is created, [one time](https://docs.fintechprimitives.com/mf-transactions/orders-introduction/) or [recurring orders](https://docs.fintechprimitives.com/mf-transactions/transaction-plans/) can be placed.

#### 2. View folio details

Once the orders are processed, folios will be created. You will be able to view all the folios. Folio's tax status will be marked as `sole proprietor` if you had passed the sole proprietor business details in investment account while placing orders.

Refer API doc to [fetch a folio](https://fintechprimitives.com/docs/api/#fetch-all-folios)

#### 3. Redeem mutual funds

You will need need `investment_account_id` and `folio_number` to place redemption orders.

Refer API doc to [place redemption orders](https://fintechprimitives.com/docs/api/#create-a-mf-redemption)
