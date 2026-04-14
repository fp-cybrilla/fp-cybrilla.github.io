# `generate_first_installment_now` — Use Case Guide

## Overview

`generate_first_installment_now` is a flag available on MF purchase plans that, when set to `true`, generates the first installment of a plan **immediately at the time of plan creation**, bypassing the default minimum gap restriction.

By default, FP enforces a minimum gap of at least 1 calendar day between plan registration and the first installment. This flag overrides that restriction, allowing you to generate and collect payment for the first installment on the same day the plan is created.

**Key behaviours to keep in mind:**

- The first installment is generated immediately after plan creation and will be in `pending` state.
- Even if an APPROVED mandate is attached to the plan, **no payment is auto-created** for this first installment. You must create the payment manually using the Payments API.
- The installment is retrievable via the [FPDocs, List all MF Purchases](https://fintechprimitives.com/docs/api/#list-all-mf-purchases) API by filtering on the plan ID.
- For plans created with FP-ONDC as the provider, the plan goes through `created > review_completed > confirmed > active` before the first installment can be paid. Consent must be collected and the plan confirmed before proceeding to payment.
- All subsequent installments follow the normal recurring schedule, unaffected by this flag.

> **Note:** Mandate-based payments can only be created for single orders, not batch orders. When using `generate_first_installment_now`, ensure that the generated installment is paid individually via `POST /api/pg/payments/nach`.

---

## Use Case 1 — New Investor Onboarding

When a new investor completes onboarding, sets up their profile, approves a mandate, and registers a SIP, the first SIP installment would normally only trigger on the next scheduled installment date, which could be days or weeks away. The investor completes the entire setup without any confirmation that their investment has actually started.

By setting `generate_first_installment_now = true` on plan creation, you can collect payment for the first installment on the same day the investor onboards, completing the full investment cycle in a single session.

### Flow (FP-ONDC)

**Step 1 — Complete investor onboarding**

Create the investor profile and MF investment account using [FPDocs, Create Investor Profile](https://fintechprimitives.com/docs/api/#create-an-investor-profile) and [FPDocs, Create MF Investment Account](https://fintechprimitives.com/docs/api/#create-an-mf-investment-account).

```
POST /v2/investor_profiles
POST /v2/mf_investment_accounts
```

**Step 2 — Create and authorise a mandate**

Create a mandate for the investor using [FPDocs, Create a mandate](https://fintechprimitives.com/docs/api/#create-a-mandate-enach-upi-autopay).

```
POST /api/pg/mandates
```

Initiate the authorisation using [FPDocs, Authorize a mandate](https://fintechprimitives.com/docs/api/#authorize-a-mandate-enach-and-upi-autopay) and redirect the investor to the `token_url` returned in the response to complete mandate authorisation. This follows the same redirect-and-return pattern as a typical payment checkout.

```
POST /api/pg/payments/emandate/auth
```

Once the investor completes authorisation, they are redirected back to your configured `payment_postback_url`. Wait for `mandate_status = APPROVED` before proceeding.

**Step 3 — Create the purchase plan**

Create the plan with `generate_first_installment_now = true` using [FPDocs, Create MF Purchase Plan](https://fintechprimitives.com/docs/api/#create-a-purchase-plan). The plan enters `created` state and FP-ONDC begins its asynchronous review.

```
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
```

**Step 4 — Wait for review completion**

Listen for the `mf_purchase_plan.review_completed` webhook event. Once received, the plan moves to `review_completed` state.

**Step 5 — Collect consent and confirm the plan**

Obtain OTP consent from the investor and confirm the plan using [FPDocs, Update MF Purchase Plan](https://fintechprimitives.com/docs/api/#update-a-purchase-plan).

```
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
```

The plan moves to `submitted` then `active` automatically.

**Step 6 — Fetch the generated first installment**

Fetch the installment using [FPDocs, List all MF Purchases](https://fintechprimitives.com/docs/api/#list-all-mf-purchases) and retrieve the `old_id`. This is required for payment creation.

```
GET /v2/mf_purchases?plan=mfpp_xxx
```

**Step 7 — Create payment**

Create payment against the installment using [FPDocs, Create an eNACH or UPI Autopay Payment](https://fintechprimitives.com/docs/api/#create-an-enach-or-upi-autopay-payment).

```
POST /api/pg/payments/nach

{
  "mandate_id": <mandate_id>,
  "amc_order_ids": [<installment_old_id>]
}
```

The investor's first SIP payment is collected on the same day. Subsequent installments follow the normal monthly schedule.

### Sandbox Simulation

Simulate the mandate reaching APPROVED state using [FPDocs, Mandate Simulation](https://fintechprimitives.com/docs/api/#mandate-simulation):

```
POST /api/pg/simulate/mandates/{mandate_id}
Body: { "status": "APPROVED" }
```

Simulate the first installment order reaching a successful state using [FPDocs, Order Simulation](https://fintechprimitives.com/docs/api/#order-simulation):

```
POST /api/oms/simulate/orders/{amc_order_id}
Body: { "status": "SUCCESSFUL" }
```

---

## Use Case 2 — Lump Sum Purchase for Large Amounts Using an eNACH Mandate

For lump sum investments above Rs. 5 lakhs, UPI is not supported as a payment method. Netbanking, while available, is prone to late authorisations across banks, where the payment is authorised by the investor but the debit confirmation reaches the system significantly later than expected, resulting in payment failures. For amounts in this range, an eNACH mandate is the more dependable payment path.

If an investor does not already have an APPROVED eNACH mandate, you can propose mandate creation and authorisation as part of the lump sum checkout flow itself. The investor authorises the mandate in the same session and the payment is collected immediately against the generated installment.

By creating a non-systematic purchase plan with `generate_first_installment_now = true` and `number_of_installments = 1`, you generate a one-time purchase installment immediately and collect payment against the investor's eNACH mandate.

> **Note:** Non-systematic purchase plans are supported on the RTA gateway only. FP-ONDC supports systematic plans only.

### Flow (RTA Gateway)

**Step 1 — Create and authorise an eNACH mandate**

If the investor does not have an APPROVED mandate, create one using [FPDocs, Create a mandate](https://fintechprimitives.com/docs/api/#create-a-mandate-enach-upi-autopay) and initiate authorisation using [FPDocs, Authorize a mandate](https://fintechprimitives.com/docs/api/#authorize-a-mandate-enach-and-upi-autopay) as part of the checkout flow.

```
POST /api/pg/mandates
```

Redirect the investor to the `token_url` returned in the response to complete authorisation. Once done, they are redirected back to your `payment_postback_url`.

```
POST /api/pg/payments/emandate/auth
```

Wait for `mandate_status = APPROVED`.

**Step 2 — Create a non-systematic purchase plan**

Create the plan with `systematic = false`, `number_of_installments = 1`, and `generate_first_installment_now = true` using [FPDocs, Create MF Purchase Plan](https://fintechprimitives.com/docs/api/#create-a-purchase-plan).

```
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
```

**Step 3 — Fetch the generated installment**

Fetch the installment using [FPDocs, List all MF Purchases](https://fintechprimitives.com/docs/api/#list-all-mf-purchases).

```
GET /v2/mf_purchases?plan=mfpp_xxx
```

**Step 4 — Collect consent and confirm the order**

Confirm the order using [FPDocs, Update a MF Purchase](https://fintechprimitives.com/docs/api/#update-a-mf-purchase).

```
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
```

**Step 5 — Create payment via eNACH mandate**

Create payment against the installment using [FPDocs, Create an eNACH or UPI Autopay Payment](https://fintechprimitives.com/docs/api/#create-an-enach-or-upi-autopay-payment).

```
POST /api/pg/payments/nach

{
  "mandate_id": <mandate_id>,
  "amc_order_ids": [<installment_old_id>]
}
```

The lump sum is debited via the investor's eNACH mandate. The plan completes after this single installment and no further installments are generated.

### Sandbox Simulation

Simulate mandate approval and order success:

```
POST /api/pg/simulate/mandates/{mandate_id}
Body: { "status": "APPROVED" }

POST /api/pg/simulate/payments/{payment_id}
Body: { "status": "APPROVED" }

POST /api/oms/simulate/orders/{amc_order_id}
Body: { "status": "SUCCESSFUL" }
```

---

## Use Case 3 — Payment Retry for a Failed Installment

When a mandate-based debit is attempted for an installment and fails, for example due to insufficient balance in the investor's account at the time of debit, you can request the investor to retry payment rather than cancelling the plan or creating a new one. The installment remains in its current state and does not need to go back through consent or confirmation. You create a new payment against the same `amc_order_id`.

A retry can be initiated when the previous payment attempt is marked as `FAILED`, the associated order is not in a `failed` or `cancelled` state, and no successful or pending payment currently exists for the same order. Each retry produces a new payment ID and all prior failed attempts are automatically ignored once a payment succeeds.

> **A note on timing:** As per settlement TATs, eNACH mandate debits happen on day T. If a debit fails on day T, the earliest a retry can be attempted is once the failure is confirmed, which may mean the retry effectively falls on T+1. Factor this into how you communicate retry timelines to investors.

> **A note on consecutive installment failures:** As per SEBI guidelines, systematic purchase plans are subject to auto-cancellation if consecutive installments fail beyond a threshold. 3 consecutive failures for daily, weekly, fortnightly, and monthly frequencies, and 2 for quarterly, half-yearly, and yearly frequencies. Once auto-cancelled, no further installments can be generated and a new plan must be created. It is advisable to notify investors proactively when a payment fails to keep them within the allowed retry window.

### Flow

**Step 1 — Detect the failed payment**

Listen for the `payment.failed` webhook event, or poll the payment using [FPDocs, Fetch a payment](https://fintechprimitives.com/docs/api/#fetch-a-payment).

```
GET /api/pg/payments/{payment_id}
```

Confirm `status = FAILED`.

**Step 2 — Verify the order is still actionable**

Fetch the order using [FPDocs, Fetch a MF Purchase](https://fintechprimitives.com/docs/api/#fetch-a-mf-purchase) and confirm it is not in `failed` or `cancelled` state. If the order is in `pending` state, also confirm it has not exceeded the expiry window by checking `scheduled_on`.

```
GET /v2/mf_purchases/{order_id}
```

**Step 3 — Create a new payment**

Use the same `amc_order_ids` as before. The order does not need to be re-confirmed.

For eNACH or UPI Autopay, use [FPDocs, Create an eNACH or UPI Autopay Payment](https://fintechprimitives.com/docs/api/#create-an-enach-or-upi-autopay-payment):

```
POST /api/pg/payments/nach

{
  "mandate_id": <mandate_id>,
  "amc_order_ids": [<order_old_id>]
}
```

For Netbanking or UPI, use [FPDocs, Create a payment](https://fintechprimitives.com/docs/api/#create-a-payment):

```
POST /api/pg/payments/netbanking

{
  "amc_order_ids": [<order_old_id>],
  "payment_postback_url": "https://yourapp.com/payment_status"
}
```

If this retry also fails, the same process can be repeated. There is no limit on the number of payment attempts as long as the order remains actionable.

### Sandbox Simulation

Simulate a failure then a successful retry using [FPDocs, Payment Simulation](https://fintechprimitives.com/docs/api/#payment-simulation):

```
POST /api/pg/simulate/payments/{payment_id}
Body: { "status": "FAILED" }

POST /api/pg/simulate/payments/{new_payment_id}
Body: { "status": "APPROVED" }
```

---

## Use Case 4 — Immediate First Purchase on a Non-Systematic Scheduled Plan

When setting up a non-systematic quarterly or half-yearly purchase plan, the first installment would normally only be generated at the next scheduled cycle date, potentially months away. This is relevant for distributors setting up scheduled lump sum plans where the first purchase needs to be initiated on the day the plan is created.

By setting `generate_first_installment_now = true`, the first purchase is generated immediately on plan creation. All subsequent installments then follow the normal frequency-based schedule from that point forward.

> **Note:** Non-systematic purchase plans are supported on the RTA gateway only. FP-ONDC supports systematic plans only.

### Flow (RTA Gateway)

**Step 1 — Create the non-systematic plan**

Create the plan using [FPDocs, Create MF Purchase Plan](https://fintechprimitives.com/docs/api/#create-a-purchase-plan). The plan activates immediately and the first installment is generated in `pending` state.

```
POST /v2/mf_purchase_plans

{
  "mf_investment_account": "mfia_xxx",
  "scheme": "INF204KA1B64",
  "frequency": "quarterly",
  "installment_day": 1,
  "amount": 50000,
  "number_of_installments": 8,
  "systematic": false,
  "generate_first_installment_now": true,
  "auto_generate_installments": true,
  "gateway": "rta",
  "user_ip": "x.x.x.x"
}
```

**Step 2 — Fetch the generated installment**

Fetch the installment using [FPDocs, List all MF Purchases](https://fintechprimitives.com/docs/api/#list-all-mf-purchases).

```
GET /v2/mf_purchases?plan=mfpp_xxx
```

**Step 3 — Collect consent and confirm the order**

Confirm the order using [FPDocs, Update a MF Purchase](https://fintechprimitives.com/docs/api/#update-a-mf-purchase).

```
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
```

**Step 4 — Create payment**

Since this is a non-systematic plan, each installment is treated as a lump sum purchase. Payment can be collected via Netbanking, UPI, or an eNACH mandate using [FPDocs, Create a payment](https://fintechprimitives.com/docs/api/#create-a-payment).

```
POST /api/pg/payments/netbanking

{
  "amc_order_ids": [<installment_old_id>],
  "payment_postback_url": "https://yourapp.com/payment_status"
}
```

Subsequent quarterly installments are generated automatically by FP on the scheduled installment day from the next cycle.

---

## API Quick Reference

| Action | Method | Link |
|--------|--------|------|
| Create purchase plan | POST | [FPDocs, Create MF Purchase Plan](https://fintechprimitives.com/docs/api/#create-a-purchase-plan) |
| Update / confirm plan | PATCH | [FPDocs, Update MF Purchase Plan](https://fintechprimitives.com/docs/api/#update-a-purchase-plan) |
| List installments for a plan | GET | [FPDocs, List all MF Purchases](https://fintechprimitives.com/docs/api/#list-all-mf-purchases) |
| Confirm a purchase order | PATCH | [FPDocs, Update a MF Purchase](https://fintechprimitives.com/docs/api/#update-a-mf-purchase) |
| Create mandate | POST | [FPDocs, Create a mandate](https://fintechprimitives.com/docs/api/#create-a-mandate-enach-upi-autopay) |
| Authorise mandate | POST | [FPDocs, Authorize a mandate](https://fintechprimitives.com/docs/api/#authorize-a-mandate-enach-and-upi-autopay) |
| Create eNACH / UPI Autopay payment | POST | [FPDocs, Create an eNACH or UPI Autopay Payment](https://fintechprimitives.com/docs/api/#create-an-enach-or-upi-autopay-payment) |
| Create Netbanking / UPI payment | POST | [FPDocs, Create a payment](https://fintechprimitives.com/docs/api/#create-a-payment) |
| Fetch payment | GET | [FPDocs, Fetch a payment](https://fintechprimitives.com/docs/api/#fetch-a-payment) |
| Simulate mandate status (sandbox) | POST | [FPDocs, Mandate Simulation](https://fintechprimitives.com/docs/api/#mandate-simulation) |
| Simulate payment status (sandbox) | POST | [FPDocs, Payment Simulation](https://fintechprimitives.com/docs/api/#payment-simulation) |
| Simulate order status (sandbox) | POST | [FPDocs, Order Simulation](https://fintechprimitives.com/docs/api/#order-simulation) |

---

Need help? Contact the support team at customerservice@cybrilla.com