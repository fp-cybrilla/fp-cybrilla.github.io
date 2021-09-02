---
title: Usage
---
## How do I get started?

**Step 1 : Upload reverse feed** 
Before accessing the transactions, reverse feeds obtained from the RTAs must be uploaded to populate transactions via Files API. The reporting engine supports the following different reverse feeds. 

- Karvy: MFSD 201 without split
- CAMS: WBR2
- Franklin: MTFP (my transactions for period)
- Sundaram: ER02

Please note down the file id of the uploaded file.

**Step 2 : Create a file operation**  
Use FileOperation API Create a `transaction_processing` file operation with file id of the reverse feed.

**Step 3 : Check the status of the file operation**  
Use the FileOperation API check the status and ensure that transaction processing is successful.

**Step 4 : Get the list of transactions**  
Use [FPDocs, transactions API](https://fintechprimitives.com/api/#transactions) to get the list of transactions associated with a folio.

## How do I get the data points?
Note 1: This section explains ways to get different data points. All the data points mentioned in this section are obtained/generated from the transactions response from the [FPDocs, transactions API](https://fintechprimitives.com/api/#transactions) . Please make yourself familiar with the object structure of the transactions as these fields are used extensively to generate the required data points.

Note 2:  Transaction object has `isin` field to indicate the scheme associated with the transaction. However, calculation of some data points requires more scheme related info. In such cases, the idea is to use the `isin` associated with transaction to fetch the scheme details using [FPDocs, Fund schemes API](https://fintechprimitives.com/api/#get-fund-schemes) to facilitate calculation of data points.

Note 3 : When a transaction results in the decrease in number of units because of an action initiated by the investor,  we need to figure out the units that need to be considered for decreasing. To aid this process, we use FIFO logic.  For example, if an investor purchases 100 units on **1st Jan 2019** and another 100 units on **2nd Jan 2019** and redeems 150 units on **3rd Jan 2019**, then we have to decrease 150 units from the 200 purchased units. Using FIFO logic, we reduce 100 units purchased on **1st Jan 2019** and 50 units purchased on **2nd Jan 2019**.  So we can say that the redemption of 150 units were **"sourced"** from transactions that happened on **1st Jan 2019** and **2nd Jan 2019** respectively. In such cases,  the `sources` attribute contain information about transactions from which this particular transaction in question is **sourced** from.

Note 4 : Each purchase source in `sources` will contain `days_held` and `gain` attribute. Use the value of `days_held` field to get the holding period in days and to determine whether a particular `gain` is a short term gain or a long term gain.

| Type of mutual fund | Holding period | Gain type|
| ---------- | ------------ |------------ |
|Equity mutual funds| < 12 months | Short term gain |
|Equity mutual funds| > 12 months | Long term gain |
|Debt mutual funds| < 36 months | Short term gain |
|Debt mutual funds| > 36 months | Long term gain |

### Data points which do not require explicit calculation.
| Data point | Description |
| ---------- | ------------ |
|Redemption date|See `traded_on` field of transactions with type = `redemption`|
|Redemption units|See `units` field of transactions with type = `redemption`|
|Purchase date|See `purchased_on` field in the list of `sources` for the "sell" type transactions.|
|Sale price |See `amount` field of transactions with type = `redemption`|

### Data points which must be calculated.
To understand how other data points can be calculated, consider the following example.

| Transaction Id | `traded_on` | `type` | `units` | `traded_at` | `amount` | `sources` |
| ---------- | ------------ |------------ |------------ |------------ |------------ |------------ |
|T1|01/02/2019|	`purchase` |	100	|10|1000||
|T2|02/02/2019|	`purchase` |	100 |12 |1200||
|T3|03/02/2019|	`redemption` |150|15|2250|[T1, T2]|

The following table describes the way to calculate each one of the data points.

| Data point | How to get this data point? |
| ---------- | ------------ |
| **Redemption details** | |
|Realized gains|Sum of `gain` of all purchase `sources` of a transaction.<br><br>Example:<br>Realized gains = 500+150 = Rs 650.|
| Cost | Cost = Redemption `amount` - Realized gains.<br><br>Example:<br>Cost = 2250 - (500+150) = Rs. 1600.|
|Average cost|Average cost = Cost/Redeemed units<br>Average cost = 1600/150 = 10.67|
| **Holdings** |
| Scheme holdings units | 1. Iterate through each transaction <br><br>2. If transaction `type` is `purchase`, `switch_in`, `transfer_in`, `bonus` or `dividend_reinvestment`, add units.<br><br>3. If transaction `type` is `redemption`, `switch_out` or `transfer_out`, subtract units.<br><br>Example:<br>Holding units = 100+100-150 = 50|
| Scheme holdings redeemable units | Scheme holdings units - Locked units.<br><br> To calculate the locked units, go through each transaction of `type` `purchase`, `switch_in`, `transfer_in`, `bonus` and `dividend_reinvestment` and add the units of such transactions if there is a lockin.<br><br>Example:<br>Assuming that there is no lockin, redeemable units = 100+100-150 = 50<br><br>Note 1: To check whether there is a lockin, use the scheme `isin` to fetch the details of the scheme from [Fund Schemes API](https://fintechprimitives.com/api/#get-fund-schemes) and add the `lockin` period to purchase date to see whether there is a lockin.<br><br>Note 2: If the investor has placed a request to redeem and the request is yet to be processed by AMC, the reverse feed will not have the redemption transaction. In such cases, you may have to manually decrease the redeemable units to accommodate the redemption request in the pipeline.|
| Market value of current investment |1. Calculate the scheme holdings units as previously explained.<br><br>2. Multiply the units by current NAV.<br><br>Example:<br>Assuming current NAV = 18, Market value = 50 * 18 = Rs. 900/-|
| Market value redeemable amount |1. Calculate the scheme reedemable units as previously explained.<br><br>2. Multiply the units by current NAV.<br><br>Example:<br>Assuming current NAV = 18, Market value = 50 * 18 = Rs. 900/-|
| Invested value amount | Let invested\_value = 0<br><br> 1. Iterate through each transaction <br><br>2. If transaction `type` is `purchase` or `switch_in`, <br>invested\_value = invested\_value+`amount`<br><br>3.If transaction `type` is `redemption` or `switch_out`, <br>invested\_value = invested\_value - cost of sources.<br><br>Note: Please refer "Cost" calculation described in "Redemption details" section to calculate  the cost of the sources. <br><br>Example:<br>After T1, invested\_value would be 100 * 10 = Rs.1000<br>After T2, invested\_value would be Rs. 1000+ 100*12 = Rs.2200<br>After T3, invested\_value would be Rs2200- total cost of purchases.<br>Total cost of purchases = 1000+600 = Rs. 1600. (Please refer Cost section example)<br>After T3, invested\_value would be Rs 2200 - 1600 = Rs. 600 |
| Payout amount | 1. Filter the transactions by `type` = `dividend_payout`.<br><br>2.Iterate through each transaction and add transaction `amount`.|
| Average NAV | Total cost of units being held by the investor / Scheme holding units. How to calculate the total cost of units held by the investor has been explained previously.<br><br>Example:<br> Please see the example of "Invested value amount". From this example, total cost = Rs 600.<br>Holding units = 50<br>Average NAV = 600/50 = 12.00|
| Unrealized gains | Market value amount - Total cost of the current investment. Total cost can be calculated as explained earlier.<br><br>Example:<br>Assuming current NAV = 18.00<br>50* 18 - 50*12 = 300|
