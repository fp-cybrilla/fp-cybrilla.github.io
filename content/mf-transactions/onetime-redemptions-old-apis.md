---
title: Sell a mutual fund w/ Old APIs
---
## Sell a mutual fund w/ Old APIs
#### Facilitate redemptions for your investor

Mutual fund units are associated with folios. You can treat folios as sub-accounts under the investment account. You can fetch the list of folios for an investment a/c from the [FPDocs, holdings report](https://fintechprimitives.com/api/#get-holding-report). `redeemable_units` shows the number of units that are available for selling. You can use the FP APIs to sell the units partially or in total.

#### 1. Create a sell order

Call the [FPDocs, Create sell order](https://fintechprimitives.com/api/#post-create-sell-order) with the following json. Pass the `folio_number` and `isin` according to the account from which you wish to sell the units from.

```json
{
  "orders": [
    {
      "folio_number": "45323/45",
      "isin": "INF109K01VQ1",
      "type": "units",
      "amount": 450
    }
  ]
}
```

An order gets created with `PENDING` status. Keep a note of the order id for tracking the status of the order.

#### 2. Check the order status

Call the [FPDocs, get order](https://fintechprimitives.com/api/#get-fetch-single-order) to check the `status` of the order.  
When the order is successfully submitted to the AMC, the order status becomes `SUBMITTED`.
### Testing

In sandbox environment, you can use the [FPDocs, simulation](https://fintechprimitives.com/api/#post-order-simulation) to simulate `successful` and `failed` orders to help you during the integration process. Use the following json to simulate the order to `successful` state.

```json
{
  "status": "SUCCESSFUL"
}
```