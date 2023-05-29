## Create a Purchase Order using V1 APIs

> ##### Ensure the following before placing a purchase order
> 1. Your investor is [kyc compliant](/identity/overview)
> 2. You have an [investment account created](/mf-transactions/overview) for your investor

Once you have the investor and investment account created, follow the below steps to place a purchase order.  
1. Create a purchase order
2. Send OTP to mobile/email and obtain consent for nomination details before creating payment for new folio creation
3. Make payment
4. Check the order status

#### 1. Create a purchase order
Some funds are not allowed for purchases and some might temporarily stop accepting purchase orders. Make sure you check the `purchase_allowed` field is `true` for the fund scheme(s) you are placing the order for, using the [FPDocs, Get fund scheme](https://fintechprimitives.com/api/#get-single-fund-schemes-detail).

The order creation varies slightly depending on how will the payment be made for that.  

*For payment modes: Internet Banking, UPI*  
Call the [FPDocs, Create order](https://fintechprimitives.com/api/#post-create-lumpsum-order-netbanking) with the following json. Use the id of the bank account from which the investor will make the payment for this purchase. You would have got the `bank_account_id` from the create investor api call earlier.

```json
{
  "bank_account_id": 1,
  "orders": [
    {
      "isin": "INF109K01VQ1",
      "amount": 500,
      "consent": 
      {
        "email": "mfp@cybrilla.com",
        "isd_code": "91",
        "mobile": "9008580644"
      }
    }
  ]
}
```

*For payment modes: NACH auto debit*  
Call the [FPDocs, Create order](https://fintechprimitives.com/api/#post-create-lumpsum-order-nach) with the following json. Use the id of the mandate authorised by the investor using which the payment for this purchase will be pulled. [Learn how to setup nach mandates](/payments/nach).

```json
{
  "mandate_id": 1,
  "orders": [
    {
      "isin": "INF109K01VQ1",
      "amount": 500,
      "consent": 
      {
        "email": "mfp@cybrilla.com",
        "isd_code": "91",
        "mobile": "9008580644"
      }      
    }
  ]
}
```


A purchase order gets created for which you need to make a payment. Keep a note of the order id; that is an identifier to use for making payments and checking the status of the order later on.

```json
{
  "orders": [
    {
      "id": 167,
      "isin": "INF109K01VQ1",
      "isin_no": "INF109K01VQ1",
      "source_ref_id": null,
      "user_ip": "10.240.0.7",
      "server_ip": "127.0.0.1"
    }
  ]
}
```
#### 2. Send OTP to mobile/email and obtain consent for nomination details before creating payment for new folio creation

**This step is applicable only for new folio creation. i.e. if it is a new investment under a new folio**

**For what purpose must the consent be taken?**

The investor has two options to manage nominations while creating a new folio.

1. Either provide nominee details (upto 3) OR
2. Opt out of nomination

Irrespective of the option chosen, obtaining consent from the investor for the nomination option is mandatory.

**How should consent be taken?**

If nominee details are provided, ensure that all the holders know of their nomination preferences so that they can give consent.
1. Nominee Name
2. Nominee DOB (Mandatory & Applicable in case the Nominee is a Minor)
3. Allocation Percentage
4. Nominee Relationship
5. Name of the Guardian (Mandatory & Applicable in case the Nominee is a Minor) 
6. Guardian’s Relationship with Nominee (Mandatory & Applicable in case the Nominee is a Minor) 
7. Nominee Pan (Optional)

On the other hand, if nominee details are not provided, ensure that all holders know that they are opting out of the nomination facility.

- Send OTP to both Mobile number/Email address. This must be the mobile number/email address stored against the primary investor linked to the investment account associated with the purchase order. If there are multiple holders, send OTP to Mobile number/Email addresses of all holders.
- Accept OTP from all the holders and verify the OTP and ensure that the correct OTP is entered.
- Store all the consent-related information for audit purposes.

#### 3. Make payment

To make a payment using internet banking or upi, make a request to [FPDocs, create payment](https://fintechprimitives.com/api/#post-net-banking) with the following json. Use the order id from the previous api response.


```json
{
  "amc_order_ids": [167]
}
```

Look for `token_url` in the response and redirect your investor to it to complete his payment. After your investor finishes the payment, FP redirects him to the postback URL configured on your account or to the `payment_postback_url` provided in the request. You'll receive `success` or `failure` in the `status` param. As a good security practice, do not completely rely on the `status` received in the postback call. Instead check the status of the payment from your server before giving a final confirmation to your investor.  


#### 4. Check the order status

Call the [FPDocs, get order](https://fintechprimitives.com/api/#get-fetch-single-order) to check the `status` of the order.  
When the payment is successful, the order status becomes `PAYMENT_CONFIRMED`. 

In live environment, orders in "PAYMENT_CONFIRMED" state will be submitted to AMCs eventually and will be marked as "SUBMITTED". In staging environment, you can use the simulation APIs to mark a "PAYMENT_CONFIRMED" order as "SUBMITTED". Distributors will get mailback reports from RTAs for the orders placed. When these transaction feeds(aka reverse feeds) are uploaded, orders will get marked as SUCCESSFUL or FAILED depending upon the transaction status present in transaction feed files. For more details please refer [Transactions doc](/pages/workflows/investor-reporting-usage). However, in staging environments you can mimic this behavior using simulation apis as shown below.


### Testing

You can use the [FPDocs, simulation](https://fintechprimitives.com/api/#post-order-simulation) to simulate `successful` and `failed` orders to help you during the integration process. Use the following json to simulate the order to `successful` state.

```json
{
  "status": "SUCCESSFUL"
}
```
