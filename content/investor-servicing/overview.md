---
title: Investor servicing Overview
---
## Investor servicing
#### Know about handling MF investor service requests with FP APIs

Currently FP supports Non-financial / Non-commercial transactions which deal with any service requests pertaining to modification of certain information that are mapped to an account or a folio.

With FP APIs, you can now perform the below listed non-commercial transactions (NCTs) -
- [Phone number NCT](https://docs.fintechprimitives.com/investor-servicing/phone-number-nct/)

### Decoding NCT statuses
|Status|Description|
|-|-|
|`consent_required`|This is the initial status of an NCT object which indicates that the NCT request has been placed and the system is awaiting for the investor's consent which would be sent on the phone number mapped against the folio|
|`second_consent_required`|This indicates the NCT object is expecting the investor to provide a second consent on the phone number that is requested to be updated on the folio. This would be present only if `non_commercial_transaction.type` = `update_phone_number`|
|`submitted`|This indicates that the NCT request has been submitted to the gateway for further processing|
|`successful`|This indicates that the NCT request has been successful and the requested information has been updated on the folio|
|`failed`|This indicates that the NCT request failed due to some reason. You can refer to `failure_code` for the exact reason|
|`expired`|This indicates that the NCT request expired due to some reason. You can refer to `failure_code` for the exact reason|

### Going live

To go live with Phone number NCT, ensure that you take care of the below points -

- You need to contact with `MF Central` and procure access to their NCT APIs
  - We need the following details from MF Central to enable NCTs in your FP account -
      - clientId
      - clientSecret
      - userName
      - password
      - encryptionDecryptionKey
      - privateKey
      - publicKey

Email us at [fpsupport@cybrilla.com](mailto:fpsupport@cybrilla.com) when you are ready.
