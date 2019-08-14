## Create SIP Order
----------------

|     Steps    |     Method       |    Reference    |
|--------------|------------------|-----------------|
| Check if mandate has been approved | GET | [Get Investor Details](https://fintechprimitives.com/api/#get-mandate) |
| Fetch ISIN of the fund scheme in which order has to be placed | GET | [Get Fund Schemes](https://fintechprimitives.com/api/#get-fund-schemes) |
| Create a SIP order for the fetched ISIN | POST | [Create SIP Order](https://fintechprimitives.com/api/#post-create-sip-order) |
| Fetch SIP order details | GET | [Get SIP Order details](https://fintechprimitives.com/api/#get-single-sip-order-detail) |
| Simulate monthly installments for the created SIP order (For staging) | POST | [Simulate SIP](https://fintechprimitives.com/api/#post-sip-simulation) |
| Get installment details of the created SIP order  | GET | [Get SIP Order installment details](https://fintechprimitives.com/api/#get-sip-order-instalment) |