## Test Data
-------------------------
 <b>Note</b> - The below data is applicable to the public shared sandbox only.

#### Orders
<p><b>Sample bank codes:</b> ICIC, FDRL<br>
<b>ISIN:</b> INF204K01EF9, INF084M01AB8, INF090I01CN4<br>
<b>Investment account ID:</b> 18</p>

#### Check KYC status

| PANs | Status |
| ---- | ------ |
| AACPA0404A, AACPA0404C | Will return true | 
| XXXPX3751X | Any pan number that matches XXXPX3751X will return status as true with the name as “Tony Soprano” (X can be any alphabet) |
| XXXPX3752X |Any pan number that matches XXXPX3752X will return status as false with the name as “Junior Soprano” with investment_limit of 50000 (X can be any alphabet) | 
| Any other PAN number | Will return false |


#### Instant Redemption

| AMC | Parameter | Details |
| --- |-----------|---------|
| ICICI | ISIN | INF109K01VF4 |
| | Folio Number | 427355 |
| Reliance | ISIN | INF204K01UN9 |
| | Folio Number | EF71JK1XQYFTHZH4 |
| Aditya Birla | ISIN | INF209K01RU9 |
| | Folio Number | MRVYOW7BJ4UKENKE |

<p><b>Investment Account:</b> 97<br>
<b>Amount:</b> Should be a multiple of 1. Max can be 90% of the invested amount or 50,000 (whichever is lower)</p>
