---
title: Bank Accounts
---
## Bank Accounts
#### Capture and store your investor's bank accounts

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
