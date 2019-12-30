#### Which AMCs have been aggregated through the API?

| AMC | Available |
|-----|-----------|
| ICICI | Yes |
| Reliance | Yes |
| Aditya Birla | Yes |
| Axis | Yes |
| Kotak | Under testing |
| DSP | On the roadmap |

#### Order states in happy flow
- Pending (initial state)
- Submitted (should come after approx 30 secs) / Failed
- Successful / Failed (will receive this state in production)

#### Test data

| AMC | Parameter | Details |
| --- |-----------|---------|
| ICICI | ISIN | INF109K01VF4 |
| | Folio Number | 427355 |
| Reliance | ISIN | INF204K01UN9 |
| | Folio Number | EF71JK1XQYFTHZH4 |
| Aditya Birla | ISIN | INF209K01RU9 |
| | Folio Number | MRVYOW7BJ4UKENKE |

<p><b>Investment Account:</b> 97 (If tenant is Prueba)</p>
<p><b>Amount:</b> Should be a multiple of 1. Max can be 90% of the invested amount or 50,000 (whichever is lower)</p>


