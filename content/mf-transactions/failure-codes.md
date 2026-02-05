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
| `account_closed_transferred` | The investor's bank account has been closed or transferred as per the bank's rejection | Purchase |
| `no_such_account` | The bank account number provided does not exist | New purchase |
| `account_blocked_closed` | The bank account is either blocked or closed | New purchase |
| `tax_status_bank_account_type_mismatch` | There is a mismatch between the investor's tax status code and the bank account type | New purchase |
| `title_of_account_required` | The title of the bank account has not been provided | New purchase |
| `title_of_account_wrong_incomplete` | The title of the bank account is either wrong or incomplete | New purchase |
| `nominee_details_not_provided` | The nominee details have not been provided | New purchase |
| `nominee_name_same_as_investor` | The nominee name is the same as the investor's name | New purchase |
| `fh_name_same_as_first_nominee` | The first holder's name is the same as the first nominee's name | New purchase |
| `fh_name_same_as_second_nominee` | The first holder's name is the same as the second nominee's name | New purchase |
| `nomination_details_incomplete` | The nominee fields are mandatory and have not been completed | New purchase |
| `nominee_email_invalid_format` | The email address provided for Nominee 1 is in an invalid format | New purchase |
| `incomplete_bank_details` | The bank details provided are incomplete | New purchase |
| `incomplete_guardian_details` | The guardian details provided are incomplete | New purchase |
| `incomplete_investor_address` | The investor's address provided is incomplete | New purchase |
| `investor_name_mismatch_fresh_additional` | The investor name differs between the fresh and additional purchase requests | New purchase |
| `bank_details_not_provided` | Bank details have not been provided | New purchase |
| `bank_details_missing` | Bank details are missing from the request | New purchase |
| `guardian_details_missing` | Guardian details are missing from the request | New purchase |
| `missing_nominee_details_when_guardian_pan_provided` | Nominee name, minor flag, percentage, or relation is missing when guardian PAN is provided | New purchase |
| `nominee_guardian_pan_should_be_blank_when_minor_flag_is_n_null` | Nominee guardian PAN should be blank when the minor flag is 'N' or null | New purchase |
| `minor_pan_should_not_be_same_as_guardian_pan` | Minor's PAN should not be the same as the guardian's PAN or third party payment check has to be 'N' | New purchase |
| `invalid_missing_guardian_pan_number` | Joint holders are not allowed for minor investments or guardian PAN number is invalid/missing | New purchase |
| `primary_holder_name_is_missing` | Primary holder name is missing | New purchase |
| `invalid_or_missing_dob_for_minor_investments` | Invalid or missing date of birth for minor investments | New purchase |
| `guardian_details_should_not_be_blank_for_minor_investments` | Guardian details should not be blank for minor investments | New purchase |
| `guardian_details_should_not_be_allowed_for_this_tax_status` | Guardian details should not be allowed for this tax status | New purchase |
| `invalid_missing_guardian_dob` | Invalid or missing guardian date of birth | New purchase |
| `invalid_or_missing_mode_of_holding` | Invalid or missing mode of holding | New purchase |
| `jh1_name_is_missing` | Joint holder 1 name is missing | New purchase |
| `invalid_missing_jh1_dob` | Invalid or missing JH1 date of birth | New purchase |
| `jh2_name_is_missing` | Joint holder 2 name is missing | New purchase |
| `invalid_missing_jh2_dob` | Invalid or missing JH2 date of birth | New purchase |
| `communication_address1_missing` | Communication address line 1 is missing | New purchase |
| `invalid_or_missing_communication_pincode` | Invalid or missing communication pincode | New purchase |
| `invalid_missing_investor_category` | Invalid or missing investor category | New purchase |
| `invalid_or_missing_investor_status` | Invalid or missing investor status | New purchase |
| `invalid_or_missing_occupation_code` | Invalid or missing occupation code | New purchase |
| `nre_nro_bank_account_type_not_allowed_for_resident_individuals` | NRE/NRO bank account type is not allowed for resident individuals | New purchase |
| `nre_or_nro_bank_account_details_required_for_nri_investor` | NRE or NRO bank account details are required for NRI investors | New purchase |
| `invalid_or_missing_us_canada_declaration_flag` | Invalid or missing US/Canada declaration flag | New purchase |
| `invalid_or_missing_nri_address_flag` | Invalid or missing NRI address flag | New purchase |
| `missing_invalid_nri_source_of_funds_account_number` | Missing or invalid NRI source of funds account number | New purchase |
| `invalid_or_missing_firc_certificate_status` | Invalid or missing FIRC certificate status | New purchase |
| `missing_nri_address1` | Missing NRI address line 1 | New purchase |
| `missing_nri_city` | Missing NRI city | New purchase |
| `missing_nri_country` | Missing NRI country | New purchase |
| `missing_nri_pincode` | Missing NRI pincode | New purchase |
| `usa_canada_investors_not_allowed` | Investors from USA or Canada are not allowed to invest | New purchase |
| `usa_or_canada_investors_are_not_allowed_to_invest` | USA or Canada investors are not allowed to invest | New purchase |
| `address_not_provided` | The address has not been provided in the request | New purchase |
| `tax_status_mismatch` | There is a mismatch in the tax status provided | New purchase |
| `invalid_email_address` | Invalid email address | New purchase |
| `missing_or_invalid_mobile_number` | Missing or invalid mobile number | New purchase |
| `missing_or_invalid_email_id` | Missing or invalid email ID | New purchase |
| `2fa_delivery_failed` | Two Factor Authentication - Email / SMS delivery failed | All |
| `2fa_mode_is_missing_or_invalid` | 2FA mode is missing or invalid | New purchase |
| `2fa_mobile_and_email_not_matching_with_amc_records` | 2FA mobile and email are not matching with AMC records | New purchase |
| `2fa_mobile_provided_not_matching_with_amc_records` | 2FA mobile provided is not matching with AMC records | New purchase |
| `2fa_email_provided_not_matching_with_amc_records` | 2FA email provided is not matching with AMC records | New purchase |
| `missing_or_invalid_mobile_number_and_email_id` | Missing or invalid mobile number and email ID | New purchase |
| `invalid_mobile_declaration` | Invalid mobile declaration | New purchase |
| `invalid_email_declaration` | Invalid email declaration | New purchase |
| `both_mobile_and_email_are_not_provided_for_primary_holder` | Both mobile and email are not provided for the primary holder | New purchase |
| `mobile_email_declaration_flag_is_available_but_mobile_email_is_missing_for_primary_holder` | Mobile/email declaration flag is available but mobile/email is missing for the primary holder | New purchase |
| `mobile_or_email_are_not_provided_for_j1_based_on_2faflag` | Mobile or email are not provided for Joint Holder1 based on 2FA flag | New purchase |
| `mobile_email_declaration_flag_is_invalid_or_mobile_email_is_missing_for_j1` | Mobile/email declaration flag is invalid or mobile/email is missing for Joint Holder1 | New purchase |
| `mobile_or_email_are_not_provided_for_j2_based_on_2faflag` | Mobile or email are not provided for Joint Holder2 based on 2FA flag | New purchase |
| `mobile_email_declaration_flag_is_invalid_or_mobile_email_is_missing_for_j2` | Mobile/email declaration flag is invalid or mobile/email is missing for Joint Holder2 | New purchase |
| `primary_holder_j1_mobile_and_email_combination_is_same` | Primary holder and Joint Holder1 mobile and email combination is the same | New purchase |
| `primary_holder_j1_j2_mobile_and_email_combination_is_same` | Primary holder/Joint Holder1/Joint Holder2 mobile and email combination is the same | New purchase |
| `primary_holder_and_j1_mobile_is_same` | Primary holder and Joint Holder1 mobile is the same | New purchase |
| `primary_holder_and_j1_email_is_same` | Primary holder and Joint Holder1 email is the same | New purchase |
| `primary_holder_j1_j2_mobile_is_same` | Primary holder/Joint Holder1/Joint Holder2 mobile is the same | New purchase |
| `primary_holder_j1_j2_email_is_same` | Primary holder/Joint Holder1/Joint Holder2 email is the same | New purchase |
| `invalid_j1_j2_mobile_declaration_flag` | Invalid Joint Holder1/Joint Holder2 mobile declaration flag | New purchase |
| `invalid_j1_j2_email_declaration_flag` | Invalid Joint Holder1/Joint Holder2 email declaration flag | New purchase |
| `joint_holders_are_not_allowed_for_minor_investments` | Joint holders are not allowed for minor investments | New purchase |
| `joint_holders_are_not_allowed_for_non_individuals` | Joint holders are not allowed for non-individuals | New purchase |
| `missing_or_invalid_dob` | Missing or invalid date of birth | New purchase |
| `invalid_dob` | Invalid date of birth | New purchase |
| `invalid_dob_for_individual` | Invalid DOB for individual | New purchase |
| `missing_or_invalid_fh_dob` | Missing or invalid First Holder date of birth | New purchase |
| `missing_or_invalid_guardian_dob` | Missing or invalid guardian date of birth | New purchase |
| `missing_or_invalid_j1_dob` | Missing or invalid Joint Holder 1 date of birth | New purchase |
| `missing_or_invalid_j2_dob` | Missing or invalid Joint Holder 2 date of birth | New purchase |
| `sip_insure_is_allowed_age_between_18_to_51_years` | SIP Insure is allowed for age between 18 to 51 years | SIP |
| `sip_insure_is_allowed_age_between_18_to_55_years` | SIP Insure is allowed for age between 18 to 55 years | SIP |
| `dob_mandatory_for_sip_insure` | DOB is mandatory for SIP Insure | SIP |
| `scheme_is_not_allowed_for_this_tax_status_as_per_age` | Scheme is not allowed for this tax status as per age | New purchase |
| `tax_status_should_be_minor_for_this_scheme` | Tax status should be minor for this scheme | New purchase |
| `minor_attained_major` | The minor investor has attained majority | New purchase |
| `minor_major_attestation_required` | The minor who has become a major unit holder requires attestation by guardian, donor, or banker | New purchase |
| `minor_to_major_documents_missing` | Documents required for the minor to major conversion are missing | New purchase |
| `minor_major_signature_not_available` | The signature of the minor who has turned major is not available in the request | New purchase |
| `minor_major_guardian_signature_invalid` | The minor has attained majority and the guardian's signature is no longer valid | New purchase |
| `unit_holder_minor_guardian_sign_required` | The unit holder is still a minor and requires the guardian or donor's signature | New purchase |
| `purchase_allowed_only_for_minor_investors_not_for_individuals` | Purchase is allowed only for minor investors, not for individuals | New purchase |
| `minor_name_should_not_be_same_as_guardian_name` | Minor name should not be the same as guardian name | New purchase |
| `special_characters_numerics_not_allowed_in_ph_j1_j2_nominee_names_for_individauls` | Special characters and numerics are not allowed in holder's nominee names for individuals | New purchase |
| `special_characters_not_allowed_in_name_for_non_individual` | Special characters are not allowed in name for non-individuals | New purchase |
| `j1_j2_details_should_be_blank_when_moh_is_single` | Joint Holder 1/ Joint Holder 2 details should be blank when mode of holding is single | New purchase |
| `ekyc_investor_eligibility_not_met` | The eKYC investor does not meet the eligibility criteria | New purchase |
| `physical_investment_ekyc_not_allowed` | Physical investment is not allowed for eKYC investors or guardians | New purchase |
| `missing_or_invalid_nri_sof_account_number` | Missing or invalid NRI SOF account number | New purchase |
| `invalid_nri_sof` | Invalid NRI SOF | New purchase |
| `special_chars_not_allowed_in_nri_sof` | Special characters are not allowed in NRI SOF | New purchase |
| `primary_holder_invalid` | The details provided for the Primary Holder are not valid | New purchase |
| `invalid_nominee_pan_format` | Nominee PAN 4th letter should be P when nominee is an individual | New purchase |
| `bank_account_mismatch` | If the details are not up-to-date | New purchase |


