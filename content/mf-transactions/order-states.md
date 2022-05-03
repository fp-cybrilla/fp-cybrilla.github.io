---
title: Order States
---
## Order States

- The platform supports different types of orders (lumpsum purchases, additional lumpsum purchases, SIPs, redemptions, instant redemptions, etc.). 
- Each order has its own workflow and depending on the stage of the workflow and other conditions, the state of the order changes.

<br/>

|Status|Comments|
|---|---|
|pending|The order is created and waiting for confirmation for further processing|
|cancelled|The order is cancelled. Canceled orders are not sent for processing. Note: Only pending orders can be cancelled|
|confirmed|The order is ready for processing. The order details cannot be updated at this state|
|submitted|The order is submitted successfully for further processing. It could be sumitted to the RTAs or AMCs or BSE depending on the order gateway|
|successful|The order is processed successfuly|
|failed|The order processing failed|
|reversed|A previously successfuly order is reversed|



#### Order States for Old APIs

|Status|Comments|
|---|---|
|PENDING|The order has been created in Fintech Primitives but has not been submitted to the relevant system. A reason could be that the payment for the order is in pending state. The order is submitted only when both the order and the related payment have the relevant states. |
|CANCELLED|The order has been cancelled. Canceled orders are not submitted to further systems for processing. Note: Only pending orders can be cancelled.|
|PAYMENT_CONFIRMED|This is applicable only for a purchase order. Such orders are submitted to the relevant systems subsequently. |
|SUBMITTED|Order submitted to the relevant systems for further processing.|
|SUCCESSFUL|Order has been successfuly processed by the relevant systems.|
|FAILED|Order processing failed.|
|REVERSED|The change caused by the order has been reversed for some reason.|