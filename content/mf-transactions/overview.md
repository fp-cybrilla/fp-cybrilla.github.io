---
title: Overview
---
## MF Orders
#### Buy and sell mutual funds for your investors with FP Order APIs

Order APIs give you the ability to place purchase and sell orders on behalf of your investor. Using FP APIs, you can either create one time orders or you can create recurring orders.

**One time orders**
1. [Create a onetime purchase](/mf-transactions/onetime-purchases)
2. [Sell a mutual fund](/mf-transactions/onetime-redemptions)
3. [Switch from one scheme to another](/mf-transactions/onetime-switches)

**Recurring purchases**
1. [Create a new SIP](/mf-transactions/purchase-plans/create-monthly-sip)
2. [Pause installments of an existing SIP](/mf-transactions/purchase-plans/pause-sip)

<!-- 2. [Top up amount for an SIP](/mf-transactions/purchase-plans/topup-sip)
3. [Renew the tenure of an SIP](/mf-transactions/purchase-plans/renew-sip/) -->

**Important note:**

To place one time orders or recurring orders, you need an investment account. When an order is placed against an investment account, we need to report certain demographic information of investors to the order gateways. To facilitate this transfer of information, please ensure that investor objects containing appropriate investor demographic information are linked to the investment account before placing orders. 

1. If you have already migrated existing folios of your investors to FP, investment accounts will be created for these investors by default. When such investors onboard, you can collect demographic information of such investors and store it in investor object and link this investor object to the alredy existing investment account.
2. If the investor is completely new to your platform(i.e. no existing folios), in addition to collecting demographic information of such investors and storing it in investor objects, you will have to explicitly create investment accounts for these investors and link them to the respective investor objects. Follow [these steps](/mf-transactions/investment-account) to create an investment account in such cases.