#### Order failure codes related to investor KYC

| Failure Code   |  Description   | Order type    |
| --- | --- | --- |
| `pan_kyc_incomplete` | KYC verification of the investor PAN is not completed | New purchase |
| `kyc_aadhaar_invalid` | Aadhaar no. in the information submitted for KYC verification is missing or invalid | New purchase |
| `kyc_dob_mismatch`  | Date of birth provided for folio creation does not match with the information submitted for KYC verification | New purchase |
| `kyc_name_mismatch` | Name provided for folio creation does not match with the information submitted for KYC verification | New purchase |
| `guardian_kyc_on_hold` | Guardian's KYC status is currently on hold | New purchase |
| `fh_kyc_not_available` | First Holder's KYC is not available in any KRA | New purchase |
| `jh1_kyc_not_available` | Joint Holder 1's KYC is not available in any KRA | New purchase |
| `jh2_kyc_not_available` | Joint Holder 2's KYC is not available in any KRA | New purchase |
| `guardian_kyc_not_available` | Guardian's KYC is not available in any KRA | New purchase |
| `fh_jh1_kyc_not_available` | First Holder and Joint Holder 1's KYC is not available in any KRA | New purchase |
| `first_holder_kyc_on_hold_invalid` | First Holder's KYC status is on hold or invalid | New purchase |
| `kyc_ack_letters_not_submitted` | KYC acknowledgement letters have not been submitted | New purchase |
| `kyc_not_provided` | KYC documents have not been provided | New purchase |
| `otm_rejection_miscellaneous_kyc_pending` | One-Time-Mandate transaction rejected due to pending KYC documents | Purchase | 
| `lien_documents_not_received` | The lien documents have not been received | All |
| `documents_not_recieved` | The required documents for the request have not been received/ verified | Purchase |
| `kyc_not_validated` | The Holder's KYC is not in validated state | New purchase |
| `first_holder_pan_missing` | The PAN for the first holder has not been provided | New purchase |
| `joint_holder_pan_missing` | The PAN for the joint holder has not been provided | New purchase |
| `pan_attestation_incomplete` | The PAN attestation process has not been completed | New purchase |
| `pan_copy_not_submitted_all_applicants` | The PAN along with a copy of the PAN card has not been submitted for all applicants | New purchase |
| `invalid_or_missing_primary_holder_pan_exempt_flag` | Invalid or missing DOB for minor investments or invalid/missing primary holder PAN exempt flag | New purchase |
| `primary_holder_exempt_category_or_pan_exempt_kra_reference_number_missing` | Primary holder exempt category or PAN exempt KRA reference number is missing | New purchase |
| `invalid_or_missing_primary_holder_pan_details` | Primary holder PAN details are invalid or missing | New purchase |
| `invalid_or_missing_guardian_pan_exempt_flag` | Guardian details should not be allowed for this tax status or guardian PAN exempt flag is invalid/missing | New purchase |
| `guardian_exempt_category_or_kra_reference_number_missing` | Guardian exempt category or KRA reference number is missing | New purchase |
| `invalid_or_missing_jh1_pan_exempt_flag` | Invalid or missing mode of holding or JH1 PAN exempt flag | New purchase |
| `invalid_or_missing_jh1_pan_details` | JH1 name is missing or JH1 PAN details are invalid/missing | New purchase |
| `invalid_or_missing_jh2_pan_exempt_flag` | Invalid or missing JH1 DOB or JH2 PAN exempt flag | New purchase |
| `invalid_or_missing_jh2_pan_details` | JH2 name is missing or JH2 PAN details are invalid/missing | New purchase |
| `jh1_exempt_category_or_kra_reference_number_missing` | JH1 exempt category or KRA reference number is missing | New purchase |
| `jh2_exempt_category_or_kra_reference_number_missing` | JH2 exempt category or KRA reference number is missing | New purchase |
| `invalid_or_missing_pan_hence_purchase_amount_not_more_than_50000` | Invalid or missing PAN, hence purchase amount cannot exceed Rs. 50,000 or units are under lock-in period | New purchase |
| `1st_holder_pan_and_2nd_holder_pan_should_not_be_same` | The first holder's PAN and second holder's PAN should not be the same | New purchase |
| `1st_holder_pan_and_3rd_holder_pan_should_not_be_same` | The first holder's PAN and third holder's PAN should not be the same | New purchase |
| `2nd_holder_pan_and_3rd_holder_pan_should_not_be_same` | The second holder's PAN and third holder's PAN should not be the same | New purchase |
| `pan_4th_letter_is_h_status_should_be_huf_else_re_verify_the_pan` | PAN's 4th letter is 'H', tax status should be HUF, else re-verify the PAN or EUIN declaration should not be blank | New purchase |
| `pan_4th_letter_is_not_h_status_should_not_be_huf_else_re_verify_the_pan` | PAN's 4th letter is not 'H', tax status should not be HUF, else re-verify the PAN | New purchase |
| `pan_4th_letter_is_p_status_should_be_individual_else_re_verify_the_pan` | PAN's 4th letter is 'P', tax status should be individual, else re-verify the PAN | New purchase |
| `pan_4th_letter_is_not_p_status_should_not_be_individual_else_re_verify_the_pan` | PAN's 4th letter is not 'P', tax status should not be individual, else re-verify the PAN | New purchase |
| `pan_no_and_lei_code_combination_mismatch` | LEI code is not available in the master or PAN and LEI code combination mismatch | New purchase |
| `cumulative_pan_level_amount_crossing_eb_eligible_limit` | Cumulative PAN level amount is crossing the EB eligible limit or special characters not allowed in name for non-individuals | New purchase |
| `invalid_nominee_guardian_pan` | Guardian is missing for the nominee minor or nominee guardian PAN is invalid | New purchase |
| `fh_j1_j2_nominee_pans_should_not_be_same` | First holder, JH1, JH2, and nominee PANs should not be the same or invalid DOB | New purchase |
| `pan_4th_letter_is_not_p_h_else_re_verify_the_pan` | PAN's 4th letter is neither 'P' nor 'H', else re-verify the PAN or invalid document type declaration | New purchase |
| `missing_j1_j2_pan_pekrn` | Missing JH1 or JH2 PAN/PEKRN or invalid/missing nominee declaration flag at CAN level | New purchase |
| `folio_and_pan_mismatch` | Physical folio is not available or there is a folio and PAN mismatch | New purchase |
| `folio_pan_mismatch_for_minors` | Folio and PAN mismatch for minor investors | New purchase |
| `folio_kra_ref_number_mismatch_other_than_minors` | Folio and KRA reference number mismatch for other than minors | New purchase |
| `folio_kra_ref_number_mismatch_for_minors` | Folio and KRA reference number mismatch for minors | New purchase |
| `lei_code_is_expired` | LEI code has expired | New purchase |
| `lei_code_is_not_available_in_the_master` | LEI code is not available in the master | New purchase |
| `invalid_or_missing_fatca_flag` | Invalid or missing FATCA flag | New purchase |
| `fatca_declaration_missing` | The FATCA declaration is not available | New purchase |
| `aadhaar_not_submitted_authenticated` | The Aadhaar has not been submitted or has not been authenticated | New purchase |
| `invalid_or_missing_kyc_flag` | Invalid or missing KYC flag | New purchase |
| `amount_should_not_exceeds_50000_for_e_kyc` | Amount should not exceed Rs. 50,000 for e-KYC | New purchase |
| `invalid_missing_fh_ckyc_no` | Invalid or missing FH_CKYC_NO | New purchase |
| `invalid_missing_j1_ckyc_no` | Invalid or missing J1_CKYC_NO | New purchase |
| `invalid_missing_j2_ckyc_no` | Invalid or missing J2_CKYC_NO | New purchase |
| `invalid_missing_gd_ckyc_no` | Invalid or missing GD_CKYC_NO | New purchase |
| `kyc_modification_required` | Investor's KYC is not in validated state and a modification is required | New purchase |
| `kyc_rejected_new_kyc_required` | Investor's KYC has been rejected and either a fresh application/ modification is required | New purchase |
| `kyc_not_verified` | Investor's KYC is not verified and hence transaction rejected | New purchase |

