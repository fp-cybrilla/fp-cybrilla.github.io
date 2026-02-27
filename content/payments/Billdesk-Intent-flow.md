---
title: Enabling of UPI intent options in Token URL for Billdesk
---
## Enabling of UPI intent options in Token URL for Billdesk

Billdesk V2 APIs provide UPI intent payment flow capabilities. To enable UPI intent options in the Token URL generated using the [FPDocs, Create Payment](https://fintechprimitives.com/docs/api/#create-a-payment), you can use either of the following: 
- **Option 1** : pass query parameters in the Token URL (recommended) 
- **Option 2** : utilize a provided code snippet (to be deprecated). By default, the UPI Intent payment method flow in the payment checkout page is enabled.

As per NPCI regulation, post 28 February 2026, the UPI Collect flow (pay by UPI ID / number) for one-time UPI payments will no longer be supported on desktop and Android. Collect flow is supported on IOS until NPCI notifies otherwise. Investors must use Intent-based UPI or QR. This page describes how to enable Intent and related options.

If you are using the code snippet (Option 2), the URL parameters will not affect the page behaviour. The code snippet takes precedence to ensure backward compatibility.

#### Option 1: Enable UPI intent using URL parameters (recommended)

You can enable UPI intent options in the payment checkout page by passing query parameters in the Token URL returned by [Create Payment](https://fintechprimitives.com/docs/api/#create-a-payment). This avoids the need for the code snippet and works for both FP-RTA tenants, Direct ONDC Buyers and FP-ONDC tenants.

**Parameters**

| Parameter | Values | How it is shown |
|-----------|--------|-----------------|
| `requestedUpiApps` | Comma-separated list of app codes, or `ALL` | Only the specified UPI app(s) are shown on the payment checkout page. |
| `showUpiCollect` | `true` | Shows the UPI Collect option. Use this option only for iOS apps and iOS mWeb. |
| `showQR` | `true` | Shows the UPI QR option on mobile. When using this option, you must also pass `&method=UPI` in the Token URL. |
| `method` | `UPI` | Required when `showQR=true`; must be passed together with `showQR=true`. |

**Supported values for `requestedUpiApps`**

| App | Code |
|------|-----|
| PhonePe | PHONE_PE |
| Paytm | PAYTM |
| Google Pay | GOOGLE_PAY |
| Other UPI apps | OTHER |
| All installed UPI apps | ALL|

 > Note: The **OTHER** option must be used only on Android devices and not on iOS.

#### Usage guidelines

**Identifying installed apps on user device:**
The tenant is responsible for identifying which UPI apps are installed on the investor's device. You should pass **only those installed apps** in the URL parameter so that only eligible options are shown. If you pass an app that is not installed, the investor may see an option that does not work or encounter an error, which can affect the experience.

**Using the ALL parameter:**
To show all available UPI apps without filtering, you can pass `ALL` as the value. If the investor's device does not have a UPI app that the gateway lists, selecting that app may result in an error and affect the user experience. For the best experience, prefer passing only the UPI apps that are detected as installed on the investor's device.

**Show QR on mobile:**
If you choose to show the UPI QR option on mobile, pass `showQR=true` in the Token URL. You must also pass `&method=UPI` in the URL when using this option.

**Show UPI Collect (iOS only):**
Pass `showUpiCollect=true` to show the UPI Collect option on the payment checkout page. Use this parameter **only for iOS apps and iOS mWeb**. On desktop and Android, the Collect option is shown by default until the NPCI sunset (post 28 February 2026); there is no need to pass `showUpiCollect` for those channels.

##### Example
```
...?txnId=...&txnType=0&requestedUpiApps=PHONE_PE,GOOGLE_PAY
```

#### Option 2: Enable UPI intent using code snippet (to be deprecated)

The following documentation is specific to implimentation for native android app. But similar implimentation can be done using frameworks such as React native, flutter etc by utilising the methods provided in [code snippet](https://github.com/cybrilla/fp-snippets/tree/master/payments/UpiDemo)

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
