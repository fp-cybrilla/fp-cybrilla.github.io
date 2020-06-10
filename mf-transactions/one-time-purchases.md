# One time purchases
*Facilitate lumpsum investments for your investor*

> *Ensure the following before placing a purchase order*
> 1. Your investor is [kyc compliant](/identity/overview)
> 2. You have an [investment account created](/mf-transactions/overview) for your investor

Once you have the investor and investment account created, follow the below steps to place a purchase order.  
1. Create a purchase order
2. Make payment
3. Check the order status

### 1. Create a purchase order
Some funds are not allowed for purchases and some might temporarily stop accepting purchase orders. Make sure you check the `purchase_allowed` field is `true` for the fund scheme(s) you are placing the order for, using the [Get fund scheme api](https://fintechprimitives.com/api/#get-single-fund-schemes-detail).

Call the [Create order api](https://fintechprimitives.com/api/#post-create-lumpsum-order-netbanking) with the following json. Use the id of the bank account from which the investor will make the payment for this purchase. You would have got the `bank_account_id` from the create investor api call earlier.

```json
{
  "bank_account_id": 1,
  "orders": [
    {
      "isin": "INF109K01VQ1",
      "amount": 500
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

### 2. Make payment

To make a payment using internet banking or upi, make a request to [create payment api](https://fintechprimitives.com/api/#post-net-banking) with the following json. Use the order id from the previous api response.


```json
{
  "amc_order_ids": [167]
}
```

Look for `token_url` in the response and redirect your investor to it to complete his payment. After your investor finishes the payment, FP redirects him to the postback URL configured on your account or to the `payment_postback_url` provided in the request. You'll receive `success` or `failure` in the `status` param. As a good security practice, do not completely rely on the `status` received in the postback call. Instead check the status of the payment from your server before giving a final confirmation to your investor.  
[Learn more about payment states](/pages/workflows/payment-status).

### 3. Check the order status

Call the [get order api](https://fintechprimitives.com/api/#get-fetch-single-order) to check the `status` of the order.  
When the payment is successful, the order status becomes `PAYMENT_CONFIRMED`. [Learn more about the order states](/pages/workflows/order-status)

In live environment, orders in "PAYMENT_CONFIRMED" state will be submitted to AMCs eventually and will be marked as "SUBMITTED". In staging environment, you can use the simulation APIs to mark a "PAYMENT_CONFIRMED" order as "SUBMITTED". Distributors will get mailback reports from RTAs for the orders placed. When these transaction feeds(aka reverse feeds) are uploaded, orders will get marked as SUCCESSFUL or FAILED depending upon the transaction status present in transaction feed files. For more details please refer [Transactions doc](/pages/workflows/investor-reporting-usage). However, in staging environments you can mimic this behavior using simulation apis as shown below.


### Testing

You can use the [simulation api](https://fintechprimitives.com/api/#post-order-simulation) to simulate `successful` and `failed` orders to help you during the integration process. Use the following json to simulate the order to `successful` state.

```json
{
  "status": "SUCCESSFUL"
}
```