#### Order failure codes related to fund schemes

| Failure Code   | Description  | Order type    |
| --- | --- | --- |
| `amount_invalid`| Order does not meet the min\max investment amount or multiples as per scheme master | All |
| `units_invalid`| Order does not meet the min\max investment units as per scheme master| Redemption, Switch |
| `scheme_invalid`| Order is not supported in the scheme. Check scheme master for order types supported| All |
| `plan_scheme_date_invalid`|  Installment date selected for the purchase plan is not allowed in the scheme |  Purchase plan |
| `minor_only_investment_allowed`| Only minor investor purchases are allowed in this scheme	| New purchase |
| `country_not_allowed`|  Country of investor is not allowed for investments in the scheme| New purchase |
| `no_of_installments_invalid`|  No. of installments for the purchase plan as per the the scheme or frequency is not valid| Purchase plan |
| `scheme_closed` | The given scheme has been closed and is no longer accepting transactions | All |
| `insufficient_balance_scheme_folio` | Insufficient balance available in the scheme or folio to process the transaction | Redemption / Switch |
| `source_scheme_not_clear` | The source scheme for the transaction is not clearly specified | All |
| `switch_in_scheme_not_present` | The switch-in scheme is not present or does not exist | Switch |
| `switch_in_scheme_invalid` | The switch-in scheme name has been wrongly mentioned | Switch |
| `switch_out_scheme_invalid` | The switch-out scheme name has been wrongly mentioned | Switch |
| `switch_in_scheme_not_clear` | The switch-in scheme is not clearly specified | Switch |
| `switch_in_scheme_not_mentioned` | The switch-in scheme has not been mentioned | Switch |
| `scheme_invalid_non_individual` | Non-individual investors are not permitted to invest in this scheme | All |
| `invalid_or_missing_amc_code` | Invalid or missing AMC code | All |
| `invalid_or_missing_transaction_type` | Invalid or missing transaction type | All |
| `invalid_or_missing_scheme_code` | Invalid or missing scheme code | All |
| `invalid_or_missing_option_flag_reinv_tag` | Invalid or missing option flag (REINV_TAG) | All |
| `mismatch_in_scheme_plan_option_combination` | Mismatch in scheme, plan, and option combination | All |
| `invalid_or_missing_sip_new_flag` | Invalid or missing SIP_NEW flag | SIP |
| `invalid_or_missing_sub_transaction_type` | Invalid or missing sub transaction type | New purchase |
| `rejected_due_to_nfo_scheme_closed` | Rejected due to NFO scheme being closed | New purchase |
| `temporary_scheme_suspension` | There is a temporary suspension of subscriptions in that particular scheme and cannot transact | All |
| `scheme_not_eligible` | The transaction got rejected due to non eligible scheme | All |


#### Order failure codes related to payments

