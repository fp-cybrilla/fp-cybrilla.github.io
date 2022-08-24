---
title: Top up amount for an SIP
---
## Topup an existing SIP
> The use case explained here is implemented via APIs which are in Alpha Stage. The API specs might change.

Let us assume that there is a monthly SIP of amount=Rs 1000. Till July 1st 2024, you want to invest Rs 100, and from August 1st 2024, you want to invest Rs 1500 instead. You can implement the this use case using the below technique.

#### 1. Create a plan basket 
The strategy is to create a new SIP for topped up amount and maintain both SIPs via plan basket. To facilitate this strategy, we [create a plan basket](https://fintechprimitives.com/docs/api/#create-a-transaction-plan-basket) with existing plan added to it.

`POST /v2/plan_baskets/`
```json
{
    "mf_investment_account": "mfia_14bafabfbfbc423d9b54412dd577981b",
    "plans": [
        "mfpp_189111b00566431db0dace5332db519c"
     ]
}
```
Note the plan basket id.

#### 2. Create a new MF Purchase plan
The next step is to [create a new systematic purchase plan](https://fintechprimitives.com/docs/api/#create-a-purchase-plan) whose amount equals the top up amount. Important point to note here is that we are delaying the activation of this plan to ensure that amount top up happens according to investor's requirement.

`POST /v2/mf_purchase_plans`
```json
{
  "mf_investment_account": "mfia_798fa03aba614840b983609e89ed16f2",
  "folio_number":"12345678",
  "scheme": "INF204KA1B64",
  "amount": 1500.0,//new amount
  "installment_day": 2,
  "frequency": "monthly",
  "number_of_installments": 20,
  "payment_method": "mandate",
  "payment_source": "24",
  "systematic": true,
  "activate_after":"2024-08-01"//Plan will become active from August 1st 2024
}
```
Note the purchase plan id.

#### 3. Schedule cancellation for existing SIP
`PATCH /v2/mf_purchase_plans`
```json
{
  "id":"mfpp_189111b00566431db0dace5332db519c",
  "cancellation_scheduled_on":"2022-07-02"
}
```
With this strategy, the existing SIP with amount = 1000 will be automatically cancelled on July 2nd 2024, and the new SIP with top up amount will start from August 1st 2024.

#### 4. Update plan basket
Add the new plan to the basket containing existing purchase plan using [Update plan basket API](https://fintechprimitives.com/docs/api/#update-a-transaction-plan-basket)
`PATCH /v2/plan_baskets/`
```json
{
  "id": "pb_14bafabfbfbc423d9b54412dd577981b",
  "plans": [
    "mfpp_189111b00566431db0dace5332db519c",//existing plan
    "mfpp_289111b00566431db0dace5332db520c"//new plan
  ]
}
```

#### 5. List all MF Purchases by plan basket id
Since the basket contains both existing plan and new plan, if you fetch installments of a basket using [List all MF Purchases by plan basket id API](https://fintechprimitives.com/docs/api/#list-all-mf-purchases), you will be able to list down the installments of both existing SIP and topped up SIP.

`GET /v2/mf_purchases?plan_basket=pb_14bafabfbfbc423d9b54412dd577981b`

## Top up - while creating a new SIP.
While creating an SIP itself, if you know the topup preference of an investor, you can create multiple SIPs to reflect the investor preference and add them to a plan basket. For instance, if an investor wants to create a monthly SIP for 3 years with starting amount as 500 on August 1st 2022. Each year, he wants to increase the amount by Rs 500, you can create 3 SIPs as follows

|SIP|Amount|Activation|Number of installments|
|---|---|---|---|
|SIP 1|Rs 500|Instant|12|
|SIP 2|Rs 1000|August 1st 2023|12|
|SIP 3|Rs 1500|August 1st 2024|12|

These SIPs can then be added to a plan basket and you can fetch all installments via plan basket id.
