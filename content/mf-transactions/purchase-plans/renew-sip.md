---
title: Renew SIP
---
## Renew the tenure of an SIP
> The use case explained here is implemented via APIs which are in Alpha Stage. The API specs might change.

Let us assume that you have an existing monthly SIP. Let the last date of the installment be August 1st 2022 and let us assume that before August 1st 2022, an investor wants to extend this SIP. You can follow the below approach.

#### 1. Create a MF Purchase Plan
[Create a new SIP](https://fintechprimitives.com/docs/api/#create-a-purchase-plan) with same properties as the existing SIP that needs to renewed.

`POST /v2/mf_purchase_plans`
```json
{
  "mf_investment_account": "mfia_798fa03aba614840b983609e89ed16f2",
  "scheme": "INF204KA1B64",
  "amount": 1000.0,
  "installment_day": 1,
  "frequency": "monthly",
  "number_of_installments": 20,
  "payment_method": "mandate",
  "payment_source": "24",
  "systematic": true,
  "activate_after":"2022-08-02"
}
```

Please note the attribute `activate_after`. We are activating this SIP after the existing SIP's tenure ends. You can also offer the investor to renew the SIP with new amount if required. 

#### 2. Create a plan basket
[Create a plan basket](https://fintechprimitives.com/docs/api/#create-a-transaction-plan-basket) and add both plans.
`POST /v2/plan_baskets/`
```json
{
    "mf_investment_account": "mfia_14bafabfbfbc423d9b54412dd577981b",
    "plans": [
        "mfpp_189111b00566431db0dace5332db519c",//existing plan
        "mfpp_189111b00566431db0dace5332db519d"//new plan
     ]
}
```
Response
```json
{
  "object": "plan_basket",
  "id": "pb_14bafabfbfbc423d9b54412dd577981b",
  "mf_investment_account": "mfia_14bafabfbfbc423d9b54412dd577981b",
  "source_ref_id": null,
  "plans": [
     "mfpp_189111b00566431db0dace5332db519c",//existing plan
     "mfpp_189111b00566431db0dace5332db519d"//new plan
  ],
  "created_at": "2022-04-06T15:32:52+05:30"
}
```

#### 3.List all MF Purchases by plan basket id
[List all MF purchases by its plan basket id](https://fintechprimitives.com/docs/api/#list-all-mf-purchases)

Example:
`GET /v2/mf_purchases?plan_basket=mfpb_14bafabfbfbc423d9b54412dd577981b`

The installments of the current SIP and renewed SIP will be listed together giving investors a unified view of all installments even after they have renewed their SIPs.


