## Migrating from Channel Partner route (RTA) to Cybrilla OPAT (ONDC) route.
Note: RTA route is no longer supported. There will be no feature developement on RTA route. In view of this development, this guide will help RTA customers to migrate to ONDC route. 

#### 1. Investor Onboarding
Similar to RTA route, before an order can be placed or a plan can be created, investor must be onboarded and investment account must be created. However, one subtle difference to be noted here is that in Channel Partner route(RTA route), as a distributor or advisor you might be verifying PAN, Name, DOB, KYC Status checks and bank accounts by yourself or using specific FP APIs for the same. However, in case of Cybrilla OPAT (ONDC route), you must use [Pre verification APIs](https://poa.cybrilla.com/docs/additional-apis/pre-verifications) to do the same.

If the investor is not KYC Compliant, as usual, you will have to ensure that investor becomes KYC Compliant before investment can be accepted. You can continue to use existing mechanism to ensure KYC Compliance. However, we recommend using [KYC Forms](https://poa.cybrilla.com/docs/additional-apis/kyc-forms) which allows both new KYC and KYC Modification for your investors.

#### 2. Mandate Authorization
If you choose to avail Cybrilla OPAT's mandate facility, you can authorize the mandate independently as part of onboarding or as part of SIP journey. Before the mandate is authorized, please ensure that email address, mobile number and bank account details are collected and associated with the investor. 
For more details, please refer to [Create Mandate](https://fintechprimitives.com/docs/api/#create-a-mandate-enach-amp-upi-autopay) and [Authorize Mandate](https://fintechprimitives.com/docs/api/#authorize-a-mandate-enach-and-upi-autopay) APIs. 

#### 3. Tenant Setup
You can simultaneously place RTA orders and ONDC orders in the same tenant. No new tenant setup is required. To place orders/plans for investors for whom investor profile/investment account was created earlier(for RTA order/plan routing purposes), ensure that the `nature` attribute in address is updated. No other change is required. While placing the orders, you will have to explicitly specify gateway as `ondc`

#### 4. Orders and Payments
1. To get an overview of orders and payments flow please refer to this [documentation](https://docs.fintechprimitives.com/fp-cybrillapoa-gateway/overview/)
2. For customizing payments, please refer to this [documentation](https://docs.fintechprimitives.com/fp-cybrillapoa-gateway/custom-checkout)
3. For payment retries please refer to this [documentation](https://docs.fintechprimitives.com/fp-cybrillapoa-gateway/payment-retry)

#### 5. Capabilities
To understand the capabilities of FP-Cybrilla POA, please refer to this [documentation](https://docs.fintechprimitives.com/fp-cybrillapoa-gateway/capabilities)

#### 6. Going Live 
Please refer to [Going Live](https://docs.fintechprimitives.com/fp-cybrillapoa-gateway/going-live/) article for more details.