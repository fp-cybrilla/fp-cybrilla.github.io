This flow can be used to create a transaction plan in RTA.

### Transaction Plan Lifecycle

1. User creates a transaction. The plan immediately becomes `active` upon plan creation. Once the plan becomes active, FP takes the responsibility of creating [installments](#installment-generation) as per the `installment_day` and `frequency` of the plan.


### Installment Generation
1. On the day of the installment, FP generates the installment as a purchase order . The purchase order upon creation is in `pending` state. This order is `confirmed` for submission to RTA once the payment is done by the investor.
2. Once the order is submitted to the RTA gateway, the order state changes to `submitted`.
3. Once the order is successfully processed by the RTA and the reverse feed is generated and uploaded to FP, the order state changes to `successful`.
