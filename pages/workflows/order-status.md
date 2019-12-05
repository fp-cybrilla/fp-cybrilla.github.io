# Order States

- The platform supports different types of orders (lumpsum purchases, additional lumpsum purchases, SIPs, redemptions, instant redemptions, etc.). 
- Each order has its own workflow and depending on the stage of the workflow and other conditions, the state of the order changes.

|Status|Comments|
|---|---|
|PENDING|The order has been created in Fintech Primitives but has not been submitted to the relevant system. A reason could be that the payment for the order is in pending state. The order is submitted only when both the order and the related payment have the relevant states. |
|CANCELLED|The order has been cancelled. Canceled orders are not submitted to further systems for processing. Note: Only pending orders can be cancelled.|
|PAYMENT_CONFIRMED|This is applicable only for a purchase order. Such orders are submitted to the relevant systems subsequently. |
|SUBMITTED|Order submitted to the relevant systems for further processing.|
|SUCCESSFUL|Order has been successfuly processed by the relevant systems.|
|FAILED|Order processing failed.|
|REVERSED|The change caused by the order has been reversed for some reason.|