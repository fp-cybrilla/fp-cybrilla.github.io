# Release notes

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