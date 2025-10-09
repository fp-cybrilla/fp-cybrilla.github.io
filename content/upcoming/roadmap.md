## Product Roadmap
Note: All the capabilities will be available via FP-CybrillaPOA route.

### October 2025
|Roadmap item|Remarks|
|---|---|
|Order review completion performance improvement|Decrease the time taken for state transition from `under_review` to `review_completed`/`pending` for orders/plans.|
|Order submission performance improvement|Decrease the time taken for state transition from `confirmed` to `submitted` and ensure that investors can be redirected for payments faster.|
|Payment Retry|Ability to retry payments again if there is a failed payment against lumpsum purchase orders and first installment of SIPs generated via `generate_first_installment_now`=`true`|
|Same day settlement - Phase 1|	Same day settlement for Payments made against single lumpsum purchase orders `AND` Payments made against first installment of single AMC SIP generated via `generate_first_installment_now`=`true`|

**Note about Same day settlement phase - 1:**
1. Applicable for UPI and some major banks in case of Netbanking.
2. If you create Batch Purchase Plans with `generate_first_installment_now`=`true`, and make a single payment against all first installments of a batch, you wouldn't get same day settlement.

### September 2025

|Roadmap item|Remarks|Status|
|---|---|---|
|KYC Modification|Ability to modify investor's data in the KRA database. Note: Email and Mobile number can be updated. Also, if the KYC status is verified, then such KYCs can be validated by linking the Aadhar. Any other modification is out of scope for this delivery. |Due to KRA related delays, this will now be delivered in October.|
|Payment retry|Ability to retry payments again if there is a failed payment against lumpsum purchase orders and first installment of SIPs generated via `generate_first_installment_now`=`true`|Moved to October.|
|Calendar day Daily SIP|Daily SIP where installments are processed every day of the week irrespective of business holiday or not.| Will be avaiable in Production Mid October. Note: Ability to skip installments is not part of this delivery.|
|Switch orders|Ability to switch between different schemes of the same AMC. Distributors can switch from one Regular scheme to other and Advisors can switch from one direct scheme to other.|Will be avaiable in Production Mid October.|
|List fund schemes API|Access all schemes available via Cybrilla POA gateway.|Will be avaiable in Production Mid October.|
