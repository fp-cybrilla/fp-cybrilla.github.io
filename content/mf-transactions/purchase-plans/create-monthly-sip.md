---
title: Create a new SIP
---
## Create a new SIP
> The use case explained here is implemented via APIs which are in Alpha Stage. The API specs might change.

#### 1. Create a MF Purchase plan
[Create a MF Purchase plan](https://fintechprimitives.com/docs/api/#create-a-purchase-plan) with `frequency`=`monthly` and `systematic`=`true`
`POST /v2/mf_purchase_plans`
```json
{
  "mf_investment_account": "mfia_798fa03aba614840b983609e89ed16f2",
  "scheme": "INF204KA1B64",
  "amount": 1000.0,
  "installment_day": 2,
  "frequency": "monthly",
  "number_of_installments": 20,
  "payment_method": "mandate",
  "payment_source": "24",
  "systematic": true
}
```
Note: 
1. This is the minimal data required to create a monthly SIP. You can also provide different follio number, EUIN, purpose of SIP etc. Please refer to [Create MF Purchase Plan API](https://fintechprimitives.com/docs/api/#create-a-purchase-plan) for full details.
2. Once you have create a monthly SIP, an installment will be generated and processed according to the schedule and the installment details will be available from the day of the installment. 
3. If you delegate the responsibility of payment collection against these installments to FP via mandates, FP also debits the money from the investor's bank account against the installment and once the debit is successful, FP submits the order to the order gateway.


#### 2. Fetch installments of an SIP
Once you have registered a plan, the installments will be generated according to the plan's schedule. On or after the day of installment, each installment will be available for access FP APIs. For more details on when the installments are generated, please refer to this [API doc](https://fintechprimitives.com/docs/api/#installment-generation). If you want to let your investors track the installments of an SIP, you can fetch the installments of the SIP plan using the [FPDocs, fetch installments](https://fintechprimitives.com/docs/api/#list-all-mf-purchases). 
Example: `GET /v2/mf_purchases?plan=mfpp_dbabb25ba34c48329dbfbeff70c846f0`

**Note:**Installments will be only available after day of installment. For example, if the second installment of an SIP is on 25th August, you will be able to access this installment only on or after 25th August.

#### 3. Track the SIP installment
FP uses [`MF Purchase`](https://fintechprimitives.com/docs/api/#mf-purchase-object) object to represent the sip installment. You can track the state of the [`MF Purchase`](https://fintechprimitives.com/docs/api/#mf-purchase-object) representation of the installment to know the status of your installment.
