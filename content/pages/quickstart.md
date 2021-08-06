## Sample Investment workflow sequence
-------------------------

We encourage distributors to design their own investment journeys for their users.<br>However, we have also provided a sample sequence of APIs that can help you create an investment journey for your end users.

<p style="font-size:18px">Aunthentication (for production only)</p>

>[Auth API](https://fintechprimitives.com/api/#authentication)

## User Acquisition (KYC + Onboarding)
-------------------------

<p style="font-size:18px">KYC</p>

> [Details](/pages/workflows/what-is-kyc)<br>

<p style="font-size:18px">Investor creation / Onboarding</p>

> [Create investor](https://fintechprimitives.com/api/#post-create-investor)<br>
[Create investment account](https://fintechprimitives.com/api/#post-create-investment-account)

## User Conversion (Transactions)
-------------------------

<p style="font-size:18px">Orders</p>

**Scheme details**<br>
> [Fetch scheme details](https://fintechprimitives.com/api/#get-fund-schemes)<br>
Or<br>
[Fetch single scheme details](https://fintechprimitives.com/api/#get-single-fund-schemes-detail)

**Lumpsum Orders**<br>
> [Create lumpsum order with Netbanking/debit card/UPI](https://fintechprimitives.com/api/#post-create-lumpsum-order-netbanking)<br>
[Create a payment](https://fintechprimitives.com/api/#post-net-banking)
<br>OR<br>
> [Create mandate](https://fintechprimitives.com/api/#post-create-mandate)<br>
[Create lumpsum order with NACH](https://fintechprimitives.com/api/#post-create-lumpsum-order-nach)<br>

**SIP Orders**<br>
> [Create mandate](https://fintechprimitives.com/api/#post-create-mandate)<br>
[Create SIP order](/pages/workflows/create-sip-order)

**Redemption Orders**<br>
> [Redemption](https://fintechprimitives.com/api/#post-create-sell-order)

**Instant Redemption Orders**<br>
> [Details](https://docs.fintechprimitives.com/pages/workflows/instant-redemption-steps)

## User Retention (Reporting)
-------------------------

<p style="font-size:18px">Reports</p>

> [Details](/pages/workflows/investor-reporting)<br>
