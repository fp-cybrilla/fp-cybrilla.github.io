# Investor Profile.

FP uses Investor profile as a data store of investor’s data. 


## 1. Create a Investor Profile

You can start with defining the investor `type`,  with this minimum information you can create an investor profile.
There are various checks and conditions for every attribute which we are collecting in the [investor profile](https://fintechprimitives.com/docs/api/#investor-profile-object).


There are some attributes which are only required for minors thar are guardian_name , guardian_dob and guardian_pan. Currently minors are not supported.

Note: The minimum required field to create an investor profile is only type. 

You can create a investor profile object by calling [investor profile](https://fintechprimitives.com/docs/api/#investor-profile-object) API with below json request


Sample Request

```
{
  "type": "individual",
  "tax_status": "resident_individual",
   "pan": "DWEPS2837G"
}
```


## 2. Add all the data points which are required for order placing

Now using the [modify an investor profile](https://fintechprimitives.com/docs/api/#modify-an-investor-profile) we will add the details to the investor profile . You can collect the information at once or at multiple steps according to your flow.  Any information can be modified at any point of time.  

To place an order you would need the following data points.

1. Full name of the investor
2. PAN number of the investor
3. Email ID and mobile number of the investor
4. Date of birth
5. Gender
6. Country of birth (Country code)
7. Tax status
8. Occupation
9. Address
10. Source of wealth
11. Bank account details
12. Nominee details
13. Country of citizenship
14. Other info (political exposure of the investor, Country of tax residence)


Note:- There are attributes which you would not be able to change once you set them that are type ,tax_status ,pan  ,date_of_birth ,country_of_birth and place_of_birth. 

You can update a investor profile object by calling [modify an investor profile](https://fintechprimitives.com/docs/api/#modify-an-investor-profile) API with below json request

Sample Request

```
{
  "id": "invp_9abd706565144b83947f4b498bc95e98",
  "name": "Tony Soprano",
  "date_of_birth": "2002-09-18",
  "gender": "male",
  "occupation": "business",
  "country_of_birth": "IN",
  "place_of_birth": "IN",
  "first_tax_residency": {
    "country": "IN",
    "taxid_type": "pan",
    "taxid_number": "DWEPS2837G"
  },
  "source_of_wealth": "salary",
  "income_slab": "upto_1lakh",
  "pep_details": "not_applicable",
}

```


## 3. Create Objects Linked to Investor Profile which are required for folio defaults

You can use the below objects to store other information of the investor profile. You can associate one or more object of same type to an investor profile. 

- Bank Account
- Address
- Phone Numbers
- Email
- Related parties
- Demat 

All these objects have fetch and list all APIs. You can use those APIs to fetch a particular object or all related object to an particular investor profile.

### a. Create a Bank account object

You can create multiple bank account objects with different types that are savings,current,nre and nro. The IFSC code provided would be checked for validity and the details of the bank will be auto generated accordingly  in the response. 

You can create a bank account object by calling [bank account](https://fintechprimitives.com/docs/api/#bank-accounts) API with below json request

Sample Request
```json
{
  "profile": "invp_9abd706565144b83947f4b498bc95e98",
  "primary_account_holder_name": "Tony Soprano",
  "account_number": "98123459204",
  "type": "savings",
  "ifsc_code": "HDFC0001330"
}
```

You can use modify a bank account API to  add a canceled cheque after creating the bank account object if you have not added it before. 

### b. Create an Address object

You can store an Indian or overseas address for a Investor. If your country is set to INDIA then your postal code would be checked , the state and city values would be auto filled accordingly. You cannot enter the city or state not matching to the postal code if the country is set to INDIA.

You can create a Address  object by calling [addresses](https://fintechprimitives.com/docs/api/#addresses) API with below json request

Sample Request
```json
{
  "profile": "invp_9abd706565144b83947f4b498bc95e98",
  "line1": "342, 2nd main, 1st crosss",
  "country": "IN",
  "postal_code": "560078"
}
```

You can use modify a address API to  add not mandatory attributes that are line2 and line3 if you have not added it before. 

### c. Create a Phone Number object

You can add both Indian and international phone numbers for an investor profile. These phone numbers could belong to the investor or some other relative. you can set the belongs_to parameter to available values to define whom the number belongs to.

You can create a phone number object by calling [phone numbers](https://fintechprimitives.com/docs/api/#phone-numbers) API with below json request

Sample Request
```json
{
  "profile": "invp_9abd706565144b83947f4b498bc95e98",
  "isd": "91",
  "number": "9012893478"
}
```

You could add the belongs_to with modify phone number API.

### d. Create a Email address object

The email entered should be a valid email. These emails could belong to the investor or some other relative. you can set the belongs_to parameter to available values to define whom the email belongs to.

You can create a email object by calling [email address](https://fintechprimitives.com/docs/api/#email-addresses) API with below json request

Sample Request
```json
{
  "profile": "invp_9abd706565144b83947f4b498bc95e98",
  "email”: ”abc@cybrilla.com”
}
```

You could add the belongs_to with modify email API

### e. Create a Related parties object

This object is used to store any person or a party related to an investor. These related parties could be used for nominations declared by the investor. 

You can create a related parties object by calling [related parties](https://fintechprimitives.com/docs/api/#related-parties) API with below json request

Sample Request
```json
{
  "profile": "invp_9abd706565144b83947f4b498bc95e98",
  "name": "James Soprano",
  "date_of_birth": "1972-02-29",
  "relationship": "father"
}
```

You could add all ther attributes  with modify a related party API.

### f. Create a Demat Account object

To place order via the demat route you have to create a demat account object . 

You can create a  Demat Accounts object by calling [Demat Accounts](https://fintechprimitives.com/docs/api/#demat-accounts) API with below json request. 

Sample Request
```json
{
  "profile": "invp_ef68993a907b48849a02b403fab8da7f",
  "dp_id": "12081800",
  "client_id": "04571343"
}
```

### Note on data verification

#### Email ID and mobile number

As part of the regulatory guidelines, the email id and mobile number of the investor has to be verified for its validity. You can use any method of your choice to do the verification. Sending an OTP or a link is the most common method.  
Currently we don't offer APIs for email and mobile verification. FP APIs assume that the verification is done at your end.

#### Bank Account

As part of the regulatory requirement, you need to verify the account ownership of the bank account given by the investor. There are three ways you can do the verification at present:  
a) Conduct penny drop validation and match the bank a/c holder name that is returned, with the investor name  
b) Accept a cancelled cheque copy and manually match the name on the cheque with the investor name 
c) Use FP's bank account verification service 

The names may not match 100% all the time. You have to be reasonably sure that the a/c belongs to the investor. There are no set guidelines on what should be the match %.

Refer API doc for [FP's Bank verification service](https://fintechprimitives.com/docs/api/#create-bank-verification)

## 4. Check the investor's kyc status

Depending on the investor's kyc status, you might need to collect additional information. Use the [kyc check guide](/identity/kyc-check) to learn how to check the kyc status. 

If the investor is kyc compliant, skip step 5 and jump to step 6 directly.

## 5. Perform digital kyc _conditional step for the individual who owns investorship_

KYC should be performed for the investor. You need to collect the following additional details about the investor apart from the details collected in previous step:

1. Mother's name in full
2. Last 4 digits of the Aadhaar number
3. Father or spouse name
4. Marital status
5. Address proof
6. Individual's PAN card copy
7. Photo of signature on a white paper
8. Photograph of individual
9. In person verification video
10. Personal bank account belonging to the individual. If the business name of the investor is different, then ensure that the bank account belongs to indvidual and not the investor business.
11. A signed cancelled cheque copy of the  personal bank account
12. Geo location
13. Electronic signature on the application form


Refer [API doc](/identity/kyc-request) to perform digital kyc verification.

## 6. Create an Investment Account

To avoid any rejection of orders, make sure the investor is kyc compliant before creating an investment a/c.
Refer API doc for [investment account creation](https://fintechprimitives.com/docs/api/#create-an-mf-investment-account) with the following json. Use the investor id received in step 1 to create an investment account.

Sample Request
```json
{
  "primary_investor": "invp_c55240e4b09d4617812bb9557b399a42",
  "holding_pattern": "single"
}
```

## 7. Update Folio defaults in investment account

You have to update the folio defaults with the linked objects of the investor profile. This will be used in the creation of a new folio. 


Sample Request

```json
{
  "id": "mfia_14bafabfbfbc423d9b54412dd577981b",
  "folio_defaults": {
    "communication_email_address": "email_bf1026954d0545e190727de1537d9e66",
    "communication_mobile_number": "phone_0f4a90134705474eb2e354d9b5ba5f56",
    "communication_address": "addr_8c50b6930ebf4ec7a7ddd58c34bdf1d8",
     "payout_bank_account": "bac_8c50b6930ebf4ec7a7ddd58c34bdf1d8",
     }
}

```
You can add more information to the folio defaults which would be used in order placing. Read more about [folio default here](https://fintechprimitives.com/docs/api/#mf-investment-account-object).

## 8. Place an order

Refer [MF orders](https://docs.fintechprimitives.com/mf-transactions/overview/) section to know more about placing an Order.



