# `generate_first_installment_now` — Use Case Guide

## Overview

`generate_first_installment_now` is a flag available on MF purchase plans that, when set to `true`, generates the first installment of a plan **immediately at the time of plan creation**, bypassing the default minimum gap restriction.

By default, FP enforces a minimum gap of at least 1 calendar day between plan registration and the first installment. This flag overrides that restriction, allowing you to generate and collect payment for the first installment on the same day the plan is created.

**Key behaviours to keep in mind:**

- The first installment is generated immediately after plan creation and will be in `pending` state.
- Even if an APPROVED mandate is attached to the plan, **no payment is auto-created** for this first installment. You must create the payment manually using the Payments API.
- The installment is retrievable via the List all MF Purchases API by filtering on the plan ID.
- For ONDC gateway plans, the plan goes through `created → review_completed → confirmed → active` before the first installment can be paid. Consent must be collected and the plan confirmed before proceeding to payment.
- All subsequent installments follow the normal recurring schedule, unaffected by this flag.

---

## Use Case 1 — New Investor Onboarding: Capture the Aha Moment

When a new investor completes onboarding — sets up their profile, approves a mandate, and registers a SIP — the natural expectation is that their investment starts today. Without `generate_first_installment_now`, the first SIP installment only triggers on the next scheduled installment date, which could be days or weeks away. The investor walks away without any tangible confirmation that their money moved, which weakens the sense of completion and momentum.

By setting `generate_first_installment_now = true` on plan creation, you can collect payment for the first installment on the same day the investor onboards, capturing peak intent and completing the full investment cycle in a single session.

### Flow (ONDC Gateway)

**Step 1 — Complete investor onboarding**

Create the investor profile and MF investment account.

```
POST /v2/investor_profiles
POST /v2/mf_investment_accounts
```

**Step 2 — Create and approve a mandate**

Create a mandate and redirect the investor to authorise it.

```
POST /api/pg/mandates
POST /api/pg/payments/emandate/auth
```

Wait for `mandate_status = APPROVED` before proceeding. Simulate in sandbox:

```
POST /api/pg/simulate/mandates/{mandate_id}
Body: { "status": "APPROVED" }
```

**Step 3 — Create the purchase plan**

Create the plan with `generate_first_installment_now = true`. The plan enters `created` state and the ONDC gateway begins its asynchronous review.

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

Obtain OTP consent from the investor and confirm the plan.

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

```
GET /v2/mf_purchases?plan=mfpp_xxx
```

Retrieve the installment's `old_id` — this is required for payment creation.

**Step 7 — Create payment**

```
POST /api/pg/payments/nach

{
  "mandate_id": <mandate_id>,
  "amc_order_ids": [<installment_old_id>]
}
```

The investor's first SIP payment is collected today. Subsequent installments follow the normal monthly schedule.

### Sandbox Simulation

Simulate the first installment order reaching a successful state:

```
POST /api/oms/simulate/orders/{amc_order_id}
Body: { "status": "SUCCESSFUL" }
```

---

## Use Case 2 — Lump Sum Purchase Using an Existing Mandate

An investor with an active SIP already has an APPROVED mandate in place. When they want to make a separate one-time investment in a different mutual fund, the natural expectation is to use that same mandate rather than going through a fresh Netbanking or UPI flow. Without `generate_first_installment_now`, there is no straightforward way to do this — a standard lump sum purchase order does not natively support mandate-based payment.

By creating a non-systematic purchase plan with `generate_first_installment_now = true` and `number_of_installments = 1`, you generate a one-time purchase installment immediately and collect payment via the investor's existing mandate. You can surface this as a payment option in your UI — alongside Netbanking and UPI — labelled something like "Use your existing mandate", so the investor can complete the purchase without setting up anything new.

### Flow (RTA or ONDC Gateway)

**Step 1 — Confirm mandate availability**

Fetch the investor's mandates and verify that at least one is in APPROVED state.

```
GET /api/pg/mandates?bank_account_id=<bank_account_old_id>
```

**Step 2 — Create a non-systematic purchase plan**

Create a plan with `systematic = false`, `number_of_installments = 1`, and `generate_first_installment_now = true`. This produces a single one-time installment immediately.

```
POST /v2/mf_purchase_plans

{
  "mf_investment_account": "mfia_xxx",
  "scheme": "INF204KA1B64",
  "frequency": "monthly",
  "amount": 25000,
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

```
GET /v2/mf_purchases?plan=mfpp_xxx
```

**Step 4 — Collect consent and confirm the order**

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

**Step 5 — Show payment options to the investor**

Present the investor with their available payment methods, including their existing mandate as an option.

**Step 6 — Create payment via mandate**

```
POST /api/pg/payments/nach

{
  "mandate_id": <mandate_id>,
  "amc_order_ids": [<installment_old_id>]
}
```

The lump sum is debited via the investor's existing mandate. The plan completes after this single installment and no further installments are generated.

### Sandbox Simulation

Simulate mandate-based payment approval and order success:

```
POST /api/pg/simulate/payments/{payment_id}
Body: { "status": "APPROVED" }

