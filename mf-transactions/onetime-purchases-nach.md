
If you want to debit the money from your investor's bank account using NACH to fund this purchase, call the [create order to pay via nach api](https://fintechprimitives.com/api/#post-create-lumpsum-order-nach) with the following json. Use the id of the mandate associated with the investor's bank account from which you want to debit the money from.
[Learn how to create mandates and take authorization from your investor to auto debit money](aa).

```json
{
  "mandate_id": 1,
  "orders": [
    {
      "isin": "INF109K01VQ1",
      "amount": 500
    }
  ]
}
```

## 9. Important note on BSE gateway:<br>
Please note the following differences if the order has to be routed to BSE.<br>
a. On order creation, order will be in `PENDING` state as usual. However, this order will be submitted to BSE in the background immediately and will be marked as `SUBMITTED` eventually. <br>
b. Only after the order is submitted to BSE(You can poll order status API to ensure that order state is `SUBMITTED`), you can create payments.<br>
c. To create payment you must use the below API<br>
`POST {{base_url}}/api/oms/bse_payments`<br>
Sample request:<br>
```
{
    "order_ids" : [156],
    "postback_url":""//Callback url 
}
```
Please note that you will get HTML string as a response. Upong opening this HTML web page, the investor will be redirected to his bank's login page where he can login and make payment. Irrespective of whether the order is place via RTA or BSE, reverse feeds have to be uploaded to ensure that orders get reconciled. To summarize, the main difference between RTA and the BSE gateway is that if the order is routed via RTA gateway, orders will be submitted only after the payment is confirmed. However, in case of BSE gateway, order has to be submitted first in order to make a payment.


