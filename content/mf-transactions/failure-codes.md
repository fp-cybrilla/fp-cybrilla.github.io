---
title: Order failure codes
---

### Order failure codes

The following are the failure codes that might occur while processing an order with the AMC after it is accepted in FP. These failure codes are also applicable to the installment orders of all type of plans. You can use the `failure code` to design investor communication as needed.

> We might add more failure codes in future to maintain a granular list of the possible failures.

#### Order failure codes related to investor profile

| Failure Code   | Description  | Order type    |
| --- | --- | --- |
| `pan_invalid`  |  Unable to verify PAN of investor. Provide correct PAN. | New purchase |
| `pan_name_mismatch`  | Investor name provided for folio creation is not as per investor's PAN | New purchase |
| `pan_aadhaar_not_mapped`  | Aadhaar not linked with the PAN of the investor | All |
| `aadhaar_contact_mismatch`  | Email or mobile provided for folio creation is not as per investor's aadhaar. For aadhaar based KYC investors provide email and phone as per aadhaar during folio creation  | New purchase |
| `bank_invalid`  |  Unable to verify bank account details of investor. Check investor name in bank account | Purchase |
| `bank_ifsc_invalid` |  IFSC of the bank account is not valid | Purchase |
| `tax_status_bank_mismatch`  | Investor's tax status does not match with bank account type | Purchase |
| `contact_verification_failed`  | Email or mobile number provided in the folio details could not be verified. Provide a valid email or mobile number. | Purchase |
| `nominee_age_invalid`  | Age of the nominee should be less than 100 and more than 0 | New purchase |
| `nominee_name_invalid`  | Investor and nominee name cannot be same | New purchase |


#### Order failure codes related to investor KYC

| Failure Code   |  Description   | Order type    |
| --- | --- | --- |
| `pan_kyc_incomplete` | KYC verification of the investor PAN is not completed | New purchase |
| `kyc_aadhaar_invalid` | Aadhaar no. in the information submitted for KYC verification is missing or invalid | New purchase |
| `kyc_dob_mismatch`  | Date of birth provided for folio creation does not match with the information submitted for KYC verification | New purchase |
| `kyc_name_mismatch`| Name provided for folio creation does not match with the information submitted for KYC verification | New purchase |
 

#### Order failure codes related to fund schemes

| Failure Code   | Description  | Order type    |
| --- | --- | --- |
| `amount_invalid`| Order does not meet the min\max investment amount or multiples as per scheme master | All |
| `units_invalid`| Order does not meet the min\max investment units as per scheme master| Redemption, Switch |
| `scheme_invalid`| Order is not supported in the scheme. Check scheme master for order types supported| All |
| `plan_scheme_date_invalid`|  Installment date selected for the purchase plan is not allowed in the scheme |  Purchase plan |
| `minor_only_investment_allowed`| Only minor investor purchases are allowed in this scheme	| New purchase |
| `country_not_allowed`|  Country of investor is not allowed for investments in the scheme| New purchase |
| `installment_count_invalid`|  No. of installments for the purchase plan as per the the scheme or frequency is not valid| Purchase plan |


#### Order failure codes related to payments

| Failure Code   | Description   | Order type    |
| --- | --- | --- |
| `order_expiry`|  Purchase order expired as payment not complete| Purchase |
| `payment_failure`|  If using FP Payments, then payment for the order is either not created or failed | purchase |
| `payment_not_received`|  Payment for this order has not been recieved by the AMC. If any amount is debited then check refund status with the payment provider.| purchase |
| `mandate_payment_failed`|  Mandate associated with the order is invalid\not approved and hence payment failed| purchase |
| `mandate_cancelled`| Mandate associated with the order is cancelled and hence payment failed| purchase |



#### Other failure codes related to order processing

| Failure Code   | Description   | Order type    |
| --- | --- | --- |
| `multiple_tax_statuses`| Investor has different tax statuses across folios. Update latest tax status in all folios of the AMC.| Purchase |
| `ekyc_investment_amount_limit_exceeded`| Order amount exceeded investment limit for Aadhaar\eKYC investors. Investor can place order upto Rs. 50,000 per annum per AMC only| Purchase |
| `nomination_declartion_missing`  |Nomination opt in or out for the folio associated with the order is missing | All |
| `folio_contact_already_in_use`  |Email\mobile used for a folio creation is already linked to another PAN no. Investor needs to declare nominee relation details in the previously used PAN. | New purchase |
| `consent_missing`  |2FA consent from investor is missing for the order | All |
| `consent_contact_mismatch`  | Mobile number or email on which investor consent for the order was taken does not match with the folio contact details | All |
| `consent_mobile_mismatch`| Mobile number on which investor consent for the order was taken does not match with the folio contact details| All |
| `consent_email_mismatch`| Email on which investor consent for the order was taken does not match with the folio contact details| All |
| `folio_balance_insufficient`|  Balance in the folio and scheme are not sufficient for the order| Redemption, Switch |
| `folio_balance_under_lock`| Balance in the folio and scheme are under lock in and not sufficient for the order| Redemption, Switch |
| `folio_balance_zero`| Balance in the folio and scheme is zero | Redemption, Switch  |
| `folio_balance_marked_lien`| 	Balance cannot be redeemed as it is marked lien | Redemption, Switch  |
| `folio_closed`| Orders in a consolidated folio are not allowed| Purchase |
| `license_code_invalid` |Your license code with the RTA is invalid. Also verify that the order's scheme `plan_type` (i.e regular\direct) is valid for your license code | All |
| `rta_amc_inactive` |AMC under your RTA account is not activated. Activate AMC in your RTA account. Additionally check e-log status if order belongs to AMC via CAMS RTA. | All |
| `cancelled_by_investor` | Order was cancelled from processing upon a request from investor | All |
| `order_expiry`|  Order expired as it is not confirmed by investor| Redemption, Switch |

