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


### Orders Lifecycle

<div>
  <img src="../../images/order-lifecycle.png">
</div>

> 1. Please refer [NAV Applicability](https://docs.fintechprimitives.com/general-topics/NAV-Applicability/) to learn more about the cut-off time & day of unit allotment for an order. 
> 2. An order will be marked complete automatically in FP once the payment is completed. Payment complete means that `amount transfer to AMC` has been initiated by FP. If you are managing payment collection by yourself, you need to mark the order as confirmed yourself. Refer the settlement procedure [here](https://fintechprimitives.com/docs/api/#mf-settlement-details).
> 3. `T day` in the lifecycle indicates the case where order placement & payment completed on same day before cut off time. An investor may take upto 7 business days to complete payment for an order. Order will be processed on `T+1` business day from the time payment steps are completed.
