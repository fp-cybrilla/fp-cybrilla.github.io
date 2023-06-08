---
title: Customise payment checkout page via Razorpay SDK
---
## Customise payment checkout page via Razorpay SDK

Follow the below steps to customise the payment checkout page for Netbanking, UPI and E-Mandate authorisation.

#### Netbanking/UPI Payment:

1. Ensure that payment SDK options are enabled in your FP tenant. Please contact FP support for enabling of Payment SDK options. 
2. For each mutual fund schemes that the Investor wants to purchase, create the MF purchase order in FP by using the [MF purchase API](https://fintechprimitives.com/docs/api/#create-a-mf-purchase).
3. Create payment for one or more MF purchase orders created in step 2 by using [Create Payment API](https://fintechprimitives.com/docs/api/#create-a-payment).
  
    *Payment creation API Request:*

      ```
      curl -X POST "{{base_url}}/api/pg/payments/netbanking"
        -H "x-tenant-id: <tenant name>"
        -H "Authorization: Bearer ACCESS_TOKEN"
        -d '
          {
        "amc_order_ids": [
          1,
          2
        ],          //Order Ids of the orders created in FP. Here we are creating the payment for two Mutual funds purchase.
        "payment_postback_url": "https://example.com/"
      }

      ```
    *Payment creation API Response:*

      ```json

      {
          "id": 1692,
          "token_url": "{{base_url}}/api/pg/payments/netbanking/razorpay?txnId=2c8a6e76-f622-47d8-90c2-746f9fb1d577&txnType=0",
          "sdk_options": {
              "razorpay": {
                  "callback_url": "{{base_url}}/api/pg/payments/netbanking/razorpay/capture/1692",
                  "bank_code": "ICIC",
                  "amount": 100000,
                  "method": {
                      "wallet": false,
                      "netbanking": true,
                      "card": false,
                      "upi": false
                  },
                  "order_id": "order_LD3UyrIMhixgTU", //Razorpay 'order_id'
                  "key": "rzp_test_yOMeNF4w46S7lK",
                  "email": "abc@cybrilla.com",
                  "contact": "9642991181"
              }
          }
      }

      ```

4. Parameters received in the above response as `'sdk_options' -> 'razorpay'` must be passed on while integrating Razorpay SDK in any of the platforms such as web, Andoid or IOS.

    For example, while integrating with web app as detailed in [Razorpay documentation](https://razorpay.com/docs/payments/payment-gateway/web-integration/standard/build-integration/#code-to-add-pay-button), SDK parameters must be passed from the response received from the [FP Create Payment API](https://fintechprimitives.com/docs/api/#create-a-payment) as detailed in the comments in the code below

    > Note: Example below for netbanking checkout with callback URL is for reference. Netbanking checkout with handler functions can also be implemented as given in Razorpay documentation.

    ```javascript

      <button id="rzp-button1">Pay</button>
      <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
      <script>
      var options = {
          "key": "FP_Payment_response.sdk_options.razorpay.key", // Enter the Key ID generated from the Dashboard
          "amount": "FP_Payment_response.sdk_options.razorpay.amount", //Use the amount received from FP payment response -> SDK_options -> razorpay -> amount.
      // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
          "currency": "INR",
          "name": "Your company name", //your business name
          "image": "https://example.com/your_logo",  //Your Business logo
          "order_id": "FP_Payment_response.sdk_options.razorpay.order_id", //Use the order ID received from FP payment response -> SDK_options -> razorpay -> order_id.
          "callback_url": "FP_Payment_response.sdk_options.razorpay.callback_url", //Use the callback_URL received from FP payment response -> SDK_options -> razorpay -> callback_url.
          "prefill": {

              "email": "FP_Payment_response.sdk_options.razorpay.email",  //your customer's email
              "contact": "FP_Payment_response.sdk_options.razorpay.contact"   //your customer's contact
          },
          "retry": {
              "enabled": false,      //Pass the 'retry' parameter as 'false'.
    
          },
          "theme": {
              "color": "#3399cc"        //Your Brand color
          }
      };
      var rzp1 = new Razorpay(options);
      document.getElementById('rzp-button1').onclick = function(e){
          rzp1.open();
          e.preventDefault();
      }
      </script>
    ```

    > Note: Please pass the 'retry' parameter as 'false'.

#### E-Mandate Authorisation SDK options:

Similar steps must be followed for E-Mandate authorisation page customisation using Razorpay SDK. Please refer to [Razorpay documentation for E-Mandate authorisation] (https://razorpay.com/docs/api/payments/recurring-payments/emandate/create-authorization-transaction)

1. Create a mandate in FP by using [Create mandate API](https://fintechprimitives.com/docs/api/#create-a-mandate-enach).
2. Create the authorisation transaction for the mandate generated in step 1 using [Authorise Mandate API](https://fintechprimitives.com/docs/api/#authorize-a-mandate-enach) by passing the mandate ID.

    *Mandate auth Request:*

      ```

      curl "{{base_url}}/api/pg/payments/emandate/auth"
        -H "x-tenant-id: <tenant name>"
        -H "Authorization: Bearer ACCESS_TOKEN"
        -d '
          {
        "mandate_id": 1,
        "payment_postback_url": "https://example.com/"
      }

      ```

    *Mandate auth Response:*

      ```json

      {
          "id": 1692,
          "token_url": "{{base_url}}/api/pg/payments/netbanking/razorpay?txnId=2c8a6e76-f622-47d8-90c2-746f9fb1d577&txnType=0",
          "sdk_options": {
              "razorpay": {
                  "callback_url": "{{base_url}}/api/pg/payments/netbanking/razorpay/capture/1692",
                  "bank_code": "ICIC",
                  "amount": 100000,
                  "method": {
                      "wallet": false,
                      "netbanking": true,
                      "card": false,
                      "upi": false
                  },
                  "bank_account_holder_name": "Abhin",   
                  "customer_id": "cust_LN282jrS8faukL",
                  "order_id": "order_LPLoYDzTOOKCUD",
                  "bank_account_ifsc": "ICIC0000801",
                  "key": "rzp_test_yOMeNF4w46S7lK",
                  "email": "abhin@cybrilla.com",
                  "contact": "9642991181"
              }
          }
      }

      ```

3. Parameters received in the above response as `'sdk_options' -> 'razorpay'` must be passed on while creating authorisation payment checkout page using Razorpay SDK as detailed in [Razorpay documentation](https://razorpay.com/docs/api/payments/recurring-payments/emandate/create-authorization-transaction#113-create-an-authorization-payment).

    > Note: Below example for checkout with handler functions is for reference. Similarly authorisation checkout page with callback URL can also be created by passing an extra "callback_url" parameter as detailed in Razorpay documentation. 

  
    ```javascript
      <button id = "rzp-button1"> Pay </button>
        <script src = "https://checkout.razorpay.com/v1/checkout.js"> </script>
        <script>
          var options = {
            "key": "FP_MandateAuth_response.sdk_options.razorpay.key",           
            "order_id": "FP_MandateAuth_response.sdk_options.razorpay.order_id",   //Use the order ID received from FP payment response -> SDK_options -> razorpay -> order_id.
            "customer_id": "FP_MandateAuth_response.sdk_options.razorpay.customer_id",    //Use the customer ID received from FP payment response -> SDK_options -> razorpay -> customer_id.
            "recurring": "1",    //Mandatory field and its value must be '1'.
            "name": "Your company name", //your business name
            "image": "https://example.com/your_logo",  //Your business logo
            "prefill": {
              "name": "FP_MandateAuth_response.sdk_options.razorpay.bank_account_holder_name", //your customer's name
              "email": "FP_MandateAuth_response.sdk_options.razorpay.email",  //your customer's email
              "contact": "FP_MandateAuth_response.sdk_options.razorpay.contact"   //your customer's contact
            },
            "handler": function (response) {
              alert(response.razorpay_payment_id);
              alert(response.razorpay_order_id);
              alert(response.razorpay_signature);
            },
            "theme": {
              "color": "#F37254"    //Your brand color
            }
          };
          var rzp1 = new Razorpay(options);
          document.getElementById('rzp-button1').onclick = function (e) {
            rzp1.open();
            e.preventDefault();
          }
        </script>
    ```

