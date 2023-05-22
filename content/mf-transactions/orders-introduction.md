## Introduction to Orders

FP supports three types of orders -

1. Purchase
2. Redemption
3. Switch

While each order has different workflows, the states that each type of order goes through - from order created to order successfully processed by the gateway - is the same as shown below.


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

### API References
1. [Introduction to Orders](https://fintechprimitives.com/docs/api/#introduction-to-mf-orders)
2. [MF Purchases](https://fintechprimitives.com/docs/api/#mf-purchases)
3. [MF Redemptions](https://fintechprimitives.com/docs/api/#mf-redemptions)
4. [MF Switches](https://fintechprimitives.com/docs/api/#mf-switches)