| Failure Code   | Description   | Order type    |
| --- | --- | --- |
| `order_expiry`|  Purchase order expired as payment not complete| Purchase |
| `payment_failure`|  If using FP Payments, then payment for the order is either not created or failed | purchase |
| `payment_not_received`|  Payment for this order has not been recieved by the AMC. If any amount is debited then check refund status with the payment provider.| purchase |
| `mandate_payment_failed`|  Mandate associated with the order is invalid\not approved and hence payment failed| purchase |
| `mandate_cancelled`| Mandate associated with the order is cancelled and hence payment failed| purchase |
| `mandate_pending_registration` | The mandate is pending registration by the investor's bank | Purchase |
| `mandate_unregistered` | The mandate has been unregistered by the investor's bank | Purchase |
| `mandatory_information_missing` | Required mandatory information is missing from the request | Purchase |
| `otm_rejection_invalid_umrn_inactive_mandate` | One-Time-Mandate transaction rejected due to an invalid UMRN or inactive mandate | Purchase |
| `otm_rejection_mandate_not_valid_for_debit` | One-Time-Mandate transaction rejected as the mandate is not valid for debit transactions | Purchase |
| `otm_rejection_mismatch_mandate_debtor_bank` | One-Time-Mandate transaction rejected due to a mismatch in the mandate debtor's bank details | Purchase |
| `otm_rejection_mismatch_mandate_currency` | One-Time-Mandate transaction rejected due to a mismatch in the mandate currency | Purchase |
| `otm_rejection_amount_exceeds_mandate_max` | One-Time-Mandate transaction rejected as the amount exceeds the mandate's maximum limit | Purchase |
| `otm_rejection_mandate_amount_mismatch` | One-Time-Mandate transaction rejected due to a mismatch in the mandate amount | Purchase |
| `otm_rejection_date_before_mandate_start_date` | One-Time-Mandate transaction rejected as the transaction date falls before the mandate start date | Purchase |
| `otm_rejection_date_after_mandate_end_date` | One-Time-Mandate transaction rejected as the transaction date falls after the mandate end date | Purchase |
| `otm_rejection_mandate_cancelled` | One-Time-Mandate transaction rejected as the mandate has been cancelled | Purchase |
| `otm_rejection_docs_pending_account_holder_major` | One-Time-Mandate transaction rejected as documents are pending for an account holder who has turned major | Purchase |
| `otm_rejection_account_inactive` | One-Time-Mandate transaction rejected as the account has been inactive with no transactions for the last three months | Purchase |
| `otm_rejection_dormant_account` | One-Time-Mandate transaction rejected as the account is dormant with no transactions for the last six months | Purchase |
| `otm_rejection_account_reached_max_debit_limit` | One-Time-Mandate transaction rejected as the bank account has reached the maximum debit limit set by the bank | Purchase |
| `otm_rejection_account_holder_expired` | One-Time-Mandate transaction rejected as the account holder has expired | Purchase |
| `frequency_of_payment_not_mentioned` | The frequency of payment has not been specified | SIP |
| `late_debit_failure` | The late debit calling process has failed | Purchase / SIP |
| `payment_stopped_court_order` | Payment has been stopped due to a court order | Purchase |
| `invalid_otm_registration` | The mandate registration is invalid | SIP |
| `otm_rejection_amount_exceeds_bank_limit` | One-Time-Mandate transaction rejected as the amount exceeds the limit set on the account by the bank for debit per transaction | SIP |
| `missing_investor_bank_details` | Investor bank details are missing | New purchase |
| `missing_deposit_bank_details` | Deposit bank details are missing | New purchase |
| `invalid_missing_deposit_date` | Invalid or missing deposit date | New purchase |
| `payout_bank_proof_not_available` | Proof for the payout bank details is not available | Redemption |
| `invalid_or_missing_ifsc_code` | Invalid or missing IFSC code | New purchase |
| `invalid_or_missing_micr_code_where_pay_mec_selected_as_ecs` | Invalid or missing MICR code where PAY_MEC is selected as ECS | SIP |
| `invalid_bank_name` | The bank name provided is invalid | New purchase |
| `invalid_bank_acno` | Invalid bank account number | New purchase |
| `missing_or_invalid_payinbankactype` | Missing or invalid PayinBankAcType | New purchase |
| `missing_or_invalid_payinbankifsc` | Missing or invalid PayinBankIFSC | New purchase |
| `missing_or_invalid_payinbankname` | Missing or invalid PayinBankName | New purchase |
| `special_chars_not_allowed_in_acct_no` | Special characters are not allowed in account number | New purchase |
| `special_chars_not_allowed_in_dep_acno` | Special characters are not allowed in DEP_ACNO | New purchase |
| `cheque_dishonoured` | The cheque has been dishonoured or the collection has not been realised | New purchase |
| `cheque_missing` | The cheque is missing from the submission | New purchase |
| `cheque_amount_mismatch` | The cheque amount in words and figures differs | New purchase |
| `signature_not_available_cheque` | The signature is not available on the cheque | New purchase |
| `drawer_signature_differs` | The drawer's signature does not match the records | New purchase |
| `drawer_signature_illegible` | The drawer's signature is illegible and cannot be verified | New purchase |
| `drawer_signature_required` | The drawer's signature is required but has not been provided | New purchase |
| `drawer_signature_not_received` | The drawer's signature required to operate the account has not been received | New purchase |
| `drawer_authority_not_received` | The drawer's authority to operate the account has not been received | All |



#### Other failure codes related to order processing

