---
title: Switch from one scheme to another
---
## Switch from one scheme to another
#### Facilitate switch transactions for your investor

You can use MF switch order APIs to :

 - Switch from one scheme to another scheme in the same AMC.
 - Switch units from one scheme to another partially or completely.
 - Track the status of switch orders placed.

#### 1. Fetch fund scheme details

If you are switching in to the scheme, Use [Get fund scheme](https://fintechprimitives.com/api/#get-single-fund-schemes-detail) and ensure that you have the following scheme attributes

 - `switch_in_allowed`,
 - `min_switch_in_amount`,
 - `switch_in_amount_multiples`

If you are switching out from the scheme, Use [Get fund scheme](https://fintechprimitives.com/api/#get-single-fund-schemes-detail) and  ensure that you have the following scheme attributes

 - `switch_out_allowed`,
 - `min_switch_out_amount`,
 - `min_switch_out_units`,
 - `switch_out_amount_multiples`,
 - `switch_out_unit_multiples`


#### 2. Check eligibility for switch in and switch out orders

To switch in to the new scheme, you should make sure that
 
 - `switch_in_allowed` attribute must be true
 - The `switch_in` order amount must be >=`min_switch_in_amount`
 - The `switch_in` order amount must be in the denomination of `switch_in_amount_multiples`

If you are switching out from the scheme, you should ensure that

 - `switch_out_allowed` attribute must be true
 - The `switch_out` order amount must be >= `min_switch_out_amount`
 - The units you are switching out from the scheme must be >=`min_switch_out_units`
 - The `switch_out` order amount must be in the denomination of `switch_out_amount_multiples`
 - The `switch_out` order units must be in the denomination of `switch_out_unit_multiples`

#### 3. Create a switch order

 You can create a switch order by calling [create mf switch](https://fintechprimitives.com/docs/api/#create-a-mf-switch) api. You should provide the isin of the source scheme in `switch_in_scheme` attribute and isin of the destination scheme in  `switch_out_scheme` attribute along with the investment account and `folio_number` for which the order should be placed.

**Switch order by amount**
```json
{
  "mf_investment_account": "mfia_189111b00566431db0dace5332db519c",
  "folio_number": "15075102",
  "amount": 10000,
  "switch_out_scheme": "INF273K01FQ0",
  "switch_in_scheme": "INF171K07FQ0"
  }
```

**Switch order by units**
```json
{
  "mf_investment_account": "mfia_189111b00566431db0dace5332db519c",
  "folio_number": "15075102",
  "units": 1000,
  "switch_out_scheme": "INF273K01FQ0",
  "switch_in_scheme": "INF171K07FQ0"
  }
```
**For full switch in or full switch out orders**
 ```json
{
  "mf_investment_account": "mfia_189111b00566431db0dace5332db519c",
  "folio_number": "15075102",
  "switch_out_scheme": "INF273K01FQ0",
  "switch_in_scheme": "INF171K07FQ0"
  }
```

An `mf_switch` order gets created for which you need to make a payment.

```json
# Displaying only a part of the object(response) for brevity
{
  "object": "mf_switch",
  "id": "mfs_b1aba06d52184619151d3b82efa65de6",
  "old_id": 16586,
  "mf_investment_account": "mfia_189111b00566431db0dace5332db519c"
}
```

Once you have created a switch order, you have to obtain consent from the investor for the switch order.

#### 4. Obtain investor's consent for the switch order by sending an OTP to email or mobile or both

As per [SEBI regulations](https://www.sebi.gov.in/legal/circulars/mar-2022/discontinuation-of-usage-of-pool-accounts-for-transactions-in-the-units-of-mutual-funds-clarifications-with-respect-to-circulars-dated-october-4-2021_56887.html), investor consent must be obtained by sending a One -Time Password to the investor at his/her email/phone number registered against the folio before redemptions can be sent to rtas. Call the [List folios](https://fintechprimitives.com/docs/api/#fetch-all-folios) API and fetch email addresses and mobile numbers against the folio.

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

#### 5. Order confirmation

You can use the  [update mf switch](https://fintechprimitives.com/docs/api/#update-a-mf-switch)  to confirm the order. FP sends orders for processing only after confirmation. Use the following json:
```json
    {
      "id": "mfs_b1aba06d52184619151d3b82efa65de6",
      "state": "confirmed",
      "consent": {
        "email": "mfp@cybrilla.com",
        "isd_code": "91",
        "mobile": "9000011111"
      }
    }
```

#### 6. Track the order

You can check the state of the switch order by calling [fetch mf switch](https://fintechprimitives.com/docs/api/#fetch-a-mf-switch) api.When the order is successfully submitted to the AMC, the order status becomes  `submitted`.  You can learn more about the order states [here](https://docs.fintechprimitives.com/mf-transactions/order-states).

For a successful switch in order,
 `switched_in_units` , `switched_in_amount`, `switched_in_price` attributes should be reviewed in the `mf_switch` object.

For a successful switch out order,
 `switched_out_units` , `switched_out_amount`, `switched_out_price` attributes should be reviewed in the `mf_switch` object.

**Testing**

In sandbox, use the  [simulation](https://fintechprimitives.com/docs/api/#order-simulation)  to simulate  `successful`  and  `failed`  orders to help you during the integration process. Use the following json to simulate the order to  `successful`  state.

```json
    {  
    "status": "SUCCESSFUL"
    }
```

### Try APIs with javascript SDK

#### 1. Create a switch order

#### Fund Scheme

```javascript

/**
 * @param string isin
 **/
fpClient.master_data().fetchScheme("INF273K01FQ0")
```

[FPDocs, Fund Scheme reference](https://fintechprimitives.com/docs/api/#fund-scheme)

#### Create a MF Switch

```javascript

/**
 * @param MfSwitchCreateRequest object
 */
fpClient.mf_switches().create({
    mf_investment_account: "mfia_189111b00566431db0dace5332db519c",
    scheme: "INF273K01FQ0",
    amount: 10000,
})
```

[FPDocs, Create a MF Switch reference](https://fintechprimitives.com/docs/api/#create-a-mf-switch)

#### 2. Fetch investor contact details (to be used to collect consent for switch order) from the folio

**This step is applicable only for switch order placed against an existing folio.**

```javascript

/**
 * @param string folio_number
 **/
fpClient.mf_folios().fetchAll({ folio_number: "15075102" })
```

[FPDocs, Fetch all folios reference](https://fintechprimitives.com/docs/api/#fetch-all-folios)

[FPDocs, Sandbox testing reference](https://fintechprimitives.com/docs/api/#testing-fetch-all-folios-api-in-sandbox)

#### 3. Confirm the order

#### Update a MF Switch

```javascript

/**
 * @param MfSwitchUpdateRequest object
 **/
fpClient.mf_switches().update({
    id: "mfs_b1aba06d52184619151d3b82efa65de6",
    state: "confirmed",
    consent: {
        email: "mfp@cybrilla.com",
        isd_code: "91",
        mobile: "9876543212",
    },
})
```

[FPDocs, Update a MF Switch reference](https://fintechprimitives.com/docs/api/#update-a-mf-switch)

#### 4. Track the order

#### Fetch a MF Switch

```javascript

/**
 * @param identifier V2 or V1 ID of the Switch order
 **/
fpClient.mf_switch().fetch("mfs_b1aba06d52184619151d3b82efa65de6")
```

[FPDocs, Fetch a MF Switch reference](https://fintechprimitives.com/docs/api/#fetch-a-mf-switch)
