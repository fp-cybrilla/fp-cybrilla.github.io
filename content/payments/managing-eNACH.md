---
title: Seting up eNACH mandate
---
  

## Setting up eNACH Mandate
An eNACH mandate represents an investor's one-time authorization through netbanking, to debit payments from their bank account without the need for further manual payment authorisation.  By setting up a mandate, investors can make both one-time purchases as well as recurring purchases such as [FP Purchase Plans](https://fintechprimitives.com/docs/api/#mf-purchase-plans).


### Setting up a eNACH mandate for an investor involves two steps:

#### Step 1: Create an eNACH Mandate:
To create an eNACH mandate, use the [Create eNACH mandate API](https://fintechprimitives.com/docs/api/#create-a-mandate-enach). This API requires you to provide the investor's bank account ID for which the mandate must be created, along with specifying the maximum debit limit for the mandate. 
```json
{
	"mandate_type": "E_MANDATE",
	"bank_account_id": 123,
	"mandate_limit": 100000
}
```

The maximum limit determines the highest amount that can be debited from the investor's bank account. This limit is typically set per transaction or per day, depending on the capabilities of the payment gateway:

  

| Payment Gateway | Maximum Limit | Remarks |
|---|---|---|
| Razorpay | 10,00,000 | Limit is per transaction |
| BillDesk | 10,00,000 | Limit is per day |
| BSE | NA | Limit is per day |

  
Setting an appropriate maximum limit for the mandate is crucial as it directly impacts the number of [FP Purchase plans](https://fintechprimitives.com/docs/api/#mf-purchase-plans) that can be processed in a given day and the maximum amount that can be debited for each instalment. 

  

#### Step 2: Authorize an eNACH Mandate:

  

Once the eNACH mandate is created with FP, you can proceed with authorizing the mandate to enable payment processing. To accomplish this, you need to use the [Authorize eNACH mandate API](https://fintechprimitives.com/docs/api/#authorize-a-mandate-enach), providing the Mandate ID received in the response from the [Create eNACH mandate API](https://fintechprimitives.com/docs/api/#create-a-mandate-enach) step. 

```json
{
    "mandate_id": 34
}
```

Upon initiating the [Authorize eNACH mandate API](https://fintechprimitives.com/docs/api/#authorize-a-mandate-enach), you will receive a `token_url` in the response. This `token_url` redirects the investor to their respective bank's netbanking page to authorize the mandate. The approval of the mandate is typically immediate, with the authorization transaction successfully confirming the investor's consent. In rare cases, the approval process may take up to T+1 days for completion.
> Note: BSE requires a gap of atleast one minute between Mandate creation and authorisation. 

#### eNACH Mandate Cancellation:


`Approved` mandates can be cancelled if there is a requirement from the investor, such as a bank change or any other valid reason. To cancel an `Approved` mandate, you can utilize the [Cancel eNACH mandate API](https://fintechprimitives.com/docs/api/#cancel-a-mandate) by passing the mandate ID as the request parameter.

eNACH mandate cancellation functionality is currently available for Razorpay mandates only. When a mandate is cancelled using the [Cancel eNACH mandate API](https://fintechprimitives.com/docs/api/#cancel-a-mandate), the mandate will be cancelled at Razorpay's end as well. Even if the Razorpay mandate is deleted outside of FP, FP will mark the mandate as `Cancelled` to maintain accurate mandate status within the system.

> To cancel BSE mandates, please reach out to us at [fpsupport@cybrilla.com](mailto:fpsupport@cybrilla.com). 


### **eNACH Mandate States**


The mandate progresses through various statuses, each representing a specific stage in its life cycle. Understanding the behaviors associated with these statuses is essential for managing mandates effectively:



| Status | Behavior |
|---|---|
|  CREATED | The mandate is created in both the FP system and the associated payment gateway(except BSE) but awaits authorization from the investor. |
|  RECEIVED | Applicable only for BSE mandates. This means that mandate is created at BSE too, but yet to be authorized. |
|  APPROVED  | The mandate is approved and ready to be used for creating payments. |
|  SUBMITTED| The authorization transaction is successful, indicating the investor's consent, but the mandate awaits final approval from the bank. |
|  REJECTED  | The authorization attempt was completed, but the bank rejected the mandate. Rejected mandates cannot be used for creating payments. |
|  CANCELLED| The mandate has been cancelled. Cancelled mandates cannot be used for creating payments. 




### **eNACH Mandate Lifecycle**
  
<div>
  <img src="../../images/mandate-lifecycle.png">
</div>

> 1. One time payments using the eNACH mandate will be allowed only if mandate is in `approved` state. 
> 2. You can setup a recurring purchase plan with a mandate in `created` state. On the installment order day, if mandate is not `approved`, the installment payment will be not be attempted by FP. The installment order will be marked as failed in such case.
