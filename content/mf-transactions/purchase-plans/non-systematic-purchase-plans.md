---
title: Create a Non-Systematic Purchase Plan
---
> The use case explained here is implemented via APIs which are in Early Access stage. Although there will be no major changes, we might expect some minor changes in the API based on client feedback.

#### 1. Create a Non-Systematic Purchase Plan
To create a non-systematic purchase plan, create a purchase plan and set `systematic` = false. 
Refer [FPDocs, Create a Purchase Plan](https://fintechprimitives.com/docs/api/#create-a-purchase-plan)

#### 2. Fetch Installments of the Plan
Once you have registered a plan, the installments will be generated according to the plan's schedule. On or after the day of installment, each installment will be available for access via FP APIs. For more details on when the installments are generated, please refer to this [API doc](https://fintechprimitives.com/docs/api/#installment-generation). If you want to let your investors track the installments of the plan, you can fetch the installments of the plan using the [FPDocs, fetch installments](https://fintechprimitives.com/docs/api/#list-all-mf-purchases). 
Example: `GET /v2/mf_purchases?plan=mfpp_dbabb25ba34c48329dbfbeff70c846f0`

#### 3. Collect User Consent for Every Installment of the Plan
As per [SEBI regulations](https://www.sebi.gov.in/legal/circulars/sep-2022/two-factor-authentication-for-transactions-in-units-of-mutual-funds_63557.html), investor consent must be obtained before an order can be submitted -
1. Before the order is sent to RTAs, investor consent must be obtained by sending a One-Time Password to the investor at his/her email/phone number -
  * In case of order placed against an existing folio the consent should be taken from the email/mobile registered against the existing folio.
  * In case of an order placed placed without a folio, the consent should be taken from the email/mobile available in the  [Investor Object](https://fintechprimitives.com/docs/api/#investors) or [Investor Profile](https://fintechprimitives.com/docs/api/#investor-profile-object).
2. Before the order is sent to BSE, investor consent must be obtained by sending a One-Time Password to the investor at his/her email/phone number -
  * In case of order placed against an existing folio the consent should be taken from the email/mobile registered against the existing folio.
  * In case of order placed without folio the consent should be taken from the email/mobile registered against the UCC.

Since a non-systematic plan comprises of a series of lumpsum purchase orders, investor consent must be collected for each installment of a non-systematic plan before payment is initiated.

#### 4. Track the plan installments
FP uses [`MF Purchase`](https://fintechprimitives.com/docs/api/#mf-purchase-object) object to represent the sip installment. You can track the state of the [`MF Purchase`](https://fintechprimitives.com/docs/api/#mf-purchase-object) representation of the installment to know the status of your installment.
