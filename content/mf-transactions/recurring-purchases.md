## Create a SIP using V1 APIs

Not all schemes allow for SIP investments. Make sure you check the `sip_allowed` field is `true` for the scheme you are creating an sip plan for, using the [FPDocs, Get fund scheme](https://fintechprimitives.com/api/#get-single-fund-schemes-detail). Also, a consent via OTP for nomination details needs to be obtained from all the holders as described below

#### 1. Send OTP to mobile/email and obtain consent for nomination details before SIP order

**This step is applicable only for new folio creation. i.e. if it is a new investment under a new folio**

**For what purpose must the consent be taken?**

The investor has two options to manage nominations while creating a new folio.

1. Either provide nominee details (upto 3) OR
2. Opt out of nomination

Irrespective of the option chosen, obtaining consent from the investor for the nomination option is mandatory.

**How should consent be taken?**

If nominee details are provided, ensure that all the holders know of their nomination preferences so that they can give consent.
1. Nominee Name
2. Nominee DOB (Mandatory & Applicable in case the Nominee is a Minor)
3. Allocation Percentage
4. Nominee Relationship
5. Name of the Guardian (Mandatory & Applicable in case the Nominee is a Minor) 
6. Guardian’s Relationship with Nominee (Mandatory & Applicable in case the Nominee is a Minor) 
7. Nominee Pan (Optional)
8. Guardian Pan (Optional. Can provide this value if nominee is a minor)

On the other hand, if nominee details are not provided, ensure that all holders know that they are opting out of the nomination facility.

- Send OTP to both Mobile number/Email address. This must be the mobile number/email address stored against the primary investor linked to the investment account associated with the purchase order. If there are multiple holders, send OTP to Mobile number/Email addresses of all holders.
- Accept OTP from all the holders and verify the OTP and ensure that the correct OTP is entered.
- Store all the consent-related information for audit purposes.

#### 2. Create a SIP

Call the [FPDocs, Create Sip](https://fintechprimitives.com/api/#create-a-sip) with the following json. Use the `id` of the payment mandate through which the money will be debited from the investor's bank account on every installment.

```json
{
    "orders": [
        {
            "isin": "INF204KA1B64",
            "amount": 10000,
            "start_day": "2",
            "frequency": "MONTHLY",
            "installments": 20,
            "mandate_id": 23
            "consent": 
            {
                "email": "mfp@cybrilla.com",
                "isd_code": "91",
                "mobile": "9008580644"
            }
        }
    ]
}
```

On every installment, FP does the following automatically:

1. Creates a purchase order
2. Debits the money from the investor's bank account
3. Submits the purchase order for processing

> NOTE: Currently the payments for the SIP investments have to be processed using FP Payment APIs (via nach only). Ability to use your own FPDocs payment providers is under implementation and will be available soon.

#### 3. Fetch the installments

Fetch the installments of the SIP plan using the [FPDocs, fetch installments](https://fintechprimitives.com/api/#fetch-installments-of-a-sip).

#### 4. Track the SIP installment

FP uses `MF Purchase` object to represent the sip installment.

Check the status of an installment using the [FPDocs, fetch a mf purchase](https://fintechprimitives.com/docs/api/#fetch-a-mf-purchase). Use the `id` of the installment from the previous step.

### Testing

In the sandbox, use the [FPDocs, sip simulation](https://fintechprimitives.com/api/#post-sip-simulation) to trigger generation of future sip installments. After generating the installments, use the [FPDocs, order simulation](https://fintechprimitives.com/api/#post-order-simulation) to test various success and failure scenarios of the installments.
