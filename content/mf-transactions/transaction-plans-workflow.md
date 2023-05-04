This flow can be used to create a transaction plan in RTA.

### Transaction Plan Lifecycle

1. User creates a transaction. The plan immediately becomes `active` upon plan creation. 
2. Once the plan becomes active, FP takes the responsibility of creating [installments](#Installment-Generation) as per the `installment_day` and `frequency` of the plan.
3. Once all the installment of the plan have been generated, the plan state changes to `completed`.

### Transaction Plan Modifications
1. After the plan is active, the user has the option to modify the plan as per his requirement -
   - If the plan is systematic (`systematic` = true), the user can update the plan amount only as of now.
   - If the plan is non-systemtaic (`systematic` = false), the user can update the plan amount, installment day and number of installments.
2. The user can opt for cancelling a plan. Upon plan cancellation, FP stops generating further installments of plan.
3. The user can also opt to pause a plan between a given timeframe. Upon pausing the plan, for all the installments that fall under the time frame, FP generates the installments and marks them as `cancelled`. 

### Installment Generation Lifecycle
1. On the day of the installment, FP generates the installment as a purchase order . The purchase order upon creation is in `pending` state. This order is `confirmed` for submission to RTA once the payment is done by the investor.
2. Once the order is submitted to the RTA gateway, the order state changes to `submitted`.
3. Once the order is successfully processed by the RTA and the reverse feed is generated and uploaded to FP, the order state changes to `successful`.


### API References
1. Create a Transaction Plan
  - [Create a Purchase Plan](#https://fintechprimitives.com/docs/api/#create-a-purchase-plan)
  - [Create a Redemption Plan](#https://fintechprimitives.com/docs/api/#create-a-redemption-plan)
  - [Create a Switch Plan](#https://fintechprimitives.com/docs/api/#create-a-switch-plan)

2. Update a Transaction Plan
  - [Update a Purchase Plan](#https://fintechprimitives.com/docs/api/#update-a-purchase-plan)
  - [Update a Redemption Plan](#https://fintechprimitives.com/docs/api/#update-a-redemption-plan)
  - [Update a Switch Plan](#https://fintechprimitives.com/docs/api/#update-a-switch-plan)

3. Cancel a Transaction Plan
  - [Cancel a Purchase Plan](#https://fintechprimitives.com/docs/api/#cancel-a-purchase-plan)
  - [Cancel a Redemption Plan](#https://fintechprimitives.com/docs/api/#cancel-a-redemption-plan)
  - [Cancel a Switch Plan](#https://fintechprimitives.com/docs/api/#cancel-a-switch-plan)

4. Pause a Transaction Plan
  - [Skip Installments](#https://fintechprimitives.com/docs/api/#skip-installments-via-skip-instructions)
