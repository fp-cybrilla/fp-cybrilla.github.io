---
title: Create a new STP
---
## Create a new STP

#### 1. Create a MF Switch plan

Create a mf switch plan using [create a switch plan](https://fintechprimitives.com/docs/api/#create-a-mf-switch) api with `frequency`=`monthly` and `systematic`=`true`.

`POST /v2/mf_switch_plans`

```json
{
  "mf_investment_account": "mfia_798fa03aba614840b983609e89ed16f2",
  "amount": 1000.0,
  "switch_in_scheme": "INF204KA1B64",
  "switch_out_scheme": "INF205KA1B65",
  "frequency": "monthly",
  "installment_day": 1,
  "number_of_installments": 7,
  "consent": {
    "email": "mfp@cybrilla.com",
    "isd_code": "91",
    "mobile": "9000011111"
  }
}
```

Note:

 1. Apart from the above data you can also provide folio number, EUIN etc. You can refer to [create a switch plan](https://fintechprimitives.com/docs/api/#create-a-switch-plan) api for more details.
 2. The installment details will be available from the day of the installment, after the installment gets generated and processed according to the schedule.
 3. If you delegate the responsibility of payment collection against these installments to FP via mandates, FP also debits the money from the investor's bank account against the installment and once the debit is successful, FP submits the order to the order gateway.

#### 2. Fetch installments of an STP

After the plan is registered, the installments will be generated according to the plan's schedule. Each installment can be accessed on or after the date of installment using FP APIs. For more details on when the installments gets generated, please refer to this [API doc](https://fintechprimitives.com/docs/api/#installment-generation). If you want to let your investors track the installments of an STP, you can fetch the installments of the STP plan using the [fetch installments](https://fintechprimitives.com/docs/api/#list-all-mf-switches)

Example: `GET /v2/mf_switches?plan=mfs_b1aba06d52184619151d3b82efa65de6`
