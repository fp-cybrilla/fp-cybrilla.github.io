## Sample Investment workflow sequence
-------------------------

We encourage distributors to design their own investment journeys for their users.<br>However, we have also provided a sample sequence of APIs that can help you create an investment journey for your end users.

<p style="font-size:18px">Aunthentication (for production only)</p>

>[Auth API](https://fintechprimitives.com/api/#authentication)

<p style="font-size:18px">KYC Check</p>

> [Get KYC Status](https://fintechprimitives.com/api/#authentication)<br>
> [Check updated KYC status](https://fintechprimitives.com/api/#put-refetch-kyc-status)<br>

<p style="font-size:18px">Investor creation / Onboarding</p>

> [Create investor](https://fintechprimitives.com/api/#post-create-investor)<br>
[Create investment account](https://fintechprimitives.com/api/#post-create-investment-account)

<p style="font-size:18px">Orders</p>

**Scheme details**<br>
> [Fetch scheme details](https://fintechprimitives.com/api/#get-fund-schemes)<br>
Or<br>
[Fetch single scheme details](https://fintechprimitives.com/api/#get-single-fund-schemes-detail)

<!--
Test Data<br>

| Sample bank code | ICIC and FDRL |
|--------------|------------------|
-->
**Lumpsum Orders**<br>
> [Create lumpsum order with Netbanking](https://fintechprimitives.com/api/#post-create-lumpsum-order-netbanking)<br>
[Create a payment](https://fintechprimitives.com/api/#post-net-banking)

**SIP Orders**<br>
> [Create mandate](https://fintechprimitives.com/api/#post-create-mandate)
[Create SIP order](https://fintechprimitives.com/api/#post-create-sip-order)

**Redemption Orders**<br>
> [Redemption](https://fintechprimitives.com/api/#post-create-sell-order)

**Instant Redemption Orders**<br>
> [Details](https://docs.fintechprimitives.com/pages/workflows/instant-redemption-steps)

<p style="font-size:18px">Reports</p>

> [Holdings report](https://fintechprimitives.com/api/#get-investment-account-holdings)<br>
[Capital Gains report]()

