---
title: Switch from one scheme to another
---
## Switch from one scheme to another
#### Facilitate switch orders for your investor

You can use MF switch order APIs to :

 - Switch from one scheme to another scheme in the same AMC.
 - Switch units from one scheme to another partially or completely.
 - Switch amount from one scheme to another partially or completely.
 - Track the status of switch orders placed.

#### 1. Check eligibility for switch in and switch out orders

If you are switching out from the scheme, you should ensure that

 - The switch_out scheme must be active and `switch_out_allowed` attribute must be true
 - The `switch_out` order amount must be >= `min_switch_out_amount`
 - The units you are switching out from the scheme must be >=`min_switch_out_units`
 - The `switch_out` order amount must be in the denomination of `switch_out_amount_multiples`
 - The `switch_out` order units must be in the denomination of `switch_out_unit_multiples`

If you are switching in to the scheme, use [get fund scheme](https://fintechprimitives.com/api/#get-single-fund-schemes-detail) and ensure that

 - The switch_in scheme must be active and `switch_in_allowed` attribute must be true
 - The `switch_in` order amount must be >=`min_switch_in_amount`
 - The `switch_in` order amount must be in the denomination of `switch_in_amount_multiples`

#### 2. Create a switch order

You can create a switch order by calling [create mf switch](https://fintechprimitives.com/docs/api/#create-a-mf-switch) api. You should provide the isin of the `switch_in` scheme and `switch_out` scheme along with the investment account and folio number for which the order should be placed.

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

#### 3. Obtain investor's consent for the switch order by sending an OTP to email or mobile or both

As per [SEBI regulations](https://www.sebi.gov.in/legal/circulars/mar-2022/discontinuation-of-usage-of-pool-accounts-for-transactions-in-the-units-of-mutual-funds-clarifications-with-respect-to-circulars-dated-october-4-2021_56887.html), investor consent must be obtained by sending a One Time Password to the investor, at his/her email/phone number registered against the folio before redemptions can be sent to RTAs. Call the [List folios](https://fintechprimitives.com/docs/api/#fetch-all-folios) API and fetch email addresses and mobile numbers against the folio.

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

Send OTP to any one of the email addresses/mobile numbers. Once the OTP has been sent and investor has entered the correct OTP, You can confirm the order.

#### 4. Order confirmation

You can use  [update mf switch](https://fintechprimitives.com/docs/api/#update-a-mf-switch)  to confirm the order. FP sends orders for processing only after confirmation. Use the following json:
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

#### 5. Track the order

You can check the state of the switch order by calling [fetch mf switch](https://fintechprimitives.com/docs/api/#fetch-a-mf-switch) api. When the order is successfully submitted to the AMC, the order status becomes  `submitted`. You can learn more about the order states [here](https://docs.fintechprimitives.com/mf-transactions/order-states).


### **Testing**

In sandbox, use the  [order simulation api](https://fintechprimitives.com/docs/api/#order-simulation)  to simulate  `successful`  and  `failed`  orders to help you during the integration process. Use the following json to simulate the order to  `successful`  state.

```json
    {  
    "status": "SUCCESSFUL"
    }
```
