---
title: Create a new STP
---
## Create a new STP**
> The use case explained here is implemented via APIs which are in Alpha Stage. The API specs might change.

#### 1. Send OTP to mobile/email and obtain consent for nomination details before STP order

**This step is applicable only for new folio creation. i.e. if it is a new investment under a new folio**

**For what purpose must the consent be taken?**

The investor has two options to manage nominations while creating a new folio.

1.  Either provide nominee details (upto 3) OR
2.  Opt out of nomination

Irrespective of the option chosen, obtaining consent from the investor for the nomination option is mandatory.

**How should consent be taken?**

If nominee details are provided, ensure that all the holders know their nomination preferences so that they can give consent.

1.  Nominee Name
2.  Nominee DOB (Mandatory & Applicable in case the Nominee is a Minor)
3.  Allocation Percentage
4.  Nominee Relationship
5.  Name of the Guardian (Mandatory & Applicable in case the Nominee is a Minor)
6.  Guardian’s Relationship with Nominee (Mandatory & Applicable in case the Nominee is a Minor)
7.  Nominee Pan (Optional)

On the other hand, if nominee details are not provided, ensure that all holders know that they are opting out of the nomination facility.

-   Send OTP to both Mobile number/Email address. This must be the mobile number/email address stored against the primary investor linked to the investment account associated with the purchase order. If there are multiple holders, send OTP to Mobile number/Email addresses of all holders.
-   Accept OTP from all the holders and verify the OTP and ensure that the correct OTP is entered.
-   Store all the consent-related information for audit purposes.

#### 2. Create a MF Switch plan

Create a mf switch plan using [Create a switch plan](https://fintechprimitives.com/docs/api/#create-a-mf-switch) api with `frequency`=`monthly` and `systematic`=`true`.

`POST /v2/mf_switch_plans`

```json
{
  "mf_investment_account": "mfia_798fa03aba614840b983609e89ed16f2",
  "amount": 1000.0,
  "switch_in_scheme": "INF204KA1B64",
  "switch_out_scheme": "INF205KA1B65",
  "frequency": "monthly",
  "installment_day": 1,
  "number_of_installments": 7,
  "consent": {
    "email": "mfp@cybrilla.com",
    "isd_code": "91",
    "mobile": "9000011111"
  }
}
```

Note:

 1. Apart from the above data you can also provide folio number, EUIN, purpose of SWP etc. You can refer to [create a redemption plan](https://fintechprimitives.com/docs/api/#create-a-redemption-plan) api for more details.
 2. The installment details will be available from the day of the installment, after the installment gets generated and processed according to the schedule.
 3. If you delegate the responsibility of payment collection against these installments to FP via mandates, FP also debits the money from the investor's bank account against the installment and once the debit is successful, FP submits the order to the order gateway.

#### 3. Fetch installments of an STP

After the plan is registered, the installments will be generated according to the plan's schedule. Each installment can be accessed on or after the date of installment with the help of FP APIs. For more details on when the installments gets generated, please refer to this [API doc](https://fintechprimitives.com/docs/api/#installment-generation). If you want to let your investors track the installments of an STP, you can fetch the installments of the STP plan using the [fetch installments](https://fintechprimitives.com/docs/api/#list-all-mf-switches)

Example: `GET /v2/mf_switches?plan=mfs_b1aba06d52184619151d3b82efa65de6`

#### 4. Track the STP installment
FP uses [`MF Switch`](https://fintechprimitives.com/docs/api/#mf-switch-object) object to represent the STP installment. You can track the state of the [`MF Switch`](https://fintechprimitives.com/docs/api/#mf-switch-object) representation of the installment to know the status of your installment.
