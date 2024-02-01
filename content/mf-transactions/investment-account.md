---
title: Open an investment account
---

## Open an investment account
#### Use this guide to create an investment account for your investor

Investment Account is a holding account for all your investor's mutual fund investments.

Call [FPDocs, create investment account](https://fintechprimitives.com/docs/api/#create-an-mf-investment-account) with the following json to create an investment account with single holding pattern

```json
{
  "primary_investor": "invp_c55240e4b09d4617812bb9557b399a42", // you can use individual or non-individual investor profile
  "holding_pattern": "single",
}
```

#### Folio defaults

When a new folio is opened as part of fresh purchase, the information about communication details, payout bank details etc. is taken from the `folio_defaults` hash. There is no option to override this information while placing an order.

If your investor needs to put different information in the new folio, update `folio_defaults` in the investment account before placing a fresh purchase order.

**Communication Details**  
Add email address, phone number and physical address details on which the investor would like to get all communications from the AMC. Typically account statements, order confirmations are sent to these. Email address and phone number mentioned here are also used for sending OTPs during additional purchases, redemptions, fetching cas statements etc.  

Call [FPDocs, update investment account](https://fintechprimitives.com/docs/api/#update-an-mf-investment-account) with the following json

```json
{
  "id": "", // investment account id
  "folio_defaults": {
    "communication_email_address": "email_bf1026954d0545e190727de1537d9e66",
    "communication_mobile_number": "phone_0f4a90134705474eb2e354d9b5ba5f56",
    "communication_address": "addr_8c50b6930ebf4ec7a7ddd58c34bdf1d8"
  }
}
```

**Payout Bank Account**  
Add the bank account to which all redemption payouts, dividends, refunds etc are sent.  

Call [FPDocs, update investment account](https://fintechprimitives.com/docs/api/#update-an-mf-investment-account) with the following json

```json
{
  "id": "", // investment account id
  "folio_defaults": {
    "payout_bank_account": "bac_8c50b6930ebf4ec7a7ddd58c34bdf1d8"
  }
}
```

**Nomination**  
If your investor wants to nominate anyone, you can add upto 3 nominees with different allocations.

Call [FPDocs, update investment account](https://fintechprimitives.com/docs/api/#update-an-mf-investment-account) with the following json

```json
{
  "id": "", // investment account id
  "folio_defaults": {
    "nominee1": "relp_8c50b6930ebf4ec7a7ddd58c34bdf1d8",
    "nominee1_allocation_percentage": 50,
    "nominee2": "relp_55240e4b09d4617812bb9557b399a42",
    "nominee2_allocation_percentage": 50
  }
}
```

If nominee details are not provided in folio defaults, FP assumes that the investor doesn't wish to nominate anyone and accordingly process the orders.

**Demat Account**  
If your investor wants the MF units to be delivered to his demat account, you can add his demat account details. All investments in the folio will be processed and sent to his demat account.

Call [FPDocs, update investment account](https://fintechprimitives.com/docs/api/#update-an-mf-investment-account) with the following json

```json
{
  "id": "", // investment account id
  "folio_defaults": {
    "demat_account": "dac_156e3c3bb66e447d8fe7e44d7d941f5a"
  }
}
```