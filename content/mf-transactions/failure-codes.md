---
title: Order failure codes
---

### Order failure codes

The following are the failure codes that might occur while processing an order with the AMC after it is accepted in FP. These failure codes are also applicable to the installment orders of all type of plans. You can use the `failure code` to design investor communication as needed.

> We might add more failure codes in future to maintain a granular list of the possible failures.

Note- The failure codes mentioned are not case-sensitivie

#### Order failure codes related to investor profile

| Failure Code   | Description  | Order type    |
| --- | --- | --- |
| `pan_invalid` | Unable to verify PAN of investor. Provide correct PAN. | New purchase |
| `pan_name_mismatch` | Investor name provided for folio creation is not as per investor's PAN | New purchase |
| `pan_aadhaar_not_mapped` | Aadhaar not linked with the PAN of the investor | All |
| `aadhaar_contact_mismatch` | Email or mobile provided for folio creation is not as per investor's aadhaar. For aadhaar based KYC investors provide email and phone as per aadhaar during folio creation | New purchase |
| `bank_invalid` | Unable to verify bank account details of investor. Check investor name in bank account | Purchase |
| `bank_ifsc_invalid` | IFSC of the bank account is not valid | Purchase |
| `tax_status_bank_mismatch` | Investor's tax status does not match with bank account type | Purchase |
| `contact_verification_failed` | Email or mobile number provided in the folio details could not be verified. Provide a valid email or mobile number. | Purchase |
| `nominee_age_invalid` | Age of the nominee should be less than 100 and more than 0 | New purchase |
| `nominee_name_invalid` | Investor and nominee name cannot be same | New purchase |
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
| `minor_pan_should_not_be_same_as_guardian_pan` | Minor's PAN should not be the same as the guardian's PAN or third party payment check has to be 'N' | New purchase |
| `invalid_missing_guardian_pan_number` | Joint holders are not allowed for minor investments or guardian PAN number is invalid/missing | New purchase |
| `primary_holder_name_is_missing` | Primary holder name is missing | New purchase |
| `invalid_or_missing_dob_for_minor_investments` | Invalid or missing date of birth for minor investments | New purchase |
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
| `primary_holder_and_j1_mobile_is_same` | Primary holder and Joint Holder1 mobile is the same | New purchase |
| `primary_holder_and_j1_email_is_same` | Primary holder and Joint Holder1 email is the same | New purchase |
| `primary_holder_j1_j2_mobile_is_same` | Primary holder/Joint Holder1/Joint Holder2 mobile is the same | New purchase |
| `primary_holder_j1_j2_email_is_same` | Primary holder/Joint Holder1/Joint Holder2 email is the same | New purchase |
| `invalid_j1_j2_mobile_declaration_flag` | Invalid Joint Holder1/Joint Holder2 mobile declaration flag | New purchase |
| `invalid_j1_j2_email_declaration_flag` | Invalid Joint Holder1/Joint Holder2 email declaration flag | New purchase |
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
| `tax_status_should_be_minor_for_this_scheme` | Tax status should be minor for this scheme | New purchase |
| `minor_attained_major` | The minor investor has attained majority | New purchase |
| `minor_major_attestation_required` | The minor who has become a major unit holder requires attestation by guardian, donor, or banker | New purchase |
| `minor_to_major_documents_missing` | Documents required for the minor to major conversion are missing | New purchase |
| `minor_major_signature_not_available` | The signature of the minor who has turned major is not available in the request | New purchase |
| `minor_major_guardian_signature_invalid` | The minor has attained majority and the guardian's signature is no longer valid | New purchase |
| `unit_holder_minor_guardian_sign_required` | The unit holder is still a minor and requires the guardian or donor's signature | New purchase |
| `minor_name_should_not_be_same_as_guardian_name` | Minor name should not be the same as guardian name | New purchase |
| `ph_mobile_email_missing` | Both mobile and email are not provided for primary holder | All |
| `ph_mobile_email_decl_flag_invalid` | Mobile/email declaration flag is available but mobile/email is missing for primary holder | All |
| `j1_mobile_email_missing_2fa` | Mobile or email are not provided for joint holder 1 based on 2FA flag | All |
| `j1_mobile_email_decl_invalid` | Mobile/email declaration flag is invalid or mobile/email is missing for joint holder 1 | All |
| `j2_mobile_email_missing_2fa` | Mobile or email are not provided for joint holder 2 based on 2FA flag | All |
| `j2_mobile_email_decl_invalid` | Mobile/email declaration flag is invalid or mobile/email is missing for joint holder 2 | All |
| `ph_j1_mobile_email_same` | Primary holder and joint holder 1 have the same mobile and email combination | All |
| `ph_j1_j2_mobile_email_same` | Primary holder, joint holder 1, and joint holder 2 have the same mobile and email combination | All |
| `spl_char_num_not_allowed_indiv_names` | Special characters and numerics not allowed in primary holder/joint holder/nominee names for individuals | All |
| `spl_char_not_allowed_non_indiv` | Special characters not allowed in name for non-individual investors | All |
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
| `kyc_dob_mismatch` | Date of birth provided for folio creation does not match with the information submitted for KYC verification | New purchase |
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
| `invalid_or_missing_primary_holder_pan_details` | Primary holder PAN details are invalid or missing | New purchase |
| `invalid_or_missing_guardian_pan_exempt_flag` | Guardian details should not be allowed for this tax status or guardian PAN exempt flag is invalid/missing | New purchase |
| `invalid_or_missing_jh1_pan_exempt_flag` | Invalid or missing mode of holding or JH1 PAN exempt flag | New purchase |
| `invalid_or_missing_jh1_pan_details` | JH1 name is missing or JH1 PAN details are invalid/missing | New purchase |
| `invalid_or_missing_jh2_pan_exempt_flag` | Invalid or missing JH1 DOB or JH2 PAN exempt flag | New purchase |
| `invalid_or_missing_jh2_pan_details` | JH2 name is missing or JH2 PAN details are invalid/missing | New purchase |
| `pan_no_and_lei_code_combination_mismatch` | LEI code is not available in the master or PAN and LEI code combination mismatch | New purchase |
| `invalid_nominee_guardian_pan` | Guardian is missing for the nominee minor or nominee guardian PAN is invalid | New purchase |
| `fh_j1_j2_nominee_pans_should_not_be_same` | First holder, JH1, JH2, and nominee PANs should not be the same or invalid DOB | New purchase |
| `pan_4th_letter_is_not_p_h_else_re_verify_the_pan` | PAN's 4th letter is neither 'P' nor 'H', else re-verify the PAN or invalid document type declaration | New purchase |
| `missing_j1_j2_pan_pekrn` | Missing JH1 or JH2 PAN/PEKRN or invalid/missing nominee declaration flag at CAN level | New purchase |
| `ph_exempt_cat_or_pan_missing` | Primary holder exempt category or PAN exempt KRA reference number is missing | All |
| `guard_exempt_cat_missing` | Guardian exempt category or KRA reference number is missing | All |
| `jh1_exempt_cat_missing` | Joint holder 1 exempt category or KRA reference number is missing | All |
| `jh2_exempt_cat_missing` | Joint holder 2 exempt category or KRA reference number is missing | All |
| `h1_h2_pan_same` | First holder PAN and second holder PAN should not be the same | All |
| `h2_h3_pan_same` | Second holder PAN and third holder PAN should not be the same | All |
| `h1_h3_pan_same` | First holder PAN and third holder PAN should not be the same | All |
| `pan_p_must_be_individual` | PAN 4th letter is 'P', status should be individual, else re-verify the PAN | All |
| `pan_h_must_be_huf` | PAN 4th letter is 'H', status should be HUF, else re-verify the PAN | All |
| `pan_not_h_cant_be_huf` | PAN 4th letter is not 'H', status should not be HUF, else re-verify the PAN | All |
| `pan_not_p_cant_be_individual` | PAN 4th letter is not 'P', status should not be individual, else re-verify the PAN | All |
| `no_pan_amt_max_50k` | Invalid or missing PAN, hence purchase amount cannot be more than Rs. 50,000 | Purchase |
| `nre_nro_not_for_resident` | NRE/NRO bank account type not allowed for resident individuals | All |
| `nri_needs_nre_nro_acct` | NRE or NRO bank account details required for NRI investor | All |
| `minor_guardian_reqd` | Guardian details should not be blank for minor investments | All |
| `guardian_not_allowed_tax_status` | Guardian details should not be allowed for this tax status | All |
| `minor_no_joint_holders` | Joint holders are not allowed for minor investments | All |
| `purchase_minor_only` | Purchase allowed only for minor investors, not for individuals | Purchase |
| `scheme_not_allowed_tax_age` | Scheme is not allowed for this tax status as per age | All |
| `dp_info_mismatch_folio` | DP information not matching with RTA records for the given folio | All |
| `allot_mode_demat_mismatch` | Mismatch of allotment mode/demat details for folio-based transaction, hence rejected | All |
| `multi_folio_same_scheme_dpid` | Multiple folios exist with same scheme/plan for DPID/BEN_ID | All |
| `nom_blank_if_opt_y_na` | Nominee details should be blank if nominee opt is Y/NA | All |
| `nom_name_minor_pct_rel_missing` | Missing nominee name or minor flag or percentage or relation | All |
| `nom_guard_pan_blank_if_not_minor` | Nominee guardian PAN should be blank when minor flag is N/NULL | All |
| `nom_decl_flag_missing_can` | Invalid or missing nominee declaration flag at CAN level | All |
| `npo_dcl_form_y_n_trust_society` | NPO_DCL/NPO_FORM should be N or Y for trust or society | All |
| `npo_form_y_n_non_indiv` | NPO_FORM/NPO_DCL should be Y or N for non-individuals | All |
| `npo_rgno_missing_if_dcl_y` | Missing NPO RGNO or NPO form should be Y when NPO_DCL is Y | All |
| `euin_decl_reqd_subs` | EUIN declaration should not be blank for subscriptions | All |
| `amc_terms_consent_missing` | Invalid or missing AMC terms and conditions consent flag | All |
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
| `amount_invalid` | Order does not meet the min\max investment amount or multiples as per scheme master | All |
| `units_invalid` | Order does not meet the min\max investment units as per scheme master | Redemption, Switch |
| `scheme_invalid` | Order is not supported in the scheme. Check scheme master for order types supported | All |
| `plan_scheme_date_invalid` | Installment date selected for the purchase plan is not allowed in the scheme | Purchase plan |
| `minor_only_investment_allowed` | Only minor investor purchases are allowed in this scheme | New purchase |
| `country_not_allowed` | Country of investor is not allowed for investments in the scheme | New purchase |
| `no_of_installments_invalid` | No. of installments for the purchase plan as per the the scheme or frequency is not valid | Purchase plan |
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
| `order_expiry` | Purchase order expired as payment not complete | Purchase |
| `payment_failure` | If using FP Payments, then payment for the order is either not created or failed | Purchase |
| `payment_not_received` | Payment for this order has not been recieved by the AMC. If any amount is debited then check refund status with the payment provider. | Purchase |
| `mandate_payment_failed` | Mandate associated with the order is invalid\not approved and hence payment failed | Purchase |
| `mandate_cancelled` | Mandate associated with the order is cancelled and hence payment failed | Purchase |
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
| `multiple_tax_statuses` | Investor has different tax statuses across folios. Update latest tax status in all folios of the AMC. | Purchase |
| `folio_nominee_opt_in_missing` | Investor has not declared nomination for the folio. Either add nominees or opt out of nomination before submitting another order. | All |
| `demat_folio_order_not_allowed` | Redemption or switch orders in demat folios are not allowed via RTA channel partner account. They should be placed via depository using the DP account | Redemption, Switch |
| `fatca_missing` | Investor FATCA details are not available with AMC. Contact FP operations | Purchase |
| `ekyc_investment_amount_limit_exceeded` | Order amount exceeded investment limit for Aadhaar\eKYC investors. Investor can place order upto Rs. 50,000 per annum per AMC only | Purchase |
| `nomination_declaration_missing` | Nomination opt in or out for the folio associated with the order is missing | All |
| `folio_contact_already_in_use` | Email\mobile used for a folio creation is already linked to another PAN no. Investor needs to declare nominee relation details in the previously used PAN. | New purchase |
| `consent_missing` | 2FA consent from investor is missing for the order | All |
| `consent_contact_mismatch` | Mobile number or email on which investor consent for the order was taken does not match with the folio contact details | All |
| `consent_mobile_mismatch` | Mobile number on which investor consent for the order was taken does not match with the folio contact details | All |
| `consent_email_mismatch` | Email on which investor consent for the order was taken does not match with the folio contact details | All |
| `folio_balance_insufficient` | Balance in the folio and scheme are not sufficient for the order | Redemption, Switch |
| `folio_balance_under_lock` | Balance in the folio and scheme are under lock in and not sufficient for the order | Redemption, Switch |
| `folio_balance_zero` | Balance in the folio and scheme is zero | Redemption, Switch |
| `folio_balance_marked_lien` | Balance cannot be redeemed as it is marked lien | Redemption, Switch |
| `folio_closed` | Orders in a consolidated folio are not allowed | Purchase |
| `license_code_invalid` | Your license code with the RTA is invalid. Also verify that the order's scheme plan_type (i.e regular\direct) is valid for your license code | All |
| `amc_inactive` | AMC under your RTA account is not activated. Activate AMC in your RTA account. Additionally check e-log status if order gateway us RTA - CAMS. | All |
| `cancelled_by_investor` | Order was cancelled from processing upon a request from investor | All |
| `order_expiry` | Order expired as it is not confirmed by investor | Redemption, Switch |
| `order_gateway_failure` | Order failed at the gateway due to unknown reasons | All |
| `technical_failure_at_gateway` | Order failed due to technical issues with the gateway system like RTA | All |
| `folio_locked` | Folio has been locked due to an IT notice and cannot process transactions | All |
| `prospect_folio_third_party_verification_missing` | Third party verification has not been completed for the prospect folio | All |
| `folio_investor_name_mismatch` | The investor name does not match the name associated with the folio | All |
| `folio_number_invalid` | The folio number mentioned in the request is incorrect or invalid | All |
| `folio_blocked_invalid` | The folio is either blocked or invalid and cannot process transactions | All |
| `folio_not_mentioned` | The folio number has not been provided in the request | Redemption / Switch |
| `folio_to_folio_switch_not_permitted` | Switching transactions between two folios is not permitted | Switch |
| `online_folio_transaction_route_distributor` | Online folio transactions must be routed through the Online Distributor | All |
| `folio_contact_same_as_distributor` | The First Holder's email or mobile number matches the distributor's or EUIN's contact details | New purchase |
| `transaction_amount_units_below_min` | The transaction amount or units is less than the minimum value limit | All |
| `switch_transactions_not_allowed_non_ssip` | Switch transactions are not permitted for schemes other than SSIP | Switch |
| `balance_insufficient` | Payer not maintaining sufficient balance in the account | SIP |
| `consol_pan_amt_over_25k` | Consolidated amount for same PAN cannot exceed Rs. 25,000 | All |
| `consol_pan_amt_over_2500` | Consolidated amount for same PAN cannot exceed Rs. 2,500 | All |
| `accum_pan_amt_over_25k` | Accumulated at PAN level amount should not exceed Rs. 25,000 | All |
| `accum_pan_amt_over_2500` | Accumulated at PAN level amount should not exceed Rs. 2,500 | All |
| `pan_amt_over_eb_limit` | Cumulative PAN level amount crossing EB eligible limit | All |
| `micr_missing_ecs` | Invalid or missing MICR code where PAY_MEC selected as ECS | All |
| `pwr_goal_no_switch` | For power goal investments, switches are not allowed | Switch |
| `pwr_goal_no_syst_wdrl` | For power goal investments, systematic withdrawals are not allowed | SWP |
| `goal_amt_lt_install_amt` | Goal amount should not be less than installment amount | All |
| `subs_amt_eq_install_amt` | Subscription amount and installment amount must be the same | All |
| `partial_units_amt_missing` | Missing units or amount for partial redemption or switch transaction | Redemption/Switch |
| `consol_folio_no_txn` | Consolidated out folio, hence no further transaction will be allowed | All |
| `acct_frozen_check_unit` | Account is frozen for reason, please check with unit | All |
| `demat_restrict_bnp_bob_merge` | Restriction of demat transactions due to BNP-BOB merger | All |
| `idbi_mf_txn_blocked_merger` | Transactions in IDBI MF are not allowed due to the merger of AMC | All |
| `syst_txn_serial_num_reqd` | Registration serial number should not be blank for systematic transactions | Systematic |
| `syst_txn_freq_invalid` | Invalid or missing frequency for systematic transactions | Systematic |
| `syst_txn_reg_date_invalid` | Invalid or missing registration date for systematic transactions | Systematic |
| `syst_txn_start_date_invalid` | Invalid or missing start date for systematic transactions | Systematic |
| `syst_txn_end_date_invalid` | Invalid or missing end date for systematic transactions | Systematic |
| `syst_txn_start_end_same` | Start date and end date should not be same for systematic transactions | Systematic |
| `syst_txn_start_gt_end` | Start date should be less than end date for systematic transactions | Systematic |
| `syst_txn_start_lt_reg` | Start date should not be less than registration date for systematic transactions | Systematic |
| `syst_txn_amt_reqd` | Installment amount should not be blank for systematic transactions | Systematic |
| `sip_end_not_29_30_31` | SIP end date (day part) should not be 29th, 30th, or 31st | SIP |
| `sip_start_not_29_30_31` | SIP start date (day part) should not be 29th, 30th, or 31st | SIP |
| `sip_start_within_6mo` | SIP start date should be within 6 months from the current date | SIP |
| `sip_freq_invalid` | Invalid SIP frequency, should be daily, weekly, monthly, quarterly, or yearly | SIP |
| `sip_freq_mthly_qtrly_daily_wkly` | Invalid SIP frequency, should be monthly, quarterly, daily, or weekly | SIP |
| `sip_cancel_already_initiated` | SIP cancellation request already initiated by the investor | SIP |
| `min_2_install_freq` | Minimum installments required: 2 for the selected frequency | SIP |
| `min_4_install_freq_amt` | Minimum installments required: 4 for the selected frequency and amount | SIP |
| `min_6_install_freq_amt` | Minimum installments required: 6 for the selected frequency and amount | SIP |
| `min_12_install_freq_amt` | Minimum installments required: 12 for the selected frequency and amount | SIP |
| `min_60_install_freq_amt` | Minimum installments required: 60 for the selected frequency and amount | SIP |
| `tax_saver_sip_mult_500` | For tax saver SIP, amount should be multiples of Rs. 500 | SIP |
| `weekly_12mo_min_if_lt_500` | Minimum 12 months for weekly frequency below Rs. 500 amount | SIP |
| `install_96_120_144_180_240_300_360` | Number of installments should be 96, 120, 144, 180, 240, 300, or 360 | SIP |
| `tenure_8_10_12_15_20_25_30_yrs` | SIP start/end dates tenure must be 8, 10, 12, 15, 20, 25, or 30 years | SIP |
| `pragati_sip_monthly_only` | Only monthly frequency allowed in Pragati SIP schemes | SIP |
| `pragati_no_addl_purch_with_sip` | Additional purchase with SIP is not allowed in Pragati SIP | SIP |
| `wed_or_min_gap_invalid` | Start/end date should always be Wednesday or invalid minimum gap between registration date and start date | Systematic |
| `min_10_calday_gap_not_met` | Minimum of 10 calendar days gap not fulfilled (days difference) | All |
| `ins_min_1500_qtrly` | For insurance, minimum amount is Rs. 1,500 for quarterly frequency | SIP |
| `min_5k_yearly_freq` | Minimum installment amount is Rs. 5,000 for yearly frequency | SIP |
| `ins_not_daily_weekly` | SIP insure is not allowed for daily or weekly frequency | SIP |
| `order_failure_at_gateway` | The order has been failed at the gateway due to some technical reasons | All |
| `tpv_failure` | Third party validation has been failed and hence the order rejected | All |
| `payment_not_recieved` | Funds not received for the transaction and hence RTA rejected the transaction | Purchase / SIP |
| `folio_balance_under_lock_in` | The holdings balance under the folio are currently locked in and hence redemption/ switch is not permitted | Redemption / Switch |
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
| `folio_consolidated_out` | The respective folio has been consolidated to another folio, and hence additional transactions are not allowed in this folio | All |