#### What are the data points that the reporting APIs provide?

The below data points can be fetched per folio number or per investment account respectively.

| Data points | Description |
| ---------- | ------------ |
| **Scheme Details** |
| Scheme ISIN | Unique no to identify Fund |
| Scheme name | Fund Name |
| Scheme type | Plan Type(Growth/Dividend reinvestment/Payout) |
| **Holdings** |
| Scheme holdings units | No of units cutomer is holding as on date passed in "scheme holdings as on" |
| Scheme holdings redeemable units | No of units available for redemption as on date. Eg for ELSS funds there is lock in of 3 years,hence units which have not completed 3 Years are not available for redemption |
| Market value amount | Units * Last available NAV |
| Market value redeemable amount | scheme holdings redeemable units * Last available NAV |
| Invested value amount | Holding cost as on report date |
| Payout amount | Dividend payout till date incase if holding is in dividend payout fund |
| NAV | Per unit price |
| Unrealized gains | Gains/loss of balance units |
| **Redemption details** | |
| Redemption date | Date at which units are redeemed |
| Redemption units | No of units redeemed |
| Purchase price | Price at which redeemed units were bought |
| Purchase date | Date at which redeemed units were bought |
| Cost | Total cost value(Units*Avg cost) |
| Average cost | Average Price at which units were bought |
| Realized gains | Total Gains/Loss due to selling of holdings |
| Sale price | Price at which units were redeemed |

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
Eg - The [holdings API](https://fintechprimitives.com/api/#get-investment-account-holdings) can be called to fetch the Portfolio holdings report.

#### What are the different types of reports that can be generated using the above data points?

We currently provide two pre built reports through simple APIs.

| Reports |
| ------- |
| [Portfolio Holdings](https://fintechprimitives.com/api/#get-investment-account-holdings) |
| [Capital Gains](https://fintechprimitives.com/api/#get-capital-gain-report) |

Additional reports like the following can be generated using the above data points.

| Additonal Reports |
| ----------------- |
| Segmentation of holdings by asset class |
| Segmentation of underlying holdings (by stocks) |
| Profit/Loss Statement | 