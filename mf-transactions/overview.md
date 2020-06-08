# MF Transactions
*Buy and sell mutual funds for your investors with FP Transaction APIs*

Transaction APIs gives you the ability to place purchase and sell orders on behalf of your investor. You can  
1. place a [one time investment order](/mf-transactions/one-time-purchases)
2. schedule a monthly recurring investment (SIP)
3. place a redemption request

`Investment Account` object is the starting point for placing any orders. You need to create an investment account for your investor before you can start placing purchase and sell orders. Follow these steps to create an investment account.


### 1. Create an investor
We need certain demographic information about the investor to open an account. The information collected will be sent to the AMCs for the purpose of onboarding the investor and to activate him for investments.


### 2. Create an investment account
To avoid any rejection of orders, make sure the investor is kyc compliant before creating an investment a/c. Use the investor id received in the previous step to create the investment account.

Request  
```json
{
  "primary_investor_id": "124234"
}
```

Store the `investment_account_id` received in the response object in your database. You will need this as a reference to place the purchase and sells orders.