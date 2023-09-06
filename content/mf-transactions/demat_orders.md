---
title: Demat orders
---
## Demat Orders

#### Introduction

A Demat account helps investors hold their investments in an electronic format. These investments can be in securities as well as mutual funds. 

## Open an investment account for an investor with Demat account and buy/sell mutual funds

### 1. Create an investor profile

Refer this guide to create an [investor profile](https://docs.fintechprimitives.com/mf-transactions/investment-account/)

### 2. Add a Demat account to the investor profile

Demat accounts are overseen by depository participants (DPs), who act as intermediaries between investors and the central depository, ensuring seamless transactions and safekeeping of assets. FP APIs assume that the Demat account for the investor is created at your end.

Refer API docs to add [ a demat account](https://fintechprimitives.com/docs/api/#demat-account-object) to your investor profile in FP.

> A demat account number is a 16 digit number obtained at the time of Demat account creation with the depository. First 8 digit represent the DP's ID and last 8 digit represent the client ID of the investor with the depository

Sample Request

```json
{
  "profile": "invp_ef68993a907b48849a02b403fab8da7f",
  "dp_id": "12081800",
  "client_id": "04571343"
}
```

### 3. Set folio defaults in the investment account

Update the demat object id in the investment account's folio default hash. This will ensure that any new investment that is made, will be will be processed in `Demat` mode and available under the folio as well as your demat account with the depository. If the demat object id is `null` in folio defaults, the investment will be processed in `Physical` mode and will be available only in the folio.

Refer API doc for [investment account updation](https://fintechprimitives.com/docs/api/#update-an-mf-investment-account). Use the investor id received in step 1 to create an investment account.

Sample request

```json
{
  "id": "mfia_14bafabfbfbc423d9b54412dd577981b",
  "folio_defaults": {
    
    "demat_account": "dac_156e3c3bb66e447d8fe7e44d7d941f5a"
  }
}
```

### 4. Buy mutual funds for Demat investors
You can place mutual fund purchases and redemptions for investors with demat account using order APIs.

#### Select fund Scheme
Refer [Get fund scheme API](https://fintechprimitives.com/docs/api/#fund-scheme) , and ensure that the scheme is eligible for the demat delivery. 

|delivery_mode|Description|
|-----|------|
|`DEMAT`|Purchases in the scheme will be delivered to the demat account associated with the folio|
|`PHYSICAL`|Purchases in the scheme will be delivered to the folio only|
|`DEMAT_PHYSICAL`|Purchases in the scheme will be delivered to the folio as well as the the demat account associated|

#### Purchases

1. Refer API docs to place [one time](https://fintechprimitives.com/docs/api/#mf-purchase-object) as well as [recurring purchase](https://fintechprimitives.com/docs/api/#purchase-plan-object-structure) orders. You do not need to explicitly mention the delivery mode Demat or Physical in while placing an order. This is automatically determined as below:
   1. If you are placing a first purchase order in a new folio, and the investment account has demat object id set in the `folio_defaults`, then the MF units will be delivered in the demat account along with a folio. When the folio is created, it will contain the demat account details. 
   1. If you are placing a purchase order in an existing folio, and the folio has demat id set, then the MF units will be delivered in the demat account along with a folio.   

Note
> 1. You need to collect 2FA for the purchase orders via OTP on the email or phone that is associated with the folio number. Update the FP orders once consent is collected at your end so that FP can process them further. Refer API Docs to update consent for [one time orders](https://fintechprimitives.com/docs/api/#update-a-mf-purchase) and [recurring purchase plans](https://fintechprimitives.com/docs/api/#update-a-purchase-plan)
> 2. Only one folio will be created within each AMC if you are using demat account for MF purchases. Example: You already have a folio no. `61576584` with an AMC say `ICICI prudential` which is associated with your demat account `1208180004571343`. If you try to create a purchase in a new folio with FP for same AMC and same demat account in MF investment account, then you will recieve MF units in earlier created folio `61576584` only.


#### Folios

1. Refer API docs for [folio details](https://fintechprimitives.com/docs/api/#mf-redemption-object)
   1. If a demat account was associated with the first purchase when the folio was created, the folio object will contain the demat account details. 

### 5. Sell mutual funds for Demat investors

You can only place a one time redemption order for folios which are linked to a demat account. Refer API docs to place a [one time](https://fintechprimitives.com/docs/api/#mf-redemption-object) redemption order

Note:

> 1. You need to collect 2FA for the redemption orders via OTP on the email or phone that is be associated with the folio number. Update the FP orders once consent is collected at your end so that FP can process them further. Refer API Docs to update consent for [one time redemption orders](https://fintechprimitives.com/docs/api/#update-a-mf-redemption)
   > 1. You will need to collect 2FA for all redemption orders even if the investor may have submitted a DDPI\POA to the broker. This is required as DDPI\POA are not currently supported out of exchange systems.
> 2. Recurring redemption, one time and recurring switches are not supported for folios linked to demat account
> 3. You can only redeem by `units` from folios that are linked to demat account currently.
> 4. If the DP ID of the demat account in the folio object does not match with the DP ID setup for your tenant, redemptions will be rejected for folios linked with demat account


