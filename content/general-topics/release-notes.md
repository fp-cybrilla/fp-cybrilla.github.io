# Release notes

## Upcoming Releases
#### Available in Sandbox
* We have now provided the ability for the investor to invest in schemes which require transactions on a daily, weekly or a fortnightly basis. For more info, please check the [documentation](https://fintechprimitives.com/docs/api/#managing-recurrence-of-a-plan)

* You can now update the no. of installments and installment day for a non-systematic plan. Frequencies supported are `daily`, `twice_a_month`, `day_in_a_fortnight`,`four_times_a_month`,`day_in_a_week`,`monthly`,`quarterly`, `half_yearly` and `yearly`. Please refer the [documentation](https://fintechprimitives.com/docs/api/#update-a-purchase-plan) for more info.



## Previous Releases (Live)

## February 2023
#### 2nd February 2023
* You can now update the installment amount for a systematic/non-systematic plan in RTA. Frequencies supported are `monthly`, `quarterly`, `half_yearly` and `yearly`. For more info, please read the [documentation](https://fintechprimitives.com/docs/api/#update-a-purchase-plan)

## July 2022
#### 14th July 2022
* You can now see the non-compliance reason and action required to ensure compliance when you check KYC status. For more info, please read the [documentation](/identity/kyc-check/)  
`kyc`
* Fixed a bug due to which the second installments of RTA SIPs were being incorrectly reported to RTAs in cases of SIPs that were created with flag `generate_first_installment_now`:`true`  
`sip`
* Updated order reconciliation logic to support order reconciliation for CAMS serviced AMC customers.  
`cams`,`amc`,`orders`
* You can now cancel Razorpay e-mandates. For more information please read this [documentation](https://fintechprimitives.com/docs/api/#cancel-a-mandate)


#### 8th July 2022
* Fixed an issue which was causing BSE redemption orders to fail due to bank account validation issues.  
`redemption`,`bse`

#### 7th July 2022
* [Search investors by guardian PAN](https://fintechprimitives.com/docs/api/#search-investors)  
`investor`,`guardian`

#### 6th July 2022
* Investor consent information is now mandatory for redemption/switch orders processed via BSE order gateway.  
`redemption`, `switch`


## June 2022
#### 30th June 2022
* FP now automatically reports the primary bank account as the redemption bank account while placing redemption orders via BSE.  
`redemption`,`bse`
* You can now report investor consent information while confirming a BSE redemption order.  
`redemption`,`bse`

#### 15th June 2022
* Add checks to avoid duplicate Razorpay NACH payment creation in cases where Razorpay payment creation response is inconclusive.  
`payments`,`nach`


#### 4th June 2022
* [V2 Bank account APIs](https://fintechprimitives.com/docs/api/#bank-accounts-early-access)

#### 1st June 2022
* Investor consent information is now mandatory for redemption/switch orders processed via RTA order gateway.  
`redemption`, `switch`

## May 2022
#### 31st May 2022
* While authorizing Razorpay e-mandates, we now send bank account details to ensure that the mandate can be only authorized via investor's bank account.  
`e-mandates`, `razorpay`

#### 30th May 2022
* Report the email address and mobile number  used for 2FA before redemption/switches.  
Related API documentation:  
1.[Confirm V2 Redemption orders](https://fintechprimitives.com/docs/api/#update-a-mf-redemption)  
2.[Confirm V2 Switch orders](https://fintechprimitives.com/docs/api/#update-a-mf-switch)  
3.[Create Sell order - V1](https://fintechprimitives.com/api/#create-a-sell-order)  
`redemption`, `switch`

* Channel partners can now import investor master reports from RTAs and access demographic information stored against the folios via [List folios](https://fintechprimitives.com/docs/api/#fetch-all-folios)  
`folios`, `migration`

#### 9th May 2022
* `mf_switch` attribute name changed from `distributor_id` to `partner`  
`switch`

#### 4th May 2022
* Investor mobile number validation updated .For more details please refer to [API documentation](https://fintechprimitives.com/docs/api/#create-a-mf-investment-account)  
`investment account`, `validations`

#### 2nd May 2022
* Investor name,nominee name, guardian name validations update.For more details please refer to [API documentation](https://fintechprimitives.com/docs/api/#create-a-mf-investment-account)  
`investment account`, `validations`

* We are now reporting Mutual fund purchase details of orders whose payments are made via Razorpay to Razorpay so that Razorpay can send credit MIS reports to AMCs.  
`payments`, `razorpay`, `operations`

*  Purchase plans are now visible on dashboard.  
`dashboard`,`purchase plans`
