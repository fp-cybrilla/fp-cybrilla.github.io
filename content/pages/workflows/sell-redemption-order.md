## Sell / Redemption Order
----------------

|     Steps    |     Method       |    Reference    |
|--------------|------------------|-----------------|
| Fetch Folio number | GET | [Get investment holdings](https://fintechprimitives.com/api/#get-investment-account-holdings) |
| Fetch ISIN | GET | [Get Fund Schemes](https://fintechprimitives.com/api/#get-fund-schemes) |
| Fetch type (amount / units) | - | From Front-end |
| Create a sell order | POST | [Create Sell Order](https://fintechprimitives.com/api/#post-create-sell-order) |
