## Product Roadmap
Note: All the capabilities will be available via FP-CybrillaPOA route.

### December 2025
| Roadmap Item | Remarks |
|---------------|----------|
| Ability to use UPI Autopay and E-NACH mandates against lumpsum purchases (both single & batch) and First SIP installments (both Batch SIP and single SIP) | This will allow first SIP instalment to be debited within the first two days after mandate registration. |
| Skip SIP instalments | Note: This facility is different from Pause SIP. With this facility you can skip a specific installment at once. The next installment will not be impacted.|
| Change mandate of an existing SIP: Updating mandate ID in purchase plan | Buyerapps will be able to update the mandate ID within a purchase plan. |

### November 2025
| Roadmap Item | Remarks |
|---------------|----------|
| Ability for Buyerapps to collect payments on their own against lumpsum purchase orders |  |
| Nomination changes for opting out | This is a regulatory requirement and all buyerapps will be required to integrate this. |
| Same day settlement for batch lumpsum purchases | Cutoff time will be 12.30 PM. To start with, this facility will be available with select AMCs.|
| Update mandate status on the FP dashboard if an investor cancels their mandate through a UPI app | Scope is limited to updates regarding the cancellation of a mandate outside the buyerapp. Updates regarding paused mandates will come at a later date. |
| Payment retry for monthly SIP instalments using UPI/netbanking | Buyerapps will be able to allow their investors to manually retry a failed SIP payment through their app. |

### October 2025
| Roadmap Item | Remarks | Status |
|---------------|----------|---------|
| Order review completion performance improvement | Decrease the time taken for state transition from `under_review` to `review_completed` / `pending` for orders/plans. | p95 has been brought down from 10.38 seconds to 2.55 seconds. Incremental improvements will continue. |
| Order submission performance improvement | Decrease the time taken for state transition from `confirmed` to `submitted` and ensure that investors can be redirected for payments faster. | p90 has been brought down from 4.13 seconds to 2.62 seconds. Incremental improvements will continue. |
| Payment Retry | Ability to retry payments again if there is a failed payment against lumpsum purchase orders and first installment of SIPs generated via `generate_first_installment_now` = `true`. | In sandbox |
| Same day settlement – Phase 1 | Same day settlement for payments made against single lumpsum purchase orders **and** payments made against the first installment of single AMC SIP generated via `generate_first_installment_now` = `true`. | This is live for Axis MF, UTI MF, Motilal Oswal MF, and Edelweiss MF.  |


**Note about Same day settlement phase - 1:**
1. Applicable for UPI and some major banks in case of Netbanking.
2. If you create Batch Purchase Plans with `generate_first_installment_now`=`true`, and make a single payment against all first installments of a batch, you wouldn't get same day settlement.

### September 2025

|Roadmap item|Remarks|Status|
|---|---|---|
|KYC Modification|Ability to modify investor's data in the KRA database. Note: Email and Mobile number can be updated. Also, if the KYC status is verified, then such KYCs can be validated by linking the Aadhar. Any other modification is out of scope for this delivery. |Due to KRA related delays, this will now be delivered in November.|
|Calendar day Daily SIP|Daily SIP where installments are processed every day of the week irrespective of business holiday or not.| Activated for specific ISINs.|
|Switch orders|Ability to switch between different schemes of the same AMC. Distributors can switch from one Regular scheme to other and Advisors can switch from one direct scheme to other.|In sandbox|
|List fund schemes API|Access all schemes available via Cybrilla POA gateway.|In sandbox|