| Failure Code   | Description   | Order type    |
| --- | --- | --- |
| `multiple_tax_statuses`| Investor has different tax statuses across folios. Update latest tax status in all folios of the AMC.| Purchase |
| `folio_nominee_opt_in_missing`| Investor has not declared nomination for the folio. Either add nominees or opt out of nomination before submitting another order.| All |
| `demat_folio_order_not_allowed`|Redemption or switch orders in demat folios are not allowed via RTA channel partner account. They should be placed via depository using the DP account| Redemption, Switch |
| `fatca_missing`|Investor FATCA details are not available with AMC. Contact [FP operations](mailto:opscybrilla@cybrilla.com)| Purchase|
| `ekyc_investment_amount_limit_exceeded`| Order amount exceeded investment limit for Aadhaar\eKYC investors. Investor can place order upto Rs. 50,000 per annum per AMC only| Purchase |
| `nomination_declaration_missing`  |Nomination opt in or out for the folio associated with the order is missing | All |
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
| `amc_inactive` |AMC under your RTA account is not activated. Activate AMC in your RTA account. Additionally check e-log status if order gateway us RTA - CAMS. | All |
| `cancelled_by_investor` | Order was cancelled from processing upon a request from investor | All |
| `order_expiry`|  Order expired as it is not confirmed by investor| Redemption, Switch |
| `order_gateway_failure`|  Order failed at the gateway due to unknown reasons| All |
| `technical_failure_at_gateway`|  Order failed due to technical issues with the gateway system like RTA| All |
| `folio_locked` | Folio has been locked due to an IT notice and cannot process transactions | All |
| `prospect_folio_third_party_verification_missing` | Third party verification has not been completed for the prospect folio | All |
| `folio_investor_name_mismatch` | The investor name does not match the name associated with the folio | All |
| `folio_number_invalid` | The folio number mentioned in the request is incorrect or invalid | All |
| `folio_blocked_invalid` | The folio is either blocked or invalid and cannot process transactions | All |
| `folio_not_mentioned` | The folio number has not been provided in the request | Redemption/ Switch |
| `folio_to_folio_switch_not_permitted` | Switching transactions between two folios is not permitted | Switch |
| `online_folio_transaction_route_distributor` | Online folio transactions must be routed through the Online Distributor | All |
| `folio_contact_same_as_distributor` | The First Holder's email or mobile number matches the distributor's or EUIN's contact details | New purchase |
| `transaction_amount_units_below_min` | The transaction amount or units is less than the minimum value limit | All |
| `switch_transactions_not_allowed_non_ssip` | Switch transactions are not permitted for schemes other than SSIP | Switch |
| `transaction_amount_below_value_limits` | The transaction amount falls below the allowed value limits | All |
| `transaction_not_allowed_during_period` | The transaction is not permitted during the current period | All |
| `transaction_not_allowed_banned_country` | The transaction is not permitted as the investor is from a banned country | New purchase |
| `transaction_reversed` | The transaction has been reversed based on instructions from the investor's banker or service provider | All |
| `signature_invalid` | The signature is either not available or does not match the records | All |
| `missing_signature_switch_fh_sh` | The first and second holders have not signed the switch request | Switch |
| `missing_signature_redemption_fh_sh` | The first and second holders have not signed the redemption request | Redemption |
| `signature_differ_switch_fh_sh` | The first and second holders' signatures differ in the switch request | Switch |
| `second_holder_signature_mismatch` | The second holder's signature does not match the records | All |
| `first_holder_signature_mismatch` | The first holder's signature does not match the records | All |
| `third_holder_signature_mismatch` | The third holder's signature does not match the records | All |
| `first_third_holder_signature_mismatch` | The first and third holders' signatures do not match the records | All |
| `guardian_signature_issue` | The guardian's signature is either mismatched or not provided | All |
| `donor_signature_issue` | The donor's signature is either mismatched or not provided | All |
| `signature_not_available_asl` | The signature is not available in the ASL records | All |
| `signatures_all_holders_mismatch` | The signatures of all the holders do not match the records | All |
| `authorised_signatories_not_signed_br` | The authorised signatories have not signed as per the board resolution | All |
| `units_not_specified` | The required units have not been specifically mentioned in the request | Redemption / Switch |
| `revised_feed_required_all_units` | A revised feed is required to process the transaction for all units | Redemption / Switch |
| `units_amount_differ` | There is a discrepancy between the units and amount mentioned | Redemption / Switch |
| `units_marked_under_lien` | The units are marked under lien and cannot be transacted | Redemption / Switch |
| `units_under_lock_in` | The units are under a lock-in period of 3 years from the date of allotment and cannot be transacted | Redemption / Switch |
| `data_capture_error` | An error occurred during data capture and requires rectification | All |
| `uin_number_missing` | The UIN (Unique Identification Number) has not been provided | All |
| `cin_number_missing` | The CIN (Corporate Identification Number) has not been provided | All |
| `ecs_rejection` | The ECS (Electronic Clearing Service) transaction has been rejected | SIP |
| `sip_cancelled` | The SIP has been discontinued based on a cancellation request | SIP |
| `micro_sip_address_proof_not_provided` | Address proof has not been provided for the Micro SIP | SIP |
| `sip_not_allowed` | SIP transactions are not permitted for this scheme or investor | SIP |
| `asl_not_received` | The ASL (Account Statement List) has not been received | New purchase |
| `reversed_reprocessed_invalid_arn` | The transaction was reversed and reprocessed due to an invalid ARN provided earlier | All |
| `second_holder_not_signed` | The second holder has not signed the application or request | All |
| `first_holder_not_signed` | The first holder has not signed the application or request | All |
| `third_holder_not_signed` | The third holder has not signed the application or request | All |
| `request_not_signed_by_all_holders` | The request has not been signed by all unit holders | All |
| `second_third_holder_sign_issue` | The second holder's signature does not match and the third holder's signature is not available | All |
| `joint_holder_name_not_available_sign_available` | The joint holder's name is not available but their signature is present | All |
| `duplicate_request_received` | A duplicate request has been received for the same transaction | All |
| `board_resolution_trust_deed_not_available` | The board resolution or trust deed is not available | New purchase |
| `board_resolution_not_received` | The board resolution has not been received | New purchase |
| `application_not_original` | The application submitted is not in its original form | All |
| `alterations_require_authentication` | Alterations in the document require the drawer's authentication | All |
| `image_not_clear` | The image provided is not clear and cannot be verified | New purchase |
| `incomplete_purchase_request` | The purchase request submitted is incomplete | New purchase |
| `instrument_not_signed_by_investor` | The instrument has not been signed by the investor | New purchase |
| `instrument_undated_no_proper_date` | The instrument is undated or does not have a proper date | New purchase |
| `insufficient_installments` | There are insufficient installments to process the transaction | SIP |
| `invalid_amount_figure_words_differ` | The amount is invalid or the amount in figures and words differ | New purchase |
| `invalid_frequency` | The frequency specified for the transaction is invalid | SIP |
| `nfo_called_off` | The NFO has been called off as the minimum collection amount was not met | New purchase |
| `physical_request_demat_not_allowed` | Physical requests are not allowed for Demat folios | New purchase |
| `switch_in_not_found` | No corresponding switch-in transaction found, hence the transaction is rejected | Switch |
| `registration_ceased_otm` | The registration has ceased for the One-Time-Mandate mandate | SIP |
| `isip_registration_deleted` | The ISIP registration status has been deleted | SIP |
| `quantum_certificate_not_received` | The quantum certificate has not been received | New purchase |
| `indemnity_bond_not_notarised` | The indemnity bond has not been notarized by a notary | New purchase |
| `instrument_post_stale_dated` | The instrument date is either post-dated or stale-dated | New purchase |
| `request_not_clear` | The request submitted is not clear | New purchase |
| `endorsement_thumb_impression_attestation_missing` | Endorsement by mark or thumb impression requires attestation which is missing | New purchase |
| `item_listed_twice` | The same item has been listed twice in the request | New purchase |
| `microsip_address_mismatch` | There is an address mismatch between the Micro SIP application and proof | SIP |
| `min_investment_amount_not_met` | The minimum investment amount requirement has not been met | New purchase |
| `moa_asl_not_available` | The MOA (Memorandum of Association) or ASL is not available | New purchase |
| `not_valid_instrument` | The instrument provided is not valid | New purchase |
| `not_in_required_multiples` | The transaction amount or units are not in the required multiples | New purchase |
| `notary_not_attested_thumb_impression` | The notary has not attested the thumb impression | New purchase |
| `option_name_not_mentioned` | The option name has not been mentioned in the request | New purchase |
| `overwriting_on_request` | There is overwriting on the request document | New purchase |
| `no_authentication` | The required authentication is missing | New purchase |
| `payees_endorsement_required` | The payee's endorsement is required but not provided | New purchase |
| `period_of_validity_not_mentioned` | The period of validity has not been mentioned | New purchase |
| `plan_name_not_mentioned` | The plan name has not been mentioned in the request | New purchase |
| `poa_holder_sign_not_tally` | The POA holder's signature does not match | New purchase |
| `post_dated_request` | The request is post-dated | New purchase |
| `redemption_request_not_clear` | The redemption request is not clear | Redemption |
| `standing_instruction_failed` | The standing instruction has failed | SIP |
| `switch_not_allowed_lock_in_period` | Switch is not allowed within the 3-year lock-in period | Switch |
| `temporary_suspension_investment_limit` | There is a temporary suspension on investments exceeding Rs 1 lakh | New purchase |
| `third_party_declaration_not_provided` | The third party declaration has not been provided | New purchase |
| `thumb_impression_required_attestation` | The thumb impression requires attestation | New purchase |
| `withdrawal_stopped_insolvency` | Withdrawal has been stopped owing to insolvency of the account | Redemption |
| `ubo_declaration_missing_incomplete` | The UBO (Ultimate Beneficial Owner) declaration is not provided or is incomplete | New purchase |
| `purchase_refund` | The purchase transaction has been refunded | New purchase |
| `plan_rectification` | The details passed for the Plan registration are incorrect and a rectification is required | SIP |
| `refunded_in_different_folio` | The amount has refunded in other folio of the investor | Redemption |
| `amount_mismatch` | There is an amount mismatch and it does not tally | New purchase |
| `npo_form_not_provided_flag_not_available` | The NPO form has not been provided or the NPO flag is not available | New purchase |
| `miscellaneous` | Miscellaneous rejection reason | New purchase |
| `arn_not_empanelled` | The ARN is not empanelled | New purchase |
| `reinvestment_flag_invalid` | Only dividend payout option is allowed for this scheme | New purchase |
| `third_party_investment_not_allowed` | Third party investments are not allowed | New purchase |
| `nfo_closed` | The transaction was reported post NFO closure | New purchase |
| `consolidated_amount_for_same_pan_cannot_exceed_rs_25000` | Consolidated amount for the same PAN cannot exceed Rs. 25,000 | New purchase |
| `accumulated_at_pan_level_amount_should_not_exceed_rs_25000` | Accumulated amount at PAN level should not exceed Rs. 25,000 or existing SIP has already crossed Rs. 25,000 | SIP |
| `consolidated_amount_for_same_pan_cannot_exceed_rs_2500` | Consolidated amount for the same PAN cannot exceed Rs. 2,500 | New purchase |
| `accumulated_at_pan_level_amount_should_not_exceed_rs_2500` | Subscription amount cannot exceed Rs. 2,500 or accumulated amount at PAN level should not exceed Rs. 2,500 | New purchase |
| `invalid_folio_no_due_to_having_junk_characters` | Invalid folio number due to having junk characters | All |
| `pms_folio_number_is_not_allowed_to_transact` | PMS folio number is not allowed to transact | New purchase |
| `duplicate_utr_number_found_in_the_same_file` | Duplicate UTR number found in the same file | Purchase |
| `invalid_or_missing_user_transaction_number` | Invalid or missing user transaction number | All |
| `already_entry_for_this_usertrxnno` | Entry already exists for this user transaction number | All |
| `invalid_or_missing_broker_code` | Invalid or missing broker code | New purchase |
| `invalid_or_missing_investor_consent_for_ria` | Invalid or missing investor consent for RIA | New purchase |
| `for_power_goal_investments_switches_are_not_allowed` | For Power Goal investments, switches are not allowed | Switch |
| `for_power_goal_investments_systematic_withdrawl_are_not_allowed` | For Power Goal investments, systematic withdrawal is not allowed | SWP |
| `power_goals_rejections` | Power Goals related rejections | New purchase |
| `invalid_or_missing_demat_details` | Invalid or missing DEMAT details | New purchase |
| `registration_serial_number_should_not_be_blank_for_systematic_transactions` | Registration serial number should not be blank for systematic transactions | SIP |
| `invalid_or_missing_frequency_for_systematic_transactions` | Invalid or missing frequency for systematic transactions | SIP |
| `invalid_or_missing_registration_date_for_systematic_transactions` | Invalid or missing registration date for systematic transactions | SIP |
| `invalid_or_missing_start_date_for_systematic_transactions` | Invalid or missing start date for systematic transactions | SIP |
| `invalid_or_missing_end_date_for_systematic_transactions` | Invalid or missing end date for systematic transactions | SIP |
| `start_date_and_end_date_should_not_be_same_for_systematic_transactions` | Start date and end date should not be the same for systematic transactions | SIP |
| `start_date_should_be_less_than_end_date_for_systematic_transactions` | Start date should be less than end date for systematic transactions | SIP |
| `start_date_should_not_be_less_than_registration_date_for_systematic_transactions` | Start date should not be less than registration date for systematic transactions | SIP |
| `installment_amount_should_not_be_blank_for_systematic_transactions` | Installment amount should not be blank for systematic transactions | SIP |
| `invalid_or_missing_transaction_date` | Invalid or missing transaction date | New purchase |
| `invalid_or_missing_transaction_time` | Invalid or missing transaction time | New purchase |
| `invlid_missing_nominee_opt_flag` | Invalid or missing nominee opt flag | New purchase |
| `nominee_is_not_allowed_for_minor` | Nominee is not allowed for minor investors | New purchase |
| `nominee_is_not_allowed_for_non_individual` | Nominee is not allowed for non-individual investors | New purchase |
| `nominee1_name_is_mandatory` | Nominee 1 name is mandatory | New purchase |
| `nominee1_percentage_is_mandatory` | Nominee 1 percentage is mandatory | New purchase |
| `nominee1_relation_is_mandatory` | Nominee 1 relation is mandatory | New purchase |
| `invalid_missing_nominee1_dob` | Invalid or missing nominee 1 date of birth | New purchase |
| `missing_nominee1_guardian_name` | Missing nominee 1 guardian name | New purchase |
| `nominee2_name_is_mandatory` | Nominee 2 name is mandatory | New purchase |
| `nominee2_percentage_is_mandatory` | Nominee 2 percentage is mandatory | New purchase |
| `nominee2_relation_is_mandatory` | Nominee 2 relation is mandatory | New purchase |
| `invalid_missing_nominee2_dob` | Invalid or missing nominee 2 date of birth | New purchase |
| `missing_nominee2_guardian_name` | Missing nominee 2 guardian name | New purchase |
| `nominee3_name_is_mandatory` | Nominee 3 name is mandatory | New purchase |
| `nominee3_percentage_is_mandatory` | Nominee 3 percentage is mandatory | New purchase |
| `nominee3_relation_is_mandatory` | Nominee 3 relation is mandatory | New purchase |
| `invalid_missing_nominee3_dob` | Invalid or missing nominee 3 date of birth | New purchase |
| `missing_nominee3_guardian_name` | Missing nominee 3 guardian name | New purchase |
| `overall_nominee_percentage_should_be_equal_to_100` | Overall nominee percentage should be equal to 100 | New purchase |
| `corresponding_si_rejected_hence_so_cannot_process` | Corresponding switch-in transaction rejected, hence switch-out cannot process | Switch |
| `corresponding_so_rejected_hence_si_cannot_process` | Corresponding switch-out transaction rejected, hence switch-in cannot process | Switch |
| `si_and_so_scheme_and_plan_should_not_be_same` | Switch-in and switch-out scheme and plan should not be the same | Switch |
| `from_folio_and_to_folio_should_be_same` | From folio and to folio should be the same when a switch transaction is placed | Switch |
| `rejected_due_to_amount_exceeding_rs_1500000` | Rejected due to amount exceeding Rs. 15,00,000 | New purchase |
| `consolidated_out_folio_hence_no_further_transaction_will_be_allowed` | Consolidated out folio, hence no further transactions will be allowed | All |
| `invalid_or_missing_folio_number` | Invalid or missing folio number | All |
| `investment_amount_should_not_be_zero_0` | Investment amount should not be zero | New purchase |
| `rejected_due_to_minimum_amount_condition_failed` | Rejected due to minimum amount condition failed | All |
| `missing_units_or_amount_for_partial_redemption_or_switch_transaction` | Missing units or amount for partial redemption or switch transaction | Redemption / Switch |
| `rejected_due_to_balunits_are_nill` | Rejected due to balance units being nil | Redemption / Switch |
| `rejected_due_to_units_under_lock_in_period` | Rejected due to units being under lock-in period | Redemption / Switch |
| `invalid_or_missing_paperless_flag` | Invalid or missing paperless flag | New purchase |
| `log_wt_is_mandatory` | LOG_WT is mandatory | New purchase |
| `aof_ref_is_mandatory` | AOF_REF is mandatory | New purchase |
| `account_is_frozen_for_reason_please_check_with_unit` | Account is frozen, please check with the unit for the reason | New purchase |
| `mv_scheme_merged_to_mc_please_report_in_mc` | MV scheme has been merged to MC, please report in MC | New purchase |
| `euin_declaration_should_not_be_blank_for_subscriptions` | EUIN declaration should not be blank for subscriptions | New purchase |
| `invalid_subscription_amount` | Invalid subscription amount | New purchase |
| `subscription_amount_and_installment_amount_must_be_same` | Subscription amount and installment amount must be the same | SIP |
| `demat_cases_should_process_through_exchange_or_dp` | Demat cases should be processed through exchange or DP | New purchase |
| `invalid_or_missing_credit_flag` | Invalid or missing credit flag | New purchase |
| `invalid_or_missing_self_family_declaration_flag` | Invalid or missing self/family declaration flag | New purchase |
| `invalid_or_missing_amc_terms_and_conditions_consent_flag` | Invalid or missing AMC terms and conditions consent flag | New purchase |
| `subscription_amount_cannot_exceed_rs_25000` | Subscription amount cannot exceed Rs. 25,000 | New purchase |
| `exisitng_sip_already_crossed_rs_25000` | Existing SIP has already crossed Rs. 25,000 | SIP |
| `subscription_amount_cannot_exceed_rs_2500` | Subscription amount cannot exceed Rs. 2,500 | New purchase |
| `exisitng_sip_already_crossed_rs_2500` | Existing SIP has already crossed Rs. 2,500 | SIP |
| `stp_not_allowed_in_eb_after_7th_nov_2020` | STP is not allowed in EB after 7th November 2020 | STP |
| `minimun_installments_required_5` | Minimum installments required is 5 | SIP |
| `invalid_cycle_date` | Invalid cycle date | SIP |
| `start_end_date_should_always_be_wednesday_or_invalid_minimum_gap_between_registration_date_and_start_date` | Start/end date should always be Wednesday or there is an invalid minimum gap between registration date and start date | SIP |
| `invalid_or_missing_euin_number_euin_format_exxxxxx` | Invalid or missing EUIN number (EUIN format - EXXXXXX) | New purchase |
| `folio_number_should_be_blank_for_zbf` | Folio number should be blank for ZBF | New purchase |
| `amount_should_be_blank_for_zbf` | Amount should be blank for ZBF | New purchase |
| `units_should_be_blank_for_zbf` | Units should be blank for ZBF | New purchase |
| `invalid_or_missing_trxn_mode` | Invalid or missing TRXN_MODE | New purchase |
| `arn_cannot_transact_in_direct_schemes` | ARN cannot transact in direct schemes | New purchase |
| `ria_cannot_transact_in_regular_schemes` | RIA cannot transact in regular schemes | New purchase |
| `missing_units_for_etf` | Missing units for ETF | New purchase |
| `physical_folio_but_not_available` | Physical folio is not available | New purchase |
| `multiple_folios_exists_with_same_scheme_plan_for_dpid_ben_id` | Multiple folios exist with the same scheme and plan for DPID and BEN_ID | New purchase |
| `could_not_fetch_folio_based_on_dpid_benf_id` | Could not fetch folio based on DPID and BENF_ID | New purchase |
| `inflows_are_not_allowed_in_this_scheme` | Inflows are not allowed in this scheme | New purchase |
| `invalid_or_missing_goal` | Invalid or missing goal | SIP |
| `invalid_or_missing_goal_amount` | Invalid or missing goal amount | SIP |
| `goal_amount_should_not_be_less_than_installment_amount` | Goal amount should not be less than installment amount | SIP |
| `sip_insure_is_allowed_in_dpc_mode_only` | SIP Insure is allowed in DPC mode only | SIP |
| `demat_transactions_are_not_allowed_in_this_scheme` | Demat transactions are not allowed in this scheme | New purchase |
| `invalid_or_missing_installment_no` | Invalid or missing installment number | SIP |
| `allotment_mode_is_mandatory` | Allotment mode is mandatory | New purchase |
| `invalid_or_missing_brok_type` | Invalid or missing BROK_TYPE | New purchase |
| `investor_dp_id_broke_dpid_details_are_mandatory` | Investor DP_ID/BROKE DPID details are mandatory | New purchase |
| `missing_invalid_dpc_flag` | Missing or invalid DPC flag | New purchase |
| `inv_dp_id_and_brok_dp_id_should_not_be_same` | INV_DP_ID and BROK_DP_ID should not be the same | New purchase |
| `both_units_and_amount_should_not_be_provided` | Both units and amount should not be provided | New purchase |
| `invalid_cycle_date_1` | Invalid cycle date | SIP |
| `invaid_registration_serial_number` | Invalid registration serial number | SIP |
| `clos_ac_ch_is_mandatory` | CLOS_AC_CH is mandatory | New purchase |
| `nominee_details_should_be_blank_if_nominee_opt_is_y_na` | Nominee details should be blank if nominee opt is Y/NA | New purchase |
| `investor_name_and_nominee_name_should_not_be_same` | Investor name and nominee name should not be the same | New purchase |
| `sips_stps_are_not_allowed_in_overseas_securities` | SIPs/STPs are not allowed in overseas securities | SIP / STP |
| `dmat_switch_cannot_be_processed_and_viceversa` | Demat switch cannot be processed and vice versa | Switch |
| `restriction_of_demat_transactions_due_to_bnp_bob_merger` | Restriction of demat transactions due to BNP/BOB merger | New purchase |
| `invalid_user_transaction_number` | Invalid user transaction number | New purchase |
| `demat_redemption_switch_is_not_allowed` | Demat redemption and switch are not allowed | Redemption / Switch |
| `can_is_not_mapped_to_folio` | CAN is not mapped to folio | New purchase |
| `only_purchase_transactions_allowed_for_demat` | Only purchase transactions are allowed for demat | New purchase |
| `invaild_or_missing_inv_dp_id` | Invalid or missing INV_DP_ID | New purchase |
| `sip_insure_is_not_allowed_for_new_purchase` | SIP Insure is not allowed for new purchase | SIP |
| `invalid_or_missing_dob_for_nominee_minor` | Invalid or missing DOB for nominee minor | New purchase |
| `missing_guardian_for_nominee_minor` | Missing guardian for nominee minor | New purchase |
| `missing_nominee_name_or_relation_or_percentage` | Missing nominee name, relation, or percentage | New purchase |
| `missing_nominee_name_or_minorflag_or_percentage_or_relation` | Missing nominee name, minor flag, percentage, or relation | New purchase |
| `invalid_document_type_declaration` | Invalid document type declaration | New purchase |
| `invalid_sip_end_date` | Invalid SIP end date | SIP |
| `invalid_doc_type_based_on_trxn_mode` | Invalid document type based on transaction mode | New purchase |
| `pragati_scheme_facility_is_not_allowed_in_demat` | Pragati scheme facility is not allowed in demat | SIP |
| `imps_tech_failure` | IMPS Service Not Responding | Instant Redemption |
| `imps_tech_failure_at_payout_bank` | IMPS failed due to technical issue at bank end | Instant Redemption |
| `upstream_failure` | Upstream service provider not available due to some technical issues, please retry after some time | Instant Redemption |
| `folio_number_not_found` | Folio number is not present at the gateway due to PAN validation failure | Redemption |
| `instant_redemption_amount_exceeded` | The Redemption transaction value is more than the eligible amount | Instant Redemption |
| `duplicate_instant_redemption_request` | For every instant redemption order request, a pre-redemption summary needs to be called and then only proceed | Instant Redemption |
| `others` | Due to a technical issue at the gateway, the order couldn't be processed. Please retry after some time | Instand Redemption |
| `invalid_scheme_in_pragati_sip` | Invalid scheme in Pragati SIP | SIP |
| `only_monthly_frequency_allowed_in_pragati_sip_schemes` | Only monthly frequency is allowed in Pragati SIP schemes | SIP |
| `no_of_installments_should_be_in_96_120_144_180_240_300_360` | Number of installments should be 96, 120, 144, 180, 240, 300, or 360 | SIP |
| `sip_start_end_dates_tenure_must_be_in_8_10_12_15_20_25_30_years` | SIP start/end dates tenure must be 8, 10, 12, 15, 20, 25, or 30 years | SIP |
| `additional_purchase_with_sip_is_not_allowed_in_pragati_sip` | Additional purchase with SIP is not allowed in Pragati SIP | SIP |
| `invalid_allotment_mode` | Invalid allotment mode | New purchase |
| `invalid_or_missing_nominee_declaration_flag_at_can_level` | Invalid or missing nominee declaration flag at CAN level | New purchase |
| `non_availability_of_scheme_in_the_mentioned_folio` | Non-availability of scheme in the mentioned folio | New purchase |
| `distributor_is_not_empanelled_with_amc` | Distributor is not empanelled with AMC | New purchase |
| `nse_transactions_are_not_allowed_in_bse_platform` | NSE transactions are not allowed in BSE platform | New purchase |
| `invalid_junk_values_are_available_in_micr_cd` | Invalid - junk values are available in MICR_CD | New purchase |
| `sip_cancelled_request_already_initiated_by_the_investor` | SIP cancelled request has already been initiated by the investor | SIP |
| `dmat_transaction_not_allowed_in_atnsip` | Demat transaction is not allowed in ATNSIP | SIP |
| `invalid_scheme_in_atnsip` | Invalid scheme in ATNSIP | SIP |
| `only_monthly_frequency_can_be_allowed_in_atnsip` | Only monthly frequency can be allowed in ATNSIP | SIP |
| `invalid_installments_in_atnsip` | Invalid installments in ATNSIP | SIP |
| `tenure_must_be_in_8_10_12_15_20_25_30_years` | Tenure must be 8, 10, 12, 15, 20, 25, or 30 years | SIP |
| `atnsip_is_not_allowed_in_existing_normal_folio` | ATNSIP is not allowed in existing normal folio | SIP |
| `invalid_missing_usercode` | Invalid or missing usercode | New purchase |
| `bse_transcations_are_not_allowed_in_nse_platform` | BSE transactions are not allowed in NSE platform | New purchase |
| `amount_and_sip_amount_should_be_same` | Amount and SIP amount should be the same | SIP |
| `amount_cannot_exceed_2_lakh_for_this_scheme` | Amount cannot exceed 2 lakh for this scheme | New purchase |
| `paperlessflag_wrongly_provided` | Paperless flag wrongly provided | New purchase |
| `dp_information_not_matching_with_rta_records_for_the_given_folio` | DP information is not matching with RTA records for the given folio | New purchase |
| `mismatch_of_allotment_mode_demat_details_for_folio_based_transaction_hence_reject` | Mismatch of allotment mode/demat details for folio based transaction, hence rejected | New purchase |
| `npo_form_npo_dcl_should_be_n_for_individuals` | NPO_FORM and NPO_DCL should be 'N' for individuals | New purchase |
| `npo_form_npo_dcl_should_be_y_or_n_for_non_individuals` | NPO_FORM and NPO_DCL should be 'Y' or 'N' for non-individuals | New purchase |
| `npo_dcl_npo_form_should_be_n_or_y_for_trust_or_society` | NPO_DCL/NPO_FORM should be 'N' or 'Y' for trust or society | New purchase |
| `missing_npo_rgno_or_npo_form_should_be_y_when_npo_dcl_is_y` | Missing NPO RGNO or NPO form should be 'Y' when NPO DCL is 'Y' | New purchase |
| `missing_invalid_ubo_dcl` | Missing or invalid UBO_DCL | New purchase |
| `user_is_not_registered_in_active_for_this_fundcode` | User is not registered or is inactive for this fund code | New purchase |
| `minimum_no_of_instalment_not_met_as_per_sid` | Minimum number of installments not met as per SID | SIP |
| `invalid_or_missing_broker_code_for_eop` | Invalid or missing broker code for EOP | New purchase |
| `eop_cannot_transact_in_regular_schemes` | EOP cannot transact in regular schemes | New purchase |
| `scheme_is_not_allowed_for_this_fund` | Scheme is not allowed for this fund | New purchase |
| `scheme_plan_mismatch_for_direct_agent_code` | Scheme plan mismatch for direct agent code | New purchase |
| `amount_less_than_or_equal_to_1_crores` | Amount must be less than or equal to 1 crore | New purchase |
| `invalid_sip_startdate_should_not_be_blank` | Invalid SIP start date or it should not be blank | SIP |
| `invalid_sip_enddate_should_not_be_blank` | Invalid SIP end date or it should not be blank | SIP |
| `sip_startdate_enddate_should_not_be_same` | SIP start date and end date should not be the same | SIP |
| `sip_startdate_should_not_exceed_enddate` | SIP start date should not exceed end date | SIP |
| `sip_startdate_should_not_below_registration_date` | SIP start date should not be before registration date | SIP |
| `invalid_registration_date` | Invalid registration date | SIP |
| `age_limit_exceeded` | Maximum Age limit for Investment in Retirement scheme is below 60 years. | Purchase |
| `for_sip_in_small_cap_scheme_sip_amount_should_be_1lakh_and_below_from_26_03_2016` | For SIP in small cap scheme, SIP amount should be 1 lakh and below from 26/03/2016 | SIP |
| `sip_startdate_should_be_in_between_6_months_from_the_current_date` | SIP start date should be within 6 months from the current date | SIP |
| `sip_startdate_datepart_should_not_be_in_29th_30th_and_31st` | SIP start date should not be on the 29th, 30th, or 31st | SIP |
| `sip_enddt_datepart_should_not_be_in_29th_30th_and_31st` | SIP end date should not be on the 29th, 30th, or 31st | SIP |
| `sip_startdate_and_enddate_datepart_should_be_same` | SIP start date and end date should have the same date part | SIP |
| `invalid_sip_frequency_should_be_in_daily_weekly_monthly_quarterly_or_yearly` | Invalid SIP frequency - should be daily, weekly, monthly, quarterly, or yearly | SIP |
| `invalid_sip_frequency_should_be_in_monthly_quarterly_daily_weekly` | Invalid SIP frequency - should be monthly, quarterly, daily, or weekly | SIP |
| `entered_scheme_not_eligible_for_sip_insurance` | Entered scheme is not eligible for SIP insurance | SIP |
| `this_scheme_allowed_for_sip_insurance_from_01_06_2018` | This scheme is allowed for SIP insurance from 01/06/2018 | SIP |
| `sip_insure_starts_from_12_th_may_2008` | SIP Insure starts from 12th May 2008 | SIP |
| `for_insurance_minimum_amount_is_rs_500` | For insurance, minimum amount is Rs. 500 | SIP |
| `for_insurance_minimum_amount_is_rs_1500_for_quarterly` | For insurance, minimum amount is Rs. 1,500 for quarterly | SIP |
| `for_insurance_minimum_amount_is_rs_6000_for_yearly` | For insurance, minimum amount is Rs. 6,000 for yearly | SIP |
| `minimum_installments_for_monthly_sip_insure_is_36` | Minimum installments for monthly SIP Insure is 36 | SIP |
| `minimum_installments_for_yearly_sip_insure_is_3` | Minimum installments for yearly SIP Insure is 3 | SIP |
| `minimum_installments_for_yearly_sip_insure_is_12` | Minimum installments for yearly SIP Insure is 12 | SIP |
| `min_installment_amount_is_5000_for_yearly_frequency` | Minimum installment amount is Rs. 5,000 for yearly frequency | SIP |
| `min_installments_required_2_for_the_selected_frequency` | Minimum installments required is 2 for the selected frequency | SIP |
| `minimum_amount_is_rs_100` | Minimum amount is Rs. 100 | New purchase |
| `min_no_of_10_calender_days_gap_not_fulfilled_days_difference` | Minimum of 10 calendar days gap is not fulfilled | SIP |
| `for_tax_saver_sip_amount_should_be_multiples_of_500` | For tax saver SIP, amount should be multiples of Rs. 500 | SIP |
| `for_yearly_sip_amount_should_be_multiples_of_500` | For yearly SIP, amount should be multiples of Rs. 500 | SIP |
| `for_retirement_scheme_startdate_should_not_below_18_03_2015` | For retirement scheme, start date should not be before 18/03/2015 | SIP |
| `min_installments_required_6_for_the_selected_frequency_and_amount` | Minimum installments required is 6 for the selected frequency and amount | SIP |
| `min_installments_required_12_for_the_selected_frequency_and_amount` | Minimum installments required is 12 for the selected frequency and amount | SIP |
| `min_installments_required_60_for_the_selected_frequency_and_amount` | Minimum installments required is 60 for the selected frequency and amount | SIP |
| `min_installments_required_4_for_the_selected_frequency_and_amount` | Minimum installments required is 4 for the selected frequency and amount | SIP |
| `dividend_bonus_already_processed` | The dividend/ bonus is already processed | Redemption |
| `sip_registration_restricted` | SIP Registration during a restriction period | SIP |
| `folio_consolidated_out` | The respective folio has been consolidated to another folio, and hence additional transactions are not allowed in this folio | All |