---
title: Collect payment via eNACH
---
## Recurring and One-Time Payments with eNACH and UPI Autopay Mandates


Once a mandate is set up for an investor, you can collect recurring payments for [FP Purchase Plans](https://fintechprimitives.com/docs/api/#mf-purchase-plans) without any intervention from the Investor by raising a payment request.

Mandate also provide a convenient option for collecting one-time payments from investors as it eliminates the need for investor intervention, allowing for seamless processing.

> If you are using FP payment processing, FP manages the payment debits via mandate for recurring purchases of [FP Purchase Plans](https://fintechprimitives.com/docs/api/#mf-purchase-plans).

### Create Payment Requests:

To initiate a payment request against a mandate, utilize the [FPDocs, Create an eNACH or UPI Autopay payment](https://fintechprimitives.com/docs/api/#create-an-enach-or-upi-autopay-payment).
This API requires the approved mandate ID of the investor and the AMC order IDs created using the [FPDocs, Create MF Purchase](https://fintechprimitives.com/docs/api/#create-a-mf-purchase).

```json
{
  "mandate_id": 1,
  "amc_order_ids": [
    1,
    2
  ]
}
```


### **eNACH Payment States**

eNACH payment progresses through various statuses, each representing a specific stage in its life cycle. 

|Status|Behavior|
|---|---|
|PENDING|Payment is created but yet to be submitted to payment gateway.|
|SUBMITTED| Payment request has been submitted to the payment gateway.
|SUCCESS|Payment is successful. Amount has been successfully deducted from the investor's account but yet to be transferred to the AMC's account.|
|FAILED|Payment failed for some reason.|
|INITIATED|Transfer of money has been initiated from payment gateway to AMC.|
|APPROVED| Transfer of money from payment gateway to AMC is successful.|


### **eNACH Payment Lifecycle**

<div>
  <img src="../../images/mandate-payment-lifecycle.png">
</div>

> 1. If `amount transfer to AMC` fails, FP Operations will coordinate with customer to resolve the issue. If the `amount transfer to AMC` does not succeed after all attempts then customer will initiate a refund to investor on the payment gateway. In this case, FP will mark the payment as `failed`
> 2. If `UTR` is not recieved from payment gateway, FP Operations will coordinate with payment gateway and customer to resolve the issue.
> 3. FP will retry payment for 2 calendar days if the payment request was not accepted by payment gateway due to bank related reasons. Payment request will remain in `pending` state during this time. If the payment request is not accpeted after retry, it will be marked as `failed`.
> 4. To learn how to manage mandate lifecyle, please refer [eNACH mandate setup](/payments/managing-eNACH/)
