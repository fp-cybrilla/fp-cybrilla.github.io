---
title: Open an investment account
---
## Open an investment account
#### Learn how to onboard an investor and set him up for investing

Follow the below steps to create an investor and an investment account. Investment Account is the holding account for all your investor's mutual fund investments.

#### 1. Create an investor
The following information about the investor is needed to be able to set him up for investments

1. Full name of the investor
2. PAN number of the investor
3. Email ID and mobile number of the investor
4. Date of birth
5. Father name or spouse name in full 
6. Gender
7. Country of birth
8. Marital status
9. Residential status
10. Occupation
11. Address 
12. Signature scan (only in case of BSE)
13. Fatca/CRS self declaration
14. Bank account details (also a cancelled cheque copy in case of BSE)
15. Nominee details
16. Country of citizenship
17. Other info (politically exposed person or related to someone who is politically exposed)
18. Guardian information (incase the investor is a minor)

Call the [FPDocs, create investor](https://fintechprimitives.com/api/#create-an-investor) with all the required information to create an investor object. Make a note of the investor id, which you'll need in the later steps.

### Note on data verification
#### Email ID and mobile number  
As part of the regulatory guidelines, the email id and mobile number of the investor has to be verified for its validity. You can use any method of your choice to do the verification. Sending an OTP or a link is the most common method.  
Currently we don't offer APIs for email and mobile verification. FP APIs assume that the verification is done at your end.

#### Bank Account  
As part of the regulatory requirement, you need to verify the account ownership of the bank account given by the investor. There are two ways you can do the verification at present:  
a) Penny drop and match the bank a/c holder name that is returned, with the investor name  
b) Accept a cancelled cheque copy from the investor and manually match the name on the cheque with the investor name  
The names may not match 100% all the time. You have to be reasonably sure that the a/c belong to the investor. There are no set guidelines on what should be the match %.
Currently we don't offer APIs to do these verifications. FP Investor APIs assume the bank a/c given is verified by you.


#### 2. Check the investor's kyc status
Depending on the investor's kyc status, you might need to collect additional information. Use the [kyc check guide](/identity/kyc-check) to learn how to check the kyc status.
If the investor is kyc compliant, skip step 3 and jump to step 4 directly. If he is not kyc compliant, go to step 3.

#### 3. Perform digital kyc *conditional step*
You need to collect the following additional details about the investor apart from the details collected in step 1:
1. Mother name in full
2. Last 4 digits of the Aadhaar number
3. PAN card copy
4. Signature scan
5. Photo
6. Verification video
7. A signed cancelled cheque copy of the given bank account
8. Geo location
9. Fatca/CRS self declaration
10. Electronic signature on the application form

[Learn about using the kyc request](/identity/kyc-request) to perform digital kyc

#### 4. Create an investment account
To avoid any rejection of orders, make sure the investor is kyc compliant before creating an investment a/c.

Call the [FPDocs, create investment account](https://fintechprimitives.com/docs/api/#create-a-mf-investment-account) with the following json. Use the investor id received in step 1 to create an investment account.


Request
```json
{
  "primary_investor_old_id": "124234"
}
```

Store the `investment_account_id` received in the response object in your database. You will need this as a reference to place the purchase and sell orders.