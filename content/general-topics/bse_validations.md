---
title: All BSE validations
---

## Introduction

As BSE has some restrictions and validations for various features that we provide via our APIs. We have also added those validations in our APIs. All the extra validation and restrictions that we have for BSE are listed below. 


### Investor 


 - Investor creation for minor NRI is not available currently.

 - Only the primary bank account will be considered for investor creation in the case of NRI investors, which should be of type `NRE` or `NRO`.

 - After creation, it takes 24 hours (approx) for the BSE operations team to verify the bank account details of NRIs. Only after this verification is done, investment account for NRIs will be ready for accepting transactions.

 - When you update the details of an investor at FP, investor demographic information is only updated at FP. The investor demographic information wouldn't change for existing investor information stored at BSE.

#### Mandatory fields validation 
| Field                                    | Mandatory | Remarks|
|------------------------------------------|-----------|---------|
| `perm_addr_is_corres_addr`               | yes ||
| `kyc_identity_detail.name`              | yes ||
| `kyc_identity_detail.date_of_birth`       | yes ||
| `bank_accounts`                            | yes | At least one bank account. For each bank account `type`, `number`, and `ifsc_code` are mandatory. Also cancelled\_cheque is mandatory to create Investment Account when `residential\_status` = `NON\_RESIDENT\_INDIVIDUAL`|
| `correspondence_address.line1 `            | yes ||
| `correspondence_address.city`              | yes ||
| `correspondence_address.state`            | yes ||
| `correspondence_address.pincode`           | yes ||
| `correspondence_address.country_ansi_code` | yes ||
| `contact_detail.email`                     | yes ||
| `contact_detail.mobile`                   | yes ||
| `singnature` | yes ||

#### Tax status specific validations 
| Tax Status         | 4th character of PAN| Bank Account Type | Guardian Name | Guardian PAN | Gender|
|--------------------|---------------------|-------------------|---------------|--------------|---------|
| Individual         | `P` | `SAVINGS`/`CURRENT`/`NRE`/`NRO` | | | mandatory|
| On behalf of minor | `P` | `SAVINGS`/`CURRENT` | mandatory | mandatory | mandatory|

#### Maximum length validations 
| Field                                 | Maximum length|
|---------------------------------------|---------------|
| `kyc_identity_detail.name`              | 70|
| `kyc_identity_detail.guardian_name`     | 35|
| `kyc_identity_detail.date_of_birth`     | 10|
| `nominee.name`                          | 35|
| `nominee.relationship`                  | 20|
| `bank_account.number`                   | 16|
| `bank_account.ifsc`                    | 11|
| `address.line1`                         | 40|
| `address.line2`                        | 40|
| `address.line3`                         | 40|
| `address.city`                         | 35|
| `contact_detail.office_telephone_no`    | 15|
| `contact_detail.residence_telephone_no` | 15|
| `contact_detail.email`                  | 50|
| `contact_detail.mobile`                | 10|



### General Order and Plan related checks

#### Consent

When collecting consent in any type of order or plan. You should keep these checks for consent.

Before the order or plan is sent to BSE, investor consent must be obtained by sending a One-Time Password to the investor at his email and phone number, and consent can be collected either by email/mobile -

- In case of an order placed against an existing folio the OTP should be sent to the email and mobile registered against the existing folio.
- In case of an order placed without folio the OTP should be sent to the email and mobile registered against the UCC.

Note:- Both email and mobile should be added as a part of the consent object in all cases.


#### Order gateway

The `order_gateway` attribute in all types of orders and plans can only be used by tenants that have both gateways enabled for them i.e. BSE and RTA. If the value is null, then the order will be routed through the default gateway which is configured for the tenant.



### MF Purchases

#### Update MF Purchase

