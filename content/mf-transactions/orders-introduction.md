## Lump Sum Orders

FP supports three types of lump sum orders -

1. [MF Purchase](https://fintechprimitives.com/docs/api/#mf-purchases)
2. [MF Redemption](https://fintechprimitives.com/docs/api/#mf-redemptions)
3. [MF Switch](https://fintechprimitives.com/docs/api/#mf-switches)

While each type of lump sum order has a different workflow, the states that each type goes through - from order created to order successfully processed by the gateway - is the same as shown below.


### Order States

The definition of each order state is mentioned below -
<br><br>

|State|Description|
|---|---|
|`pending`|The order is created, but not ready for submission|
|`confirmed`|The order is ready for submission to the order gateway|
|`submitted`|The order has been submitted to the order gateway|
|`cancelled`|The order is cancelled. Cancelled orders are not sent for processing. <br> Note: Only pending orders can be cancelled|
|`successful`|The order has been successfully processed by the order gateway|
|`failed`|The order processing has failed|
|`reversed`|A previously successful order has been reversed by the order gateway for some reason. Changes in units will be reversed in such cases|


### Orders Flow

<div>
  <img src="../../images/orders-flow.png">
</div>

> The user can also choose to cancel a `pending` order. To do so, he can request FP to cancel the order. Upon cancelling the order, the order state changes to `cancelled`.
