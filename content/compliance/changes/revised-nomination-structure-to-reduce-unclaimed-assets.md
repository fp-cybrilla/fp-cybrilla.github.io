---
title: Revised nomination structure to reduce unclaimed assets
---
##  Revised nomination structure to reduce unclaimed assets
#### Collection of additional details for existing nominees

### Communications by SEBI regarding revised nomination structure
- Regulation - [here](https://www.sebi.gov.in/legal/circulars/jan-2025/circular-on-revise-and-revamp-nomination-facilities-in-the-indian-securities-market_90698.html)
- Amendment to the regulation - [here](https://www.sebi.gov.in/legal/circulars/feb-2025/amendments-and-clarifications-to-circular-dated-january-10-2025-on-revise-and-revamp-nomination-facilities-in-the-indian-securities-market_92377.html)

<br>

As per the nominations related changes suggested by SEBI, below is a brief summary of the same -
- Upto 10 nominations can be made for any folio
- Contact details and identity proof to be collected for every nominee
- Investor declaration to display the nomination status in the statement of account
- Video consent by the investor in-case of opting out of nominations

The above changes are planned to go live in 2 phases. **The first phase of these changes are going live on June 1st, 2025.** 

### Highlights of changes that are going live on June 1st, 2025
1. FP will continue to collect 3 nominees as before
2. Contact details (address, phone number, email address) and identity proof of every nominee should be collected
3. If the nominee is a minor, then guardian's contact details (address, phone number, email address) along with the identity proof has to be collected
4. Investor declaration to display the nomination status in the statement of account

### Go live plan at FP
- Sandbox deployment - **23rd May, 2025**
- Production deployment - **1st June, 2025** [subject to deployments at RTA as well]


### Changes for customers who use Investor Profile APIs
**[`/v2/investor_profiles` and associated endpoints]**<br>

1. Refer to [related_party](https://fintechprimitives.com/docs/api/#related-parties) object and associated APIs for the necessary changes to collect additional details of the related party
2. Refer to [mf\_investment\_accounts](https://fintechprimitives.com/docs/api/#mf-investment-accounts).`folio_defaults` hash for the necessary changes to choose the nomination preferences

**Workflow to work with nominees:**<br>
- Create an `investor_profile` for the investor
- Create a `related_party` to store the nominee's information
- Update `mf_investment_accounts.folio_defaults` to set the nomination preferences
- Place the order


### Changes for customers who use Investor APIs 
**[`/api/onb/investors` endpoints]**<br>

1. Refer to [investor](https://fintechprimitives.com/docs/api/#investors-deprecated).`nomination` hash for the necessary changes to collect additional details of the nominee

> NOTE: For customers who are using Investor APIs [`/api/onb/investors` endpoints], there would be no changes in the `mf_investment_account` object.