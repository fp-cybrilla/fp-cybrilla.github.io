## Create a Mandate
----------------

#### Story -
> As an investor, I want to set up a mandate, So that I can begin a SIP / monthly investment.

|     Steps    |     Method       |    Reference    |
|--------------|------------------|-----------------|
| Fetch bank account ID | GET | [Get Investor Details](https://fintechprimitives.com/api/#get-investor-details) |
| Fetch mandate type and amount | - | From frontend |
| Create a mandate for the investor | POST | [Create Mandate](https://fintechprimitives.com/api/#post-create-mandate) |
