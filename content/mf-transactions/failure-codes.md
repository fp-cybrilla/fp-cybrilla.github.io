---
title: Order failure codes
---

### Order failure codes

The following are the failure codes that might occur while processing an order after it is accepted in FP. These failure codes are also applicable to the installment orders of all type of plans. You can use the `failure code` to design investor communication as needed.

> We might add more failure codes in future to maintain a granular list of the possible failures.

#### Order failure codes related to investor profile

| Failure Code   | Failure reason   | Order type    |
| --- | --- | --- |
| `pan_invalid`  |  Unable to verify PAN of investor. Provide correct PAN. | New purchase |
| `pan_name_mismatch`  | Investor name provided for folio creation is not as per investor's PAN | New purchase |
| `pan_adhaar_not_mapped`  | Aadhar not linked with the PAN of the investor | All |
| `adhaar_contact_mismatch`  | Email or mobile provided for folio creation is not as per investor's aadhar. For aadhar based KYC investors provide email and phone as per aadhar during folio creation  | New purchase |
| `bank_invalid`  |  Unable to verify bank account details of investor. Check investor name in bank account | Purchase |
| `tax_status_bank_mismatch`  | Investor's tax status does not match with bank account type | Purchase |
| `contact_verification_failed`  | Email or mobile number provided in the folio details could not be verified. Provide a valid email or mobile number. | Purchase |
| `nominee_age_invalid`  | Age of the nominee should be less than 100 and more than 0 | New purchase |
| `nominee_name_invalid`  | Investor and nominee name cannot be same | New purchase |


#### Order failure codes related to investor KYC

| Failure Code   | Failure reason   | Order type    |
| --- | --- | --- |
| `pan_kyc_incomplete` | KYC verification of the investor PAN is not completed | New purchase |
| `kyc_adhaar_invalid` | Adhaar no. in the information submitted for KYC verification is missing or invalid | New purchase |
| `kyc_dob_mismatch`  | Date of birth provided for folio creation does not match with the information submitted for KYC verification | New purchase |
| `kyc_name_mismatch`| Name provided for folio creation does not match with the information submitted for KYC verification | New purchase |
 

#### Order failure codes related to fund schemes

| Failure Code   | Failure reason   | Order type    |
| --- | --- | --- |
| `amount_invalid`| Order does not meet the min\max investment amount or multiples as per scheme master | All |
| `scheme_invalid`| Order is not supported in the scheme. Check scheme master for order types supported.| All |
| `minor_only_investment_allowed`| Only minor investor purchases are allowed in this scheme	| New purchase |
| `country_not_allowed`|  Country of investor is not allowed for investments in the scheme| New purchase |


#### Order failure codes related to payments

| Failure Code   | Failure reason   | Order type    |
| --- | --- | --- |
| `order_expiry`|  Purchase order expired as payment not complete| Purchase |
| `order_expiry`|  Order expired as it is not confirmed by investor| Redemption, Switch |
| `payment_failure`|  Payment for the order in FP is either not created or failed | purchase |
| `payment_not_recieved`|  Payment details for this order has not been recieved by AMC. Check refund status  with the payment provider if amount debited.| purchase |


#### Other failure codes related to order processing

| Failure Code   | Failure reason   | Order type    |
| --- | --- | --- |
| `multiple_tax_statuses`| Investor has different tax statuses across folios. Update latest tax status in all folios of the AMC.| Purchase |
| `ekyc_investment_amount_limit_exceeded`| Order amount exceeded investment limit for Adhaar\eKYC investors. Investor can place order upto Rs. 50,000 per annum per AMC only| Purchase |
| `consent_missing`  |2FA consent from investor is missing for the order | All |
| `consent_contact_mismatch`  | Mobile number or email on which investor consent for the order was taken does not match with the folio contact details | All |
| `consent_mobile_mismatch`| Mobile number on which investor consent for the order was taken does not match with the folio contact details| All |
| `consent_email_mismatch`| Email on which investor consent for the order was taken does not match with the folio contact details| All |
| `folio_balance_insufficient`|  Balance in the folio and scheme are not sufficient for the order| Redemption, Switch |
| `folio_balance_under_lock_in`| Balance in the folio and scheme are under lock in and not sufficient for the order| Redemption, Switch |
| `folio_balance_zero`| Balance in the folio and scheme is zero | Redemption, Switch  |
| `folio_balance_marked_lien`| 	Balance cannot be redeemed as it is marked lien | Redemption, Switch  |
| `folio_closed`| Orders in a consolidated folio are not allowed| Purchase |
| `license_code_invalid` |Your license code with the RTA is invalid. Also verify that the order's scheme `plan_type` is valid for your license code| All |
| `rta_amc_inactive` |AMC under your RTA account is not activated. Activate AMC in your RTA account. Additionally check e-log status in CAMS RTA. | All |
| `cancelled_by_investor` | Order was cancelled from processing upon a request from investor | All |

