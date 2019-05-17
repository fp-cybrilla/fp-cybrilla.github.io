## Investment workflow sequence
-------------------------

Below is the sequence of APIs that can help implement the investment workflow for a general end user.

><p style="font-size:18px">Aunthentication (for production only)</p>

[Auth API](/pages/workflows/cancel-sip-order)
<!--[Auth API](https://fintechprimitives.com/api/#authentication)-->

><p style="font-size:18px">KYC Check</p>

[Get KYC Status](https://fintechprimitives.com/api/#authentication)<br>
[Check updated KYC status](https://fintechprimitives.com/api/#put-refetch-kyc-status)<br>

><p style="font-size:18px">Orders</p>

Scheme details<br>
[Fetch scheme details](https://fintechprimitives.com/api/#get-fund-schemes)<br>
Or<br>
[Fetch single scheme details](https://fintechprimitives.com/api/#get-single-fund-schemes-detail)

Test Data<br>

| Sample bank code | ICIC and FDRL |
|--------------|------------------|