---
title: Collect payment via e-mandates
---
## Collect payments via E-Mandates
Call the [FPDocs, create NACH payment](https://fintechprimitives.com/docs/api/#create-a-nach-payment) with the following json.

```json
{
  "mandate_id": 1,
  "amc_order_ids": [
    1,
    2
  ]
}
```
Depending on the mandate status, you can expect the following behavior.

|Status|Behavior|
|---|---|
|`CREATED`|If the mandate is in `CREATED` status, the payment will be marked as `REJECTED`|
|`RECEIVED`|If the mandate is in `RECEIVED` status, the payment will be marked as `REJECTED`|
|`SUBMITTED`|If the mandate is in `SUBMITTED` status, you can create a payment. We will internally wait till the mandate becomes `APPROVED` and once the e-mandate is approved, we will attempt to charge the investor. If the mandate gets rejected, the investor will not be charged. If the mandate approval takes long time and the order is expired, the payment will fail regardless of whether e-mandates are approved or not.|
|`REJECTED`|If the mandate is in `REJECTED` status, the payment will be marked as `REJECTED`|
|`APPROVED`|An attempt is immediately made to charge the investor|
|`CANCELLED`|If the mandate is in `CANCELLED` status, the payment will be marked as `REJECTED`|


Note : To learn how to manage mandate lifecyle, please refer to this documentation on [Managing mandates](/payments/managing-e-mandates/)
