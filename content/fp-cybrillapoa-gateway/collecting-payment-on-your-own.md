##  Collecting payments on your own

As a distributor/RIA, for whatever reason, should you chose to collect payment on your own, you can do so too by using FP-CybrillaPOA gateway to process orders only.
#### 1. Collecting payments on your own against SIP installments
1. Create an SIP without mandate and collect consent and ensure that SIP is active.
2. FP-CybrillaPOA gateway ensures that installments are generated according to the SIP schedule.
3. Fetch this installment. Ensure that the installment is in `submitted` state and copy the value in `order_reference`. This is the order number which will be used to report the order to RTAs.
4. Collect the payment from the pre-verified bank account of the investor. To ensure that bank account of the investor is pre-verified use [pre-verification API](https://poa.cybrilla.com/docs/additional-apis/pre-verification). If you use any other bank account, we will not be able to get the order processed by RTAs.
5. Ensure that you have initiated the transfer of collected money to AMC's collection account.
6. Provide the settlement details using [MF Settlement details API](https://fintechprimitives.com/docs/api/#create-a-mf-settlement-detail)
7. Only after the settlement details are provided, the order will be submitted to RTAs. The order status will be updated post unit allotment as usual.

#### 2. Collecting payments on your own against Lumpsum purchase orders (Coming soon)
1. [Create MF Purchase order](https://fintechprimitives.com/docs/api/#create-a-mf-purchase) as usual and ensure review completion. 
2. Collect consent against the order and confirm the order and ensure the order is submitted and copy the value in `order_reference`.
3. Collect the payment from the pre-verified bank account of the investor. To ensure that bank account of the investor is pre-verified use [pre-verification API](https://poa.cybrilla.com/docs/additional-apis/pre-verification). If you use any other bank account, we will not be able to get the order processed by RTAs.
4. Ensure that you have initiated the transfer of collected money to AMC's collection account.
5. Provide the settlement details using [MF Settlement details API](https://fintechprimitives.com/docs/api/#create-a-mf-settlement-detail)
6. Only after the settlement details are provided, the order will be submitted to RTAs. The order status will be updated post unit allotment as usual.

#### 3. Managing batch payment collection.
If you have a use case where you collect a single payment against multiple orders (Ex: Goals), you can still collect payment on your own. However, each SIP or Lumpsum purchase orders have to be collected separately using [Create SIP](https://fintechprimitives.com/docs/api/#create-a-purchase-plan) and [Create Purchase Order](https://fintechprimitives.com/docs/api/#create-a-mf-purchase) respectively instead of using Batch Purchase of Batch Plans APIs.  Once payment against multiple such orders are collected and transfer is initiated to collection account of AMCs, for each order, settlement details must be provided separately using [MF Settlement details API](https://fintechprimitives.com/docs/api/#create-a-mf-settlement-detail) API.

#### 4. Things to take care of while collecting payments by yourself
When you are responsible for collecting payments as a distributor/RIA it is your responsibility to ensure that PGs that you work with are sending MIS reports to RTAs with correct details. If correct details are not sent, RTAs wouldn't be able to match the order with money at the collection account and hence order will fail. The MIS report sent by PGs contain multiple columns. Most of these columns are straightforward and some of these columns are auto populated by PGs themselves. However, there are two columns where we want to clarify what values must be send.
1. **ARN_RIA** : This is the license code of your business i.e. ARN or RIA code.
2. **USER_CODE** : In case of CAMS, pass `CYBREG` if you are an ARN. Pass `CYBRIA` if you are an RIA. In case of KFintech, pass `CYBRILLA`
3. **USR_TXN_NO** : Pass the value that you get in `order_reference` attribute of `mf_purchase` 

#### 5. Can I use both Cybrilla's payment collection facilities and my own payment collection setup in parallel?
Yes. You can. For lumspsum purchase orders, this is straightforward. You can collect payments for few lumpsum purchase orders and rely on us to collect payment for other few orders. However, when it comes to mandates, please note that if you use Cybrilla's payment collection facilities, mandates will be registered in Cybrilla's name and you cannot use such mandates for SIPs where you want to collect payments by yourselves. Similarly, the mandates that you have registered on your own cannot be used to collect payment via Cybrilla's APIs.