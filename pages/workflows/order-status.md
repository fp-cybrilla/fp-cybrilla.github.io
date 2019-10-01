# Statuses

Fintech platform supports different types of orders(fresh lumpsum purchases,sips,redemptions etc.). An order has its workflow of its own and depending on the stage of the workflow and other conditions, its status also changes. This guide shall help you understand those statuses better.

|Status|Comments|
|---|---|
|PENDING|The order has been created. But, it is yet to be submitted. One of the reasons may be that the payment is pending in case of purchases.|
|CANCELED|The order has been canceled. Canceled orders will not be submitted to RTAs for processing. Note: Only pending orders can be canceled.|
|PAYMENT_CONFIRMED|This is applicable only for a purchase order. Such order will be submitted to RTAs eventually. |
|SUBMITTED|Order submitted to RTA for further processing.|
|SUCCESSFUL|Order has been successfuly processed by RTA and the concerned AMC.|
|FAILED|Order processing failed.|
|REVERSED|The change caused by the order has been reversed for some reason.|