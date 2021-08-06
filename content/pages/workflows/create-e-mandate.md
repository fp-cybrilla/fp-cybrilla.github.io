## Create E-mandate
----------------

#### Story -
> As an investor, I want to set up a mandate, So that I can begin a SIP / monthly investment.

|     Steps    |     Method       |    Reference    |
|--------------|------------------|-----------------|
| Fetch bank account ID | GET | [Get Investor Details](https://fintechprimitives.com/api/#get-investor-details) |
| Fetch mandate type and amount | - | From frontend |
| Create a mandate for the investor | POST | [Create Mandate](https://fintechprimitives.com/api/#post-create-mandate) |
| Authenticate the e-mandate | POST | [Authenticate](https://fintechprimitives.com/api/#post-auth-transaction) |
| Create a NACH payment request | POST | `http://endpoint/api/pg/payments/nach`, payload below |

```
{
  "payments": [
    {
      "mandate_id": 1,
      "debit_date": "”,
      "amc_order_id":
    }
  ]
}
```
**OUTPUT** - `200` for success
