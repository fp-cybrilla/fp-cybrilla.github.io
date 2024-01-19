---
title: Buy/sell MF in demat
---
## Buy/sell MF in demat
Learn how to get MF units delivered to a demat account

> Note the below prerequisites for buying and selling MF in demat mode

**Buy MF in demat**

1. An investor should have an active demat account. FP does not support opening new demat accounts currently.
2. FP will enable MF purchase processing via your AMC\RTA channel partner account

**Sell MF from demat**
1. Per current industry norms, MF redemptions have to be submitted to depositories only for processing.
2. Share your depository participant credentials as described below. FP will use the same to enable redemption processing from your investor's demat account.
   1. If your depository is NSDL, credentials of your business partner module (https://121.240.225.109/dpm-web/)
      1. User name
      2. Password
      3. BPID
   2. If your depository is CDSL, credenitals of your CDSL app (cdslweb.cdslindia.com)
      1. Login ID
      2. Password
      3. DPID
3. The above DP credentials will be configured in your FP tenant to accept MF redemption orders

## Demat orders
 
**Open an investment account with demat account details**

1. Create an [investor profile](https://docs.fintechprimitives.com/mf-transactions/accounts/required-information//)
2. Add a [demat account](https://fintechprimitives.com/docs/api/#demat-accounts) to the investor profile
   1. A demat account number is a 16 digit number obtained at the time of demat account creation with the depository. First 8 digit represent the DP's ID and last 8 digit represent the client ID of the investor with the depository

Sample Request

```json
{
  "profile": "invp_ef68993a907b48849a02b403fab8da7f",
  "dp_id": "12081800",
  "client_id": "04571343"
}
```
3. Set folio defaults in the investment account

Update demat object id in `folio_defaults` of an investment account . This will ensure a new investment will be processed in `demat` mode. If the demat object id is `null` , the investment will be processed in `physical` mode and will be available only in the folio.

Sample request

```json
{
  "id": "mfia_14bafabfbfbc423d9b54412dd577981b",
  "folio_defaults": {
    
    "demat_account": "dac_156e3c3bb66e447d8fe7e44d7d941f5a"
  }
}
```
**Orders in demat mode**

1. Select fund Scheme with demat delivery mode
   1. Ensure that the [scheme](https://fintechprimitives.com/docs/api/#fund-scheme)  for purchase order is eligible for the demat delivery. Refer to `delivery_mode` attribute in scheme master.

|delivery_mode|Description|
|-----|------|
|`DEMAT`|Units will be delivered to the demat account associated with the folio|
|`PHYSICAL`|Units will be delivered to the folio only|
|`DEMAT_PHYSICAL`|Units will be delivered to the folio and the demat account associated|

2. Place an MF buy/sell order
   1. Supported order types
      1. [Lumpsum purchase](https://docs.fintechprimitives.com/mf-transactions/orders-introduction/)
      2. [Recurring purchase](https://docs.fintechprimitives.com/mf-transactions/transaction-plans/)
      3. [One time Redemption](https://fintechprimitives.com/docs/api/#mf-redemptions)
   > Note: Switch, STP, SWP orders are not supported currently by the depositories. Let us know if your DP account has support for this, so we can enable these orders for you.

   1. You do not need to explicitly mention the delivery mode `Demat` or `Physical` while placing an order. This is automatically determined as below:
   2. If you are placing a first purchase order in a new folio, and the MF investment account has demat object id set in the `folio_defaults`, then the MF units will be delivered in the demat account along with a folio. When the folio is created, it will contain the demat account details. 
   3. If you are placing a purchase order in an existing folio, and the folio has demat id set, then the MF units will be delivered in the demat account along with a folio.   

3. Consents for purchase orders
   1. You need to collect 2FA\consent for the orders on email or phone or both that is associated with the folio number. 
   2. As per industry norms, consent can be collected via an OTP or esign. FP supports consent for orders via OTP currerntly.
   
> Note on MF redemptions:

> 1. You need to collect consent for MF redemption orders even if the investor has submitted a DDPI\POA document to the DP. This is required as DDPI\POA are not currently supported out of exchange systems for online redemptions.
> 2. You can only redeem by `units` from folios that are linked to demat account currently.
> 3. If the DP ID of the demat account in the mf folio object does not match with the DP ID configured in your FP tenant, MF redemptions will be rejected. 


**Folios**

1. Refer API docs for [folio details](https://fintechprimitives.com/docs/api/#mf-redemption-object)
   1. If a demat account was associated at the time of folio creation, the folio object will contain the demat account details. 
   2. As per current industry norms, only one folio will be created within each AMC if you are buying MF in demat. Example: You already have a folio no. `61576584` with an AMC say `ICICI prudential` which is associated with your demat account `1208180004571343`. If you try to create a purchase in a new folio for same AMC and same demat account in MF investment account, then you will recieve MF units in earlier created folio `61576584` only.