After creating a MF purchase order  You have to change the order state to confirmed along with the consent details using [Update a MF Purchase](https://fintechprimitives.com/docs/api/#update-a-mf-purchase) API (Note- You cannot confirm an order without adding the consent details). Once the order is confirmed, FP will try to submit the order to BSE asynchronously in the background. Once the order submission is successful, the purchase order state changes from confirmed to submitted. Please ensure that the orders are in submitted state before you accept payments.


### Transaction Plans

#### General Restrictions

- You can create systematic plans for all three types of MF transaction plans (purchase, redemption, and switch).
- You can create a non systematic plan for only MF purchase plans.
- You cannot generate on demand installments for systematic plans. By default `auto_generate_installments` would be set to true.
- You can only use [skip functionality](https://fintechprimitives.com/docs/api/#skip-installments-via-skip-instructions) for non systematic MF purchase plans.
- `payment_method` and `payment_source` are mandatory in case of systematic [MF purchase plans](https://fintechprimitives.com/docs/api/#create-a-purchase-plan).
- Updates are not allowed for any systematic plans, but you can update systematic MF purchase plans mandate_id (payment\_source). When you update the mandate via FP API, changes will only be reflected in FP and not in BSE. You have to manually update the mandate of SIP in the BSE member portal.

    Follow the below steps to update a mandate

       - Firstly you have to manually update the mandate of SIP in the BSE member portal.

       - Secondly update the same in payment_source attribute of the mf purchase plan with the FP mandate id of new mandate (which you have updated in BSE member portal).
- `auto_generate_installments` cannot be `false` for systematic plans. By default, it is set to `true`.


#### Transitioning of BSE systematic plan from Created to Active

- The plan must be registered at BSE also, only after successful plan registration at BSE, plan transition from created to active.
- If the order gateway is BSE and delayed activation has been requested, the plan activation will happen on or after the date on which activation was requested while creating the plan.
- If generate\_first\_installment\_now = false, then if the installment\_day is given within 7 working days from the plan created\_date, plan will move to state = active on next day of the given installment_day.

For example:

Plan `created_date` = 01/05/2023 and `installment_day` = 4 then plan will move to active state on 05/05/2023 and first installment date would be 04/06/2023.

#### Transitioning of BSE plan from Created to Failed

As seen previously the plan becomes active only if the plan is registered at BSE also. If for some reason, the plan registration at BSE fails, then plan transitions from created to failed state.

Note:

Other states transitioning are same as RTA plans.

#### Cancelling a plan

If mode = systematic, it takes time for a plan to become active. In such cases, if you choose to cancel a plan even before activation, the plan state can have created to cancelled transition. For an active systematic plan, the cancellation happens asynchronously and will take some time.

In the case of MF Purchase plans, the gap is 7 working days i.e. only if you cancel the plan before 7 working days from the date of the next installment, the next installment will not be processed. If not, the next installment will be processed and subsequent installments after that will not be processed.

In the case of MF Redemption plans/ MF Switch plans, the gap is 1 working day.

#### Installment Generation 

The minimum number\_of\_installments must be greater than or equal to the minimum number\_of\_installments expected by that scheme/plan type. For example, in the case of SIPs, number\_of\_installments must be greater than or equal to 6 usually.


In case you have a systematic purchase plan and installment date is a market holiday for example `15 August` then BSE collects payment on August 16th, 2022 (the next working day), and since the definition of the day of installment for MF Purchase Plans is “The day on which the payment collection happens”, the day of an installment is August 16th, 2022. This means that this installment will be available from August 16th, 2022 via FP APIs and not before that.


If the mode is systematic and the plan is a purchase plan, the minimum gap is 7 working days. In other cases, the minimum gap is 1 calendar day

### Examples
| Plan                   | Installment type | Gateway | Frequency | Installment day | Registration date | First installment date |
|------------------------|------------------|---------|-----------|-----------------|-------------------|------------------------|
| Purchase plan          | Systematic       | BSE     | Monthly   | 15              | August 15th, 2022  | September 15th, 2022    |
| Purchase plan          | Systematic       | BSE     | Monthly   | 17              | August 15th, 2022  | September 17th, 2022    |
| Purchase plan          | Non-Systematic           | BSE     | Monthly   | 15              | August 15th, 2022  | September 15th, 2022    |
| Purchase plan          | Non-Systematic           | BSE     | Monthly   | 16              | August 15th, 2022  | August 16th, 2022       |
| Redemption/Switch plan | Systematic            | BSE     | Monthly   | 15              | August 15th. 2022       | September 15th, 2022    |
| Redemption/Switch plan | Systematic              | BSE     | Monthly   | 16              | August 15th, 2022       | August 16th, 2022       |


### Mandates

Below are points to consider while working with BSE mandates

- You have to set `provider_name` to `BSE`.
- You cannot provide postback url in case of BSE [mandates](https://fintechprimitives.com/docs/api/#authorize-a-mandate-enach-and-upi-autopay). 
- BSE mandates will not have value in mandate_token attribute.
- You can cancel a mandate using [Cancel a mandate](https://fintechprimitives.com/docs/api/#cancel-a-mandate) API.


### Payments

For using BSE as [payment](https://fintechprimitives.com/docs/api/#create-a-payment) gateway you have to set `provider_name` to `BSE`.



