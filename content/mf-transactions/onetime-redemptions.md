## Create a Redemption Order

You can use the FP APIs to 
1. Determine whether an investor can sell his/her units.
2. Determine the maximum number of units that the investor can sell
3. Sell units partially or completely.
4. Track the status of redemption orders once sell orders are placed.


#### 1. Fetch fund scheme details
Use [FPDocs, Get fund scheme](https://fintechprimitives.com/docs/api/#fund-scheme) and note down the values of following scheme attributes
1. `redemption_allowed`, 
2. `min_withdrawal_amount`,
3. `max_withdrawal_amount`,
4. `withdrawal_multiples`, 
5. `min_withdrawal_units`,
6. `max_withdrawal_units`,
7. `withdrawal_multiples_units`


#### 2. Generate holdings report
Mutual fund units are associated with folios. You can treat folios as sub-accounts under the investment account. You can fetch the list of folios for an investment a/c from the [FPDocs, holdings report](https://fintechprimitives.com/docs/api/#generate-holdings-report)and note down `redeemable_units` to determine the units that are available for selling.

#### 3. Check redemption eligibility
**Redeem by amount**
1. `redemption_allowed` must be true.
2. `redeemable_amount` must be greater than zero.
3. Redemption amount(Sell order amount) must be >=`min_withdrawal_amount` and <=`max_withdrawal_amount`
4. Redemption amount must be in the denominations of `withdrawal_multiples`

**Redeem by units**
1. `redemption_allowed` must be true.
2. `redeemable_units` must be greater than zero.
3. Redemption units(Sell order units) must be >=`min_withdrawal_units` and <=`max_withdrawal_units`
4. Redemption amount must be in the denominations of `withdrawal_multiples_units`

#### 4. Create a sell order

Call the [FPDocs, create mf redemption](https://fintechprimitives.com/docs/api/#create-a-mf-redemption) with the following json. Use the investment account of the investor for whom you are placing the order for. Pass the `folio_number` and `scheme` from which you are selling the units.

**Redemption by amount**
```json
{
    "mf_investment_account": "mfia_189111b00566431db0dace5332db519c",
    "folio_number": "15075102",
    "amount": 10000,
    "scheme": "INF173K01FQ0"
}
```
**Redemption by units**
```json
{
    "mf_investment_account": "mfia_189111b00566431db0dace5332db519c",
    "folio_number": "15075102",
    "units": 100,
    "scheme": "INF173K01FQ0"
}
```
**Full redemption**
```json
{
    "mf_investment_account": "mfia_189111b00566431db0dace5332db519c",
    "folio_number": "15075102",
    "scheme": "INF173K01FQ0"
}
```

A MF Redemption gets created in `pending` state. 

```json
# Displaying only a part of the object for brevity
{
  "object": "mf_redemption",
  "id": "mfr_15f8d86bae614801bab5accaed131abc",
  "old_id": 6597,
  "mf_investment_account": "mfia_189111b00566431db0dace5332db519c",
}
```
Once you have created a redemption order, you have to obtain consent from the investor for the redemption. 

#### 5. Obtain investor's consent for the redemption order by sending an OTP to email or mobile or both

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

#### 6. Confirm the order

Call the [FPDocs, update mf redemption](https://fintechprimitives.com/docs/api/#update-a-mf-redemption) to confirm the order. FP sends orders for processing only after confirmation. Use the following json:

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

#### 7. Track the order

Call the [FPDocs, fetch mf redemption](https://fintechprimitives.com/docs/api/#fetch-a-mf-redemption) to check the `state` of the sell order.  
When the order is successfully submitted to the AMC, the order status becomes `submitted`. [Learn more about the order states](/mf-transactions/order-states)

Orders in `confirmed` state will be sent for processing and the object state will move to `submitted`. After the order is processed successfuly and units are repurchased by the AMC, the object state will move to `successful`; the redeemed units, amount and the price is available in `redeemed_units`, `redeemed_amount` and `redeemed_price` attributes of the mf redemption object.

### Testing

In sandbox environment, you can use the [FPDocs, simulation](https://fintechprimitives.com/docs/api/#order-simulation) to simulate `successful` and `failed` orders to help you during the integration process. Use the following json to simulate the order to `successful` state.

```json
{
    "status": "SUCCESSFUL"
}
```
