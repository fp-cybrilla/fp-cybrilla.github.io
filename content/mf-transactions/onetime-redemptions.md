---
title: Sell a mutual fund
---
## Sell a mutual fund
#### Facilitate redemptions for your investor

Mutual fund units are associated with folios. You can treat folios as sub-accounts under the investment account. You can fetch the list of folios for an investment a/c from the [FPDocs, holdings report](https://fintechprimitives.com/api/#get-holding-report). `redeemable_units` shows the number of units that are available for selling. You can use the FP APIs to sell the units partially or in total.

#### 1. Create a sell order

Call the [FPDocs, create mf redemption](https://fintechprimitives.com/docs/api/#create-a-mf-redemption) with the following json. Use the investment account of the investor for whom you are placing the order for. Pass the `folio_number` and `scheme` from which you are selling the units.

```json
{
  "mf_investment_account": "mfia_189111b00566431db0dace5332db519c",
  "folio_number": "15075102",
  "amount": 10000,
  "scheme": "INF173K01FQ0"
}
```

A MF Redemption gets created in `pending` state. Keep a note of the object id for tracking the status of the order.

```json
# Displaying only a part of the object for brevity
{
  "object": "mf_redemption",
  "id": "mfr_15f8d86bae614801bab5accaed131abc",
  "old_id": 6597,
  "mf_investment_account": "mfia_189111b00566431db0dace5332db519c",
}
```
#### 2. Obtain investor's consent for the redemption order by sending an OTP to email or mobile or both
As per [SEBI regulations](https://www.sebi.gov.in/legal/circulars/mar-2022/discontinuation-of-usage-of-pool-accounts-for-transactions-in-the-units-of-mutual-funds-clarifications-with-respect-to-circulars-dated-october-4-2021_56887.html), investor consent must be obtained by sending a One-Time Password to the investor at his/her email/phone number registered against the folio before redemptions can be sent to rtas. Call the [FPDocs, List folios](https://fintechprimitives.com/docs/api/#list-folios) API and fetch email addresses and mobile numbers against the folio.
```json
# Displaying only a part of the folio object for brevity
{
  "email_addresses": [
    "mfp@cybrilla.com"
  ],
  "mobile_numbers": [
    "+919999999999"
  ]
}
```
Send OTP to any one of the email addresses/mobile numbers. Once the OTP has been sent and investor has entered the correct OTP, confirm the order.

#### 3. Confirm the order

Call the [FPDocs, update mf redemption](https://fintechprimitives.com/docs/api/#update-a-mf-redemption) to confirm the order. FP sends it for processing only after confirmation. Use the following json:

```json
{
  "id": "mfr_15f8d86bae614801bab5accaed131abc",
  "state": "confirmed",
  "consent": {
    "email": "mfp@cybrilla.com",
    "isd_code": "91",
    "mobile": "9999999999"
  }
}
```

#### 4. Track the order

Call the [FPDocs, fetch mf redemption](https://fintechprimitives.com/docs/api/#fetch-a-mf-redemption) to check the `state` of the sell order.  
When the order is successfully submitted to the AMC, the order status becomes `SUBMITTED`. [Learn more about the order states](/mf-transactions/order-states)

Orders in `confirmed` state will be sent for processing and the object state will move to `submitted`. After the order is processed successfuly and units are repurchased by the AMC, the object state will move to `successful`; the redeemed units, amount and the price is available in `redeemed_units`, `redeemed_amount` and `redeemed_price` attributes of the mf redemption object.

### Testing

In sandbox environment, you can use the [FPDocs, simulation](https://fintechprimitives.com/api/#post-order-simulation) to simulate `successful` and `failed` orders to help you during the integration process. Use the following json to simulate the order to `successful` state.

```json
{
  "status": "SUCCESSFUL"
}
```