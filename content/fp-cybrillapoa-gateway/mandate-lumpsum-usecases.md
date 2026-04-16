## Mandate Lumpsum Usecases

<!-- //## Overview -->

The **FP–Cybrilla POA Gateway** allows you to use mandates to collect payments for both SIP onboarding and one-time (lumpsum) investments. This document covers how to use mandates effectively across onboarding, lumpsum payments, and payment retries.

<!-- **Key behaviours to keep in mind:**

- The first installment is generated immediately after plan creation and will be in `pending` state.
- Even if an APPROVED mandate is attached to the plan, **no payment is auto-created** for this first installment. You must create the payment manually using the Payments API.
- The installment is retrievable via the [FPDocs, List all MF Purchases](https://fintechprimitives.com/docs/api/#list-all-mf-purchases) API by filtering on the plan ID.
- For plans created with FP-ONDC as the provider, the plan goes through `created > review_completed > confirmed > active` before the first installment can be paid. Consent must be collected and the plan confirmed before proceeding to payment.
- All subsequent installments follow the normal recurring schedule, unaffected by this flag. -->

> **Note:** Mandate-based payments can only be created for single orders, not batch orders. 
<!-- When using `generate_first_installment_now`, ensure that the generated installment is paid individually via `POST /api/pg/payments/nach`. -->

---

### Use Case 1 — New Investor Onboarding

<!-- When a new investor completes onboarding, sets up their profile, approves a mandate, and registers a SIP, the first SIP installment would normally only trigger on the next scheduled installment date, which could be days or weeks away. The investor completes the entire setup without any confirmation that their investment has actually started.

By setting `generate_first_installment_now = true` on plan creation, you can collect payment for the first installment on the same day the investor onboards, completing the full investment cycle in a single session. -->

When an investor completes onboarding and sets up a SIP, the first installment would normally be triggered on a future date. You can instead collect the first installment immediately using `generate_first_installment_now = true`, completing the full investment journey in a single session.

### Flow

**Step 1 — Complete investor onboarding**

Create the investor profile and MF investment account using [FPDocs, Create Investor Profile](https://fintechprimitives.com/docs/api/#create-an-investor-profile) and [FPDocs, Create MF Investment Account](https://fintechprimitives.com/docs/api/#create-an-mf-investment-account).

<!-- //```
//POST /v2/investor_profiles
//POST /v2/mf_investment_accounts
//``` -->

**Step 2 — Create and authorise a mandate**

Create a mandate for the investor using [FPDocs, Create a mandate](https://fintechprimitives.com/docs/api/#create-a-mandate-enach-upi-autopay).

<!-- ```
POST /api/pg/mandates
``` -->

Initiate the authorisation using [FPDocs, Authorize a mandate](https://fintechprimitives.com/docs/api/#authorize-a-mandate-enach-and-upi-autopay) and redirect the investor to the `token_url` returned in the response to complete mandate authorisation. This follows the same redirect-and-return pattern as a typical payment checkout.

<!-- ```
POST /api/pg/payments/emandate/auth
``` -->

Once the investor completes authorisation, they are redirected back to your configured `payment_postback_url`. Wait for `mandate_status = APPROVED` before proceeding.

**Step 3 — Create the purchase plan**

Create the plan with `generate_first_installment_now = true` using [FPDocs, Create MF Purchase Plan](https://fintechprimitives.com/docs/api/#create-a-purchase-plan). The plan enters `created` state and FP-ONDC begins its asynchronous review.

<!-- ```
POST /v2/mf_purchase_plans

{
  "mf_investment_account": "mfia_xxx",
  "scheme": "INF109K01TP7",
  "frequency": "monthly",
  "installment_day": 15,
  "amount": 5000,
  "number_of_installments": 12,
  "systematic": true,
  "generate_first_installment_now": true,
  "auto_generate_installments": true,
  "payment_method": "mandate",
  "payment_source": "<mandate_id>",
  "gateway": "ondc",
  "user_ip": "x.x.x.x"
}
``` -->

**Step 4 — Wait for review completion**

Listen for the `mf_purchase.review_completed` webhook event. Once received, the plan moves to `review_completed` state.

**Step 5 — Collect consent and confirm the plan**

Obtain OTP consent from the investor and confirm the plan using [FPDocs, Update MF Purchase Plan](https://fintechprimitives.com/docs/api/#update-a-purchase-plan).

<!-- ```
PATCH /v2/mf_purchase_plans

{
  "id": "mfpp_xxx",
  "state": "confirmed",
  "consent": {
    "email": "investor@example.com",
    "isd_code": "91",
    "mobile": "9XXXXXXXXX"
  }
}
``` -->

Consent must updated against `mf_purchase_plan` and the plan state should be marked as `confirmed` using the Update MF Purchase Plan API.When the Purchase Plan is `confirmed`, it will be submitted to the gateway and upon successful submission, the order is marked as `submitted` and then moved to `active` state automatically.

> **Note:** Please ensure that an `APPROVED` mandate is added as `payment_source` to the Plan before it is `confirmed`.


**Step 6 — Fetch the generated first installment**

Fetch the installment using [FPDocs, List all MF Purchases](https://fintechprimitives.com/docs/api/#list-all-mf-purchases) and retrieve the `old_id`. This is required for payment creation.

<!-- ```
GET /v2/mf_purchases?plan=mfpp_xxx
``` -->

**Step 7 — Create payment**

Create payment against the installment using [FPDocs, Create an eNACH or UPI Autopay Payment](https://fintechprimitives.com/docs/api/#create-an-enach-or-upi-autopay-payment).

<!-- ```
POST /api/pg/payments/nach

{
  "mandate_id": <mandate_id>,
  "amc_order_ids": [<installment_old_id>]
}
``` -->

The investor's first SIP payment is collected on the same day. Subsequent installments follow the normal monthly schedule.

<!-- ### Sandbox Simulation

Simulate the mandate reaching APPROVED state using [FPDocs, Mandate Simulation](https://fintechprimitives.com/docs/api/#mandate-simulation): -->

<!-- ```
POST /api/pg/simulate/mandates/{mandate_id}
Body: { "status": "APPROVED" }
``` -->

<!-- Simulate the first installment order reaching a successful state using [FPDocs, Order Simulation](https://fintechprimitives.com/docs/api/#order-simulation): -->

<!-- ```
POST /api/oms/simulate/orders/{amc_order_id}
Body: { "status": "SUCCESSFUL" }
``` -->

The first installment is collected immediately. Subsequent installments follow the normal schedule.

---

### Use Case 2 — Lump Sum Purchase for Large Amounts

For larger investments (e.g. where UPI limits apply), mandates provide a more reliable payment method. In this flow, you directly create a purchase order and collect payment via mandate.

If an investor does not already have an APPROVED eNACH mandate, you can propose mandate creation and authorisation as part of the lump sum checkout flow itself. The investor authorises the mandate in the same session and the payment is collected immediately against the generated installment.

### Flow

**Step 1 — Create for an Active Mandate**

If the investor does not have an APPROVED mandate, create one using [FPDocs, Create a mandate](https://fintechprimitives.com/docs/api/#create-a-mandate-enach-upi-autopay) and initiate authorisation using [FPDocs, Authorize a mandate](https://fintechprimitives.com/docs/api/#authorize-a-mandate-enach-and-upi-autopay) as part of the checkout flow.

<!-- ```
POST /api/pg/mandates
``` -->

<!-- Redirect the investor to the `token_url` returned in the response to complete authorisation. Once done, they are redirected back to your `payment_postback_url`. -->

<!-- ```
POST /api/pg/payments/emandate/auth
``` -->

<!-- Wait for `mandate_status = APPROVED`. -->

<!-- **Step 2 — Create a non-systematic purchase plan**

Create the plan with `systematic = false`, `number_of_installments = 1`, and `generate_first_installment_now = true` using [FPDocs, Create MF Purchase Plan](https://fintechprimitives.com/docs/api/#create-a-purchase-plan). -->

<!-- ```
POST /v2/mf_purchase_plans

{
  "mf_investment_account": "mfia_xxx",
  "scheme": "INF204KA1B64",
  "frequency": "monthly",
  "amount": 500000,
  "number_of_installments": 1,
  "systematic": false,
  "generate_first_installment_now": true,
  "auto_generate_installments": true,
  "payment_method": "mandate",
  "payment_source": "<mandate_id>",
  "gateway": "rta",
  "user_ip": "x.x.x.x"
}
``` -->

<!-- **Step 3 — Fetch the generated installment**

Fetch the installment using [FPDocs, List all MF Purchases](https://fintechprimitives.com/docs/api/#list-all-mf-purchases). -->

<!-- ```
GET /v2/mf_purchases?plan=mfpp_xxx
``` -->

**Step 2 — Create Purchase Order**

Confirm the order using [FPDocs, Create a MF Purchase](https://fintechprimitives.com/docs/api/#create-a-mf-purchase).

The order flows through:
`under_review` → `pending` → `confirmed` → `submitted`
<!-- ```
PATCH /v2/mf_purchases

{
  "id": "mfp_xxx",
  "state": "confirmed",
  "consent": {
    "email": "investor@example.com",
    "isd_code": "91",
    "mobile": "9XXXXXXXXX"
  }
}
``` -->

**Step 3 — Create payment via eNACH mandate**

Create payment against the installment using [FPDocs, Create an eNACH or UPI Autopay Payment](https://fintechprimitives.com/docs/api/#create-an-enach-or-upi-autopay-payment).

<!-- ```
POST /api/pg/payments/nach

{
  "mandate_id": <mandate_id>,
  "amc_order_ids": [<installment_old_id>]
}
``` -->

The lump sum is debited via the investor's eNACH mandate. The plan completes after this single installment and no further installments are generated.

<!-- ### Sandbox Simulation

Simulate mandate approval and order success:

```
POST /api/pg/simulate/mandates/{mandate_id}
Body: { "status": "APPROVED" }

POST /api/pg/simulate/payments/{payment_id}
Body: { "status": "APPROVED" }

POST /api/oms/simulate/orders/{amc_order_id}
Body: { "status": "SUCCESSFUL" }
``` -->

---

### Use Case 3 — Payment Retry for a Failed Installment

<!-- When a mandate-based debit is attempted for an installment and fails, for example due to insufficient balance in the investor's account at the time of debit, you can request the investor to retry payment rather than cancelling the plan or creating a new one. The installment remains in its current state and does not need to go back through consent or confirmation. You create a new payment against the same `amc_order_id`.

A retry can be initiated when the previous payment attempt is marked as `FAILED`, the associated order is not in a `failed` or `cancelled` state, and no successful or pending payment currently exists for the same order. Each retry produces a new payment ID and all prior failed attempts are automatically ignored once a payment succeeds. -->

The gateway allows you to retry mandate-based payments without recreating the order. This is useful when a debit fails due to reasons like insufficient balance.

A retry can be initiated when:
  - The previous payment attempt is FAILED
  - The order remains in submitted
  - No pending or successful payment exists for the same order
  - The order is not marked as failed due to payment failure and remains submitted.

> **A note on timing:** As per settlement TATs, eNACH mandate debits happen on day T. If a debit fails on day T, the earliest a retry can be attempted is once the failure is confirmed, which may mean the retry effectively falls on T+1. Factor this into how you communicate retry timelines to investors.

> **A note on consecutive installment failures:** As per SEBI guidelines, systematic purchase plans are subject to auto-cancellation if consecutive installments fail beyond a threshold. 3 consecutive failures for daily, weekly, fortnightly, and monthly frequencies, and 2 for quarterly, half-yearly, and yearly frequencies. Once auto-cancelled, no further installments can be generated and a new plan must be created. It is advisable to notify investors proactively when a payment fails to keep them within the allowed retry window.

### Flow

**Step 1 — Detect the failed payment**

Listen for the `payment.failed` webhook event, or poll the payment using [FPDocs, Fetch a payment](https://fintechprimitives.com/docs/api/#fetch-a-payment).

<!-- ```
GET /api/pg/payments/{payment_id}
``` -->

Confirm `status = FAILED`.

**Step 2 — Verify the order is still actionable**

Fetch the order using [FPDocs, Fetch a MF Purchase](https://fintechprimitives.com/docs/api/#fetch-a-mf-purchase) and confirm it is not in `failed` or `cancelled` state. If the order is in `pending` state, also confirm it has not exceeded the expiry window by checking `scheduled_on`.

<!-- ```
GET /v2/mf_purchases/{order_id}
``` -->

**Step 3 — Create a new payment**

Use the same `amc_order_ids` as before. The order does not need to be re-confirmed.

For eNACH or UPI Autopay, use [FPDocs, Create an eNACH or UPI Autopay Payment](https://fintechprimitives.com/docs/api/#create-an-enach-or-upi-autopay-payment):

<!-- ```
POST /api/pg/payments/nach

{
  "mandate_id": <mandate_id>,
  "amc_order_ids": [<order_old_id>]
}
``` -->

For Netbanking or UPI, use [FPDocs, Create a payment](https://fintechprimitives.com/docs/api/#create-a-payment):