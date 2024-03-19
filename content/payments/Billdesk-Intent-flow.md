---
title: Enabling of UPI intent options in Token URL for Billdesk
---
## Enabling of UPI intent options in Token URL for Billdesk


Billdesk V2 APIs provide UPI intent payment flow capabilities. To enable UPI intent options in the Token URL generated using the [FPDocs, Create Payment](https://fintechprimitives.com/docs/api/#create-a-payment), you'll need to follow steps outlined below. By default, the UPI Intent payment method flow in the payment checkout page is disabled. However, you can utilize a provided code snippet to enable this feature. 

The following documentation is specific to implimentation for native android app. But similar implimentation can be done using frameworks such as React native, flutter etc by utilising the methods provided in [code snippet](https://github.com/cybrilla/fp-snippets/tree/master/payments/UpiDemo) 

 > Note: UPI Intent flow is only available if you are using Billdesk V2 APIs for lumpsum payments.

1. **Token URL Generation:**
   - Generate the Token URL using the [FPDocs, Create Payment](https://fintechprimitives.com/docs/api/#create-a-payment). This URL redirects the investor to the payment checkout page.

2. **Code Snippet Usage:**
   - Utilize the provided code snippet available [here](https://github.com/cybrilla/fp-snippets/tree/master/payments/UpiDemo) to enable the UPI intent flow in the payment checkout page.

3. **Supported UPI Apps:**
   - For following UPI apps, intent can be enabled in payment checkout page:
        - Google Pay
        - Phonepe
        - All UPI apps installed(Only for Android)

4. **Implementation Steps:**
   - The `UpiPaymentProvider.init()` method establish a bridge between your app and the payment checkout page.
   - Use the `UpiPaymentProvider.getSupportedUpiAppsUse(Context context)` method to fetch the list of whitelisted UPI apps installed on the investor's device ready for making payments.
   - Once the list of apps is fetched, Inject the eligible UPI app names into the payment checkout page using `UpiPaymentProvider.this.webView.loadUrl()` method. You can choose to display specific apps or all installed UPI apps (Android only).

5. **User Interaction:**
   - Once the user selects a UPI app on the payment checkout page, the `MainActivity.shouldOverrideUrlLoading(WebView view, String url)` method is invoked to open the selected UPI app on the user's device to complete the payment.

By following these steps and utilizing the provided code snippet, you can enable UPI intent options in the Token URL. Please note that similar implementations can be done for iOS and other frameworks as well, following the outlined principles.
