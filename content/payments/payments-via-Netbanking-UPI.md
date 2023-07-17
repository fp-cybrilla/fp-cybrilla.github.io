---
title: Collect payments via Netbanking/UPI
---

## One-time Payments via Netbanking/UPI

To facilitate seamless payment collection from investors, we provide the [FPDocs, Create payment API](https://fintechprimitives.com/docs/api/#create-a-payment), which enables the generation of a one-time payment URL. This URL allows investors to conveniently make payments using Netbanking and UPI methods. Below are the key details and considerations when using this API:

#### Generating the Payment:

To generate a payment, you need to use the [FPDocs, Create payment API](https://fintechprimitives.com/docs/api/#create-a-payment) and provide one or more purchase AMC order IDs created through the [FPDocs, Create MF Purchase API](https://fintechprimitives.com/docs/api/#create-a-mf-purchase). Once the payment is generated for the specified purchase order IDs, the API response will return a `token_url`. This `token_url` redirects the investor to their respective bank's netbanking page to make the payment.
```json
// Request
{
  "amc_order_ids": [
    70251
  ],
  "payment_postback_url": "example.com",
  "bank_account_id": 925
}
```

```json
// Response:
{
    "id": 1885,
    "token_url": "https://cyberion.s.finprim.com/api/pg/payments/netbanking/razorpay?txnId=de9152d18d08b44&txnType=1"  
}
```
####  Usage and Validity of Token URL:

Key considerations regarding the usage and validity of the `token_url` include:
  - Each `token_url` is designed for single-use only. If an attempt to complete the payment using a `token_url` fails, it is recommended to generate a new payment and obtain a fresh URL.
  - It's important to note that a `token_url` has a validity period of 15 minutes. After this timeframe, the URL will expire and will throw "Invalid token" error.

####  Notifying the Payment Status:

Once a payment is completed, FP provides notification of the payment status as follows:
- FP will post the payment status to the `payment_postback_url` provided. This allows you to receive real-time updates on the payment status, so that the Investor can be notified accordingly.
- You can fetch the payment status either by using the [FPDocs, Events API](https://fintechprimitives.com/docs/api/#events-early-access) or you can subscribe to the [FPDocs, Webhook notifications](/#webhook-notifications-early-access)

### **Payment States**

One-time payment progresses through various statuses, each representing a specific stage in its life cycle.

|Status|Behavior|
|---|---|
|PENDING|Payment is created and yet to be authorised by investor.|
|SUCCESS|Payment is successful. Amount has been successfully deducted from the investor's account but yet to be transferred to the AMC's account.|
|FAILED|Payment failed for some reason.|
|INITIATED|Transfer of money has been initiated from payment gateway to AMC.|
|APPROVED| Transfer of money from payment gateway to AMC is successful.|

### **Payment Lifecycle**

<div>
  <img src="../../images/payment-lifecycle.png">
</div>

> 1. If `amount transfer to AMC` fails, FP Operations will coordinate with customer to resolve the issue. If the `amount transfer to AMC` does not succeed after all attempts then customer will initiate a refund to investor on the payment gateway. In this case, FP will mark the payment as `failed`
> 2. If `UTR` is not recieved from payment gateway, FP Operations will coordinate with payment gateway and customer to resolve the issue.

