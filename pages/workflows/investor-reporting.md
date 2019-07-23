
#### Why should I use Reporting APIs?
Reporting API platform is a unified API platform which provides a single interface to access different reports from different RTAs. The platform manages all the report specific and RTA specific idiosyncrasies under the hood so that the API consumers can focus on what matters the most : Reports and data points.

#### What are the data points that the reporting APIs provide?

Reporting API platform provides a transaction summary report [endpoint](https://fintechprimitives.com/api/#get-transaction-report) to access the transactions associated with a folio. If the transaction is a "SELL" type transaction, the associated purchase transactions are also provided so that capital gains can be calculated. Also, every transaction comes with a scheme ISIN. To do more scheme related filtering and segmentation like segmenting by plan type and segmenting by fund category, you can use the scheme ISIN provided with each transaction and Fund Details master data endpoint .

Consider the following set of transactions.

| Transaction number | Date | Type | Units | NAV | Price | Source |
| ---------- | ------------ |------------ |------------ |------------ |------------ |------------ |
|T1|01/02/2019|	Purchase |	100	|10|1000||
|T2|02/02/2019|	Purchase |	100 |12 |1200||
|T3|03/02/2019|	Redemption |150|15|2250|T1,T2|
|T4|04/02/2019|	Bonus |	50|15|750||
|T5|05/02/2019|	Dividend Reinvestment|50|15|750||
|T6|06/02/2019|	Switch Out |100|18|900|T2,T4|

The table below explains the different data points that can be generated from the transactions report.

| Data points | Description | How to get this data point? | Example |
| ---------- | ------------ |------------ |------------ |
| **Holdings** |
| Scheme holdings units | Number of units customer is holding | 1. Iterate through each transaction <br><br>2. If transaction type is Purchase, Switch In, Transfer In, Bonus or Dividend Reinvestment, add units.<br><br>3. If transaction type is Redemption, Switch Out or Transfer out, subtract units.|Holding units = 100+100-150+50+50-100 = 50|                                                  
| Scheme holdings redeemable units | Number of units available for redemption. Eg for ELSS funds there is lock in of 3 years, hence units which have not completed 3 Years are not available for redemption |1. Iterate through each transaction <br><br>2. If transaction type is Purchase, Switch In, Transfer In, Bonus or Dividend Reinvestment AND if there is no lockin,<br><br> total_redeemable_units=total_reedemable_units+transaction_units.<br><br>3. If transaction type is Redemption, Switch Out or Transfer out, <br><br>total_reedemable_units= total_reedemable_units - transaction_units.<br><br>Note: To check whether there is a lockin, use the scheme ISIN to fetch the details of the scheme from Funds Details master end point and add the lockin period to purchase date.|In this case, all the scheme holding units will be redeemable. So redeemable units = 50|
| Market value of current investment | The market value of the units as per last available NAV | 1. Calculate the scheme holdings units as previously explained.<br><br>2. Multiply the units by current NAV. |Assuming current NAV = 18, Market value = 50 * 18 = 900|
| Market value redeemable amount | The market value of the redeemable units as per last available NAV | 1. Calculate the scheme reedemable units as previously explained.<br><br>2. Multiply the units by current NAV. |Assuming current NAV = 18, Market value = 50 * 18 = 900|
| Invested value amount | Holding cost as on report date | 1. Iterate through each transaction <br><br>2. If transaction type is Purchase, add amount<br><br>3.If transaction type is a sell type transaction, subtract the cost of purchases related to the transaction |Consider T3,<br>150 units have been redeemed.<b3>Out of 150 units, 100 units were sourced from T1<br>50 units were sourced from T2.<br>As of 03/02/2019, Holding cost would be<br>1000(T1)+1200(T2)-1000-50*12 = 600|
| Payout amount | Dividend payout till date incase if holding is in dividend payout fund | 1. Filter the transactions by type = Dividend Payout.<br><br>2.Iterate through each transaction and add transaction amount.|Dividend Payout amount would be 0 as there are no payout transactions.|
| NAV | Total cost per unit | Total cost of units being held by the investor / Scheme holding units.|After T1, Total cost = 1000<br>After T2, Total cost = 1000+1200=2200<br>After T3, Total cost = 50*12 = 600 because, investor has sold 150 units and he has 50 units brought at NAV=12.<br>After T4, Total cost = 600. Investor has not spent money to aquire bonus units.<br>After T5, Total cost = 600. Investor has not spent money to aquire extra units.<br>After T6, Total cost = 600.<br> Average NAV = 600/50 = 12|
| Unrealized gains | Potential gain/loss amount from the investment |Market value amount - Total cost of the current investment. Total cost can be calculated as explained earlier.|50* 18(current NAV) - 50*12 = 300|
| **Redemption details** | | ||
| Redemption date | Date at which units are redeemed | Provided with transaction.|See dates of T3 and T6 |
| Redemption units | Number of units redeemed | Provided with transaction.| See units of T3 and T6 |
| Purchase price | Price at which redeemed units were bought |Provided with transaction.| See prices of source transactions of T3 and T6 |
| Purchase date | Date at which redeemed units were bought |Provided with transaction.|See dates of source transactions of T3 and T6 |
| Cost | Total cost value of the units |1.Iterate through the purchase sources of a redemption transactions which are provided with every transaction.<br><br>.2. For each purchase add amount| Consider T3,<br> Cost = 100 * 10 + 50 * 12 = 1600| 
| Average cost | Average Price at which units were bought |1.Iterate through the purchase sources of a redemption transactions which are provided with every transaction.<br><br>.2.Sum = Sum + Purchase cost.<br><br> 3. Average cost = Sum/Redeemed units|Average cost = 1600/150 = 10.67|
| Realized gains | Total Gains/Loss due to selling of holdings |1.Iterate through the purchase sources of a redemption transactions which are provided with every transaction.<br><br>.2.Sum = Sum + Purchase cost.<br><br> 3. Realized gains = Redeemed units * Redeem NAV - Sum|Gains = 2250-1600 = 650|
| Sale price | Price at which units were redeemed |Provided with transaction.|See prices of T3 and T6|


#### What kinds of reports can I get?
| Report | Description |
| ---------- | ------------ |
| [Transaction summary report](https://fintechprimitives.com/api/#get-transaction-report) | This is the most important report from which data points of all the other reports can be derived. Transactions associated with a folio can be accessed. |
| [Holdings report](https://fintechprimitives.com/api/#get-holding-report) | Get details about current holdings of a folio|
| [Capital gains report](https://fintechprimitives.com/api/#get-capital-gain-report) | Get the details about capital gains/loss incurred by an investor |

 Additional reports like the following can be generated using the data points in the transaction summary report.

| Additonal Reports |
| ----------------- |
| Segmentation of holdings by asset class |
| Segmentation of underlying holdings (by stocks) |
| Profit/Loss Statement | 



#### What are the different cases supported by the reporting engine?

The reporting engine incorporates rules for handling the below cases - 
- Scheme mergers: The impact of mutual fund scheme categorizations has been built into reports like holdings and capital gains.
- Folio consolidation: If the user decides to merge transactions of all folios into a single folio for a particular scheme.
- Transfer in/Transfer out: If the user changes his/her broker.
- Migration of exsiting folios: Upload of investor data and transaction data; reconcilliation and then generation of data points to ensure updated data is available.


#### Sequence of APIs for integration?

**Step 1** - <br>The reporting engine supports the following different reverse feeds. 
An API to upload reverse feed API can be used for the same.

- Karvy: MFSD 201 without split
- CAMS: WBR2
- Franklin: MTFP (my transactions for period)
- Sundaram: ER02

**Step 2** - <br>Once the source data (from the RTA) has been uploaded, the reporting engine generates the data points that can be used for different types of reports.
Eg - The [holdings API](https://fintechprimitives.com/api/#get-holding-report) can be called to fetch the Portfolio holdings report.



