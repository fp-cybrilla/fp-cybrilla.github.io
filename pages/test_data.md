## Test Data (for shared sandbox)
-------------------------

<p><b>Sample bank codes:</b> ICIC and FDRL</p>


<p><b>ISIN:</b> INF204K01EF9, INF084M01AB8 and INF090I01CN4</p>

<p><b>Investment account ID:</b> 18</p>

<p><b>PANs</b></p>

| PANs | Status |
| ---- | ------ |
| AACPA0404A, AACPA0404C | Will return true | 
| XXXPX3751X | Any pan number that matches XXXPX3751X will return status as true with the name as “Tony Soprano” (X can be any alphabet) |
| XXXPX3752X |Any pan number that matches XXXPX3752X will return status as false with the name as “Junior Soprano” with investment_limit of 50000 (X can be any alphabet) | 
| Any other PAN number | Will return false |