POST /api/oms/simulate/orders/{amc_order_id}
Body: { "status": "SUCCESSFUL" }
```

---

## Use Case 3 — Payment Retry for Any Installment

A payment for an installment fails — whether it is the first installment generated via this flag or any subsequent recurring installment. Rather than cancelling the plan or creating a new one, you can retry payment against the same installment directly. The order is not auto-cancelled on payment failure and does not need to go back through consent or confirmation. You simply create a new payment against the same `amc_order_id`.

A retry can be initiated when the previous payment attempt is marked as `FAILED`, the associated order is not in a `failed` or `cancelled` state, and no successful or pending payment currently exists for the same order. Each retry produces a new payment ID; all prior failed attempts are automatically ignored once a payment succeeds.

### Flow

**Step 1 — Detect the failed payment**

Listen for the `payment.failed` webhook event, or poll the payment.

```
GET /api/pg/payments/{payment_id}
```

Confirm `status = FAILED`.

**Step 2 — Verify the order is still actionable**

```
GET /v2/mf_purchases/{order_id}
```

Confirm the order is not in `failed` or `cancelled` state. If the order is in `pending` state, also confirm it has not exceeded the expiry window by checking `scheduled_on`.

**Step 3 — Create a new payment**

Use the same `amc_order_ids` as before. The order does not need to be re-confirmed.

For eNACH or UPI Autopay:

```
POST /api/pg/payments/nach

{
  "mandate_id": <mandate_id>,
  "amc_order_ids": [<order_old_id>]
}
```

For Netbanking or UPI:

```
POST /api/pg/payments/netbanking

{
  "amc_order_ids": [<order_old_id>],
  "payment_postback_url": "https://yourapp.com/payment_status"
}
```

If this retry also fails, the same process can be repeated. There is no limit on the number of payment attempts as long as the order remains actionable.

**A note on systematic purchase plans:** Be aware of the SEBI-mandated consecutive failed installment limits. A monthly SIP is auto-cancelled after 3 consecutive failures; quarterly, half-yearly, and yearly plans after 2. Once the plan is auto-cancelled, no further installments can be generated and a new plan must be created.

### Sandbox Simulation

Simulate a failure then a successful retry:

```
POST /api/pg/simulate/payments/{payment_id}
Body: { "status": "FAILED" }

POST /api/pg/simulate/payments/{new_payment_id}
Body: { "status": "APPROVED" }
```

---

## Use Case 4 — Immediate First Purchase on a Non-Systematic Scheduled Plan

When setting up a non-systematic quarterly or half-yearly purchase plan, the first installment would normally only be generated at the next scheduled cycle date — potentially months away. This is a friction point for distributors building model portfolios or investors who want all positions initiated on the day the plan is created.

By setting `generate_first_installment_now = true`, the first purchase is executed immediately on plan creation. All subsequent installments then follow the normal frequency-based schedule from that point forward, unaffected.

### Flow (RTA Gateway)

**Step 1 — Create the non-systematic plan**

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

The plan activates immediately and the first installment is generated in `pending` state.

**Step 2 — Fetch the generated installment**

```
GET /v2/mf_purchases?plan=mfpp_xxx
```

**Step 3 — Collect consent and confirm the order**

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

Since this is a non-systematic plan, each installment is treated as a lump sum purchase. Payment can be collected via Netbanking, UPI, or an existing mandate.

```
POST /api/pg/payments/netbanking

{
  "amc_order_ids": [<installment_old_id>],
  "payment_postback_url": "https://yourapp.com/payment_status"
}
```

Subsequent quarterly installments are generated automatically by FP on the 1st of every quarter from the next cycle.

### Sandbox Simulation

Simulate the order reaching a successful state:

```
POST /api/oms/simulate/orders/{amc_order_id}
Body: { "status": "SUCCESSFUL" }
```

---

## API Quick Reference

| Action | Method | Endpoint |
|--------|--------|----------|
| Create purchase plan | POST | `/v2/mf_purchase_plans` |
| Update / confirm plan | PATCH | `/v2/mf_purchase_plans` |
| List installments for a plan | GET | `/v2/mf_purchases?plan={plan_id}` |
| Confirm a purchase order | PATCH | `/v2/mf_purchases` |
| Create mandate | POST | `/api/pg/mandates` |
| Authorise mandate | POST | `/api/pg/payments/emandate/auth` |
| Create eNACH / UPI Autopay payment | POST | `/api/pg/payments/nach` |
| Create Netbanking / UPI payment | POST | `/api/pg/payments/netbanking` |
| Fetch payment | GET | `/api/pg/payments/{payment_id}` |
| Simulate mandate status (sandbox) | POST | `/api/pg/simulate/mandates/{mandate_id}` |
| Simulate payment status (sandbox) | POST | `/api/pg/simulate/payments/{payment_id}` |
| Simulate order status (sandbox) | POST | `/api/oms/simulate/orders/{amc_order_id}` |

---

Need help? Contact the support team at customerservice@cybrilla.com
