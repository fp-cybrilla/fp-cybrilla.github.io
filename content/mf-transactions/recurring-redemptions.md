---
title: Create a new SWP
---
## Create a new SWP

#### 1. Create a MF Redemption plan

Create a mf redemption plan using [create a redemption plan](https://fintechprimitives.com/docs/api/#create-a-redemption-plan) api with `frequency`=`monthly` and `systematic`=`true`

`POST /v2/mf_redemption_plans`

```json
{
  "mf_investment_account": "mfia_798fa03aba614840b983609e89ed16f2",
  "amount": 1000.0,
  "scheme": "INF204KA1B64",
  "frequency": "monthly",
  "installment_day": 1,
  "number_of_installments": 7,
  "generate_first_installment_now": true,
  "auto_generate_installments": true,
  "consent": {
    "email": "mfp@cybrilla.com",
    "isd_code": "91",
    "mobile": "9000011111"
  }
}
```

Note:

 1. Apart from the above data you can also provide folio number, EUIN etc. You can refer to [create a redemption plan](https://fintechprimitives.com/docs/api/#create-a-redemption-plan) api for more details.
 2. Once you have created a monthly SWP, an installment will be generated and processed according to the schedule and the installment details will be available from the day of the installment.
 3. If you delegate the responsibility of payment collection against these installments to FP via mandates, FP also debits the money from the investor's bank account against the installment and once the debit is successful, FP submits the order to the order gateway.

#### 2. Fetch installments of an SWP

After the plan is registered, the installments will be generated according to the plan's schedule. Each installment can be accessed on or after the date of installment with the help of FP APIs. For more details on when the installments gets generated, please refer to this [API doc](https://fintechprimitives.com/docs/api/#installment-generation). If you want to let your investors track the installments of an SWP, you can fetch the installments of the SWP plan using the [fetch installments](https://fintechprimitives.com/docs/api/#list-all-mf-redemptions)

Example: `GET /v2/mf_redemptions?plan=mfr_15f8d86bae614801bab5accaed131abc`

