---
title: Collect payment via eNACH
---
## Recurring and One-Time Payments with eNACH Mandate


Once a mandate is set up for an investor, you can collect recurring payments for [FP Purchase Plans](https://fintechprimitives.com/docs/api/#mf-purchase-plans) without any intervention from the Investor by raising a payment debit request.

eNACH mandate also provide a convenient option for collecting one-time payments from investors as it eliminates the need for investor intervention, allowing for seamless processing.

> If you are using FP payment processing, FP manages the payment debits via eNACH mandate for recurring purchases of [FP Purchase Plans](https://fintechprimitives.com/docs/api/#mf-purchase-plans).

### Create Payment Requests:

To initiate a payment request against a mandate, utilize the [Create NACH payment API](https://fintechprimitives.com/docs/api/#create-a-nach-payment).
This API requires the approved mandate ID of the investor and the AMC order IDs created using the [Create MF Purchase API](https://fintechprimitives.com/docs/api/#create-a-mf-purchase).

```json
{
  "mandate_id": 1,
  "amc_order_ids": [
    1,
    2
  ]
}
```


### **eNACH Payment Life Cycle**

eNACH payment progresses through various statuses, each representing a specific stage in its life cycle. 

|Status|Behavior|
|---|---|
|PENDING|Payment is created but yet to be submitted to payment gateway.|
|SUBMITTED| Debit request has been submitted to the payment gateway.
|SUCCESS|Payment is successful. Amount has been successfully deducted from the investor's account but yet to be transferred to the AMC's account.|
|FAILED|Payment failed for some reason.|
|INITIATED|Transfer of money has been initiated from payment gateway to AMC.|
|APPROVED| Transfer of money from payment gateway to AMC is successful.|




Note : To learn how to manage mandate lifecyle, please refer to this documentation on [Setting up eNACH mandates](/payments/managing-eNACH/)
