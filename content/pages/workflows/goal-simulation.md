## Goal Simulation
----------------

#### Story -
> As an investor, I want to be able to check goal requirements, so that I can begin an investment respectively for the same.


|     Steps    |     Method       |    Reference    |
|--------------|------------------|-----------------|
| Goal value and period | - | From Front-end |
| Fetch ISIN | GET | [Get Fund Schemes](https://fintechprimitives.com/api/#get-fund-schemes) |
| Fetch type (amount / units) | - | From Front-end |
| Create a sell order | POST | [Create Sell Order](https://fintechprimitives.com/api/#post-create-sell-order) |
