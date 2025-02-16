---
title: Overview
---
## Investor Reporting
#### Generate summarized and detailed reports for your investors

Reporting API platform is a unified API platform which provides a single interface to access different reports from different RTAs. The platform manages all the report specific and RTA specific idiosyncrasies under the hood so that the API consumers can focus on what matters the most : Reports and data points.

#### What kinds of reports can I get?
| Report | Description |
| ---------- | ------------ |
| [newwindow,Transactions](https://fintechprimitives.com/api/#transactions) | Generates a list of transactions per folio per scheme(isin), sorted by descending order of purchase date.|
| [newwindow,Holdings report](https://fintechprimitives.com/docs/api/#generate-holdings-report) | Generates a holdings report for an investment account or a set of folio numbers.|
| [newwindow,Capital gains report](https://fintechprimitives.com/docs/api/#capital-gains-report) | Generates capital gains report for a given investment account or a set of folio numbers. You can generate capital gains for a specified interval or overall capital gains.|
| [newwindow,Scheme wise returns report](https://fintechprimitives.com/docs/api/#scheme-wise-returns) | Generates scheme wise returns report for a given investment account. Returns from the same scheme under different folios are consolidated and reported as a single report.|
| [newwindow,Investment account wise returns report](https://fintechprimitives.com/docs/api/#investment-account-wise-returns) | Generates investment account wise returns report for an investment account. Returns from all schemes are consolidated under a single report for a given investment account.|
| [newwindow,Transaction type wise amount summary report](https://fintechprimitives.com/docs/api/#transaction-type-wise-amount-summary-report) | It groups the transactions by their type and provides the consolidated amount against each transaction type. You can filter the transactions using ARN code or RIA code which appears in the transaction.|
| [newwindow,Fund scheme category wise AUM summary report](https://fintechprimitives.com/docs/api/#fund-scheme-category-wise-aum-summary-report) | It groups the transactions and provides the AUM for each fund category. You can filter the transactions using ARN code or RIA code which appears in the transaction.|
| [newwindow,Transaction list report](https://fintechprimitives.com/docs/api/#transaction-list-report) | Generates the list of all transactions.  You can filter the transaction list by folio number, PAN or primary investor name.|
| [newwindow,Investor list report](https://fintechprimitives.com/docs/api/#investor-list-report) | Generates the list of all the investors. You can filter the investor list report using ARN code or RIA code. <br>**Note**: This report is available only to a select set of customers whose folio demographic information has been migrated.|
| [newwindow,MF Purchase list report](https://fintechprimitives.com/docs/api/#mf-purchase-list-report) | Generates list of all the MF purchases made. You can filter MF purchase list by giving mf purchase ids, order states like `pending`,`confirmed`,`successful`,`failure` etc.|
| [newwindow,MF Redemption list report](https://fintechprimitives.com/docs/api/#mf-redemption-list-report) | Generates list of all the MF redemptions made. You can filter MF redemption list by giving mf redemption ids, order states like `pending`,`confirmed`,`successful`,`failure` etc.|




#### What kinds of transactions are supported?
At present, the reporting engine supports the following types of transactions.

| Transaction type | Description | Effect on Units | Capital gains? |
|------------ |------------ |------------ |------------ |
|`purchase`|All "purchase" type transactions like fresh purchase, additional purchase, systematic investments etc.|Increase|No|
|`redemption`|All "sell" type transactions like partial redemption, full redemption, systematic withdrawal etc.|Decrease|Yes*|
|`switch_in`| Switch in to the destination scheme.|Increase|No|
|`switch_out`| Switch out from the scheme|Decrease|Yes*|
|`transfer_in`| Transfer in |Increase|No|
|`transfer_out`|Transfer out|Increase|Yes*|
|`dividend_payout`|Dividend payout received by the investor|No change|No|
|`dividend_reinvestment`|Dividend earned has been reinvested in the scheme.|Increase|No|
|`bonus`|Bonus units have been awarded to the investor.|Increase|No|

\* Capital gains will not be calculated for transactions resulting from corporate actions.

#### What are the data points that the reporting APIs provide?
The table below explains the different data points which can be generated from the transaction list obtained via [FPDocs, transactions](https://fintechprimitives.com/api/#transactions). To view the detailed explanation on how to calculate the values of these data points from transactions, please see the [Usage](/pages/workflows/investor-reporting-usage) section.

| Data points | Description |
| ---------- | ------------ |
| **Holdings** |
| Scheme holdings units | Number of units being held by the customer as of now. |
| Scheme holdings redeemable units | Number of units available for redemption. For example, ELSS funds have a lock in of 3 years. Hence, the units which have not completed 3 Years are not available for redemption.| 
| Market value of current investment | The market value of the units held(includes both redeemable and non-redeemable units) by the investor as per the last available NAV | 
| Market value redeemable amount | The market value of the redeemable units as per last available NAV | 
| Invested value amount | Total value of amount invested by the investor in a particular scheme. |
| Payout amount | Total dividend payout received by the investor. |
| Average NAV | Total cost per unit |
| Unrealized gains | Potential gain/loss amount from the investment |
| **Redemption details** | |
| Redemption date | Date on which units were redeemed. 
| Redemption units | Number of units redeemed.|
| Purchase date | Date on which the redeemed units were bought.|
| Cost | Total cost value of the units.|
| Average cost | Average price at which units were bought.|
| Realized gains | Total Gains/Loss due to selling of holdings.|
| Sale price | Price at which units were redeemed |

#### What are the different cases supported by the reporting engine?

The reporting engine incorporates rules for handling the below cases - 
- Scheme mergers: The impact of mutual fund scheme categorizations has been built into reports like holdings and capital gains.
- Folio consolidation: If the user decides to merge transactions of all folios into a single folio for a particular scheme.
- Transfer in/Transfer out: If the user changes his/her broker.
- Migration of exsiting folios: Upload of investor data and transaction data; reconcilliation and then generation of data points to ensure updated data is available.
