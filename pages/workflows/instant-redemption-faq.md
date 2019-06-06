#### Which AMCs have been aggregated through the API?

| AMC | Available |
|-----|-----------|
| ICICI | Yes |
| Reliance | Yes |
| Aditya Birla | Yes |
| Axis | Under testing |
| Kotak | Under testing |
| Edelweiss | In the roadmap |

#### Order states in happy flow
- Pending (initial state)
- Submitted (should come after approx 30 secs) / Failed
- Successful / Failed (will receive this state in production)

#### Test data
| Parameter | Details |
|-----------|---------|
| ISIN | INF109K01VF4 (for ICICI) |
| ISIN | INF204K01UN9 (for Reliance) |
| ISIN | INF209K01RU9 (for Aditya Birla) |
| Folio Number | 427355 (for ICICI) |
| Folio Number | EF71JK1XQYFTHZH4 (for Reliance)|
| Folio Number | MRVYOW7BJ4UKENKE (for Aditya Birla) |
| Investment Account | 97 (If tenant is Prueba) |
| Amount | Should be a multiple of 1. <br> Max can be 90% of the invested amount or 50,000 (whichever is lower) |


