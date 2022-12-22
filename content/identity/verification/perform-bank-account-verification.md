## Perform Bank Account Verification

Use FP APIs to verify bank accounts.

### Prerequisite
 - [Create an Investor Profile](https://fintechprimitives.com/docs/api/#create-an-investor-profile) before performing the bank account verifications.
 - After creating the Investor Profile, you must attach one or more bank accounts for the investor using the [Create a Bank Account API](https://fintechprimitives.com/docs/api/#bank-accounts-early-access)
 - You can set an optional input match threshold based on which the bank account verification results can be optimised. By default, the input match threshold will not be set for a tenant. If you want to use this feature, please write to [FP Support](mailto:fpsupport@cybrilla.com) to get more information on this

### 1. Create a bank account verification request

Call the [Create Bank Account Verification API](https://fintechprimitives.com/docs/api/#create-bank-verification-transaction) by providing the ID of the `bank_account` object that you want to verify. 

```json
{
  "bank_account": "bac_98367e8972b43867a9c68a7c4605a31d"
}
```

A bank account verification object will be created with status=`pending`

### 2. Check the bank account verification status periodically to check the status of the verification
Once the `bank_account_verification` object is created, we need to poll the [fetch bank account verification transaction by ID](https://fintechprimitives.com/docs/api/#fetch-bank-account-verification-transaction-by-id) API to check status periodically. If the `status` is `completed`, the verification is successful. At this point, we can consider the `confidence` value to decide on the confidence of the bank account verified.

If the `status` is `failed`, it means the bank account could not be verified. If `reason` for failure is `expiry`, you can retry bank account verification. If the status is `failed` and `reason` is `digital_verification_failure`, you can attempt verify some other bank account instead.

### A note on working with input match threshold

FP offers a provision to configure an input match threshold for every tenant, based on which the `confidence` level can be returned either as `very_high` or `zero`. If this input match threshold is not configured for a tenant then a default set of `confidence` levels would be returned based on the actual match percentage as indicated in the last 2 digits of the bank account number. This is a one-time configuration done before you go live.

## Testing

In sandbox, simulation facility can be used to test bank account verification. This facility is only available in sandbox.

#### Input match threshold configured 

| Status | Account no. pattern <br>[last 4 digits] | Last two digits of account no. <br>[indicated by `XX`] |  `confidence` level with <br>input match threshold being `YY` |
| ------ | ------ | ------ |  ------ |
| `completed` | 21XX | 99 - 00  |  - `very_high` if `XX` >= `YY` <br> - `zero` if `XX` < `YY` |

**Example**

| Last 4 digits of Bank account number | Status | Reason | `confidence` if input match threshold <br> is configured as `85` |
|-|-|-|-|
| 2193 | `completed` | `digital_verification` | `very_high` |
| 2185 | `completed` | `digital_verification` | `very_high` |
| 2184 | `completed` | `digital_verification` | `zero` |
| 2157 | `completed` | - | - |

<br>

#### Input match threshold _NOT_ configured 

| Status | Account no. pattern <br>[last 4 digits] | Last two digits of account no. <br>[indicated by `XX`] |  `confidence` |
| ------ | ------ | ------ |  ------ |
| `completed` | 11XX | 99 - 91  |  `very_high` |
| `completed` | 12XX | 90 - 61 |  `high` |
| `completed` | 13XX | 60 - 41 |  `uncertain` |
| `completed` | 14XX | 40 - 21 |  `low` |
| `completed` | 15XX | 20 - 1 |  `very_low` |
| `completed` | 1600 | 00 | `zero` |

**Example**

| Last 4 digits of Bank account number | Status | Reason | `confidence` if input match threshold <br> is not configured |
|-|-|-|-|
| 1193 | `completed` | `digital_verification` | `very_high` |
| 1285 | `completed` | `digital_verification` | `high` |
| 1515 | `completed` | `digital_verification` | `very_low` |
| 2157 | `failed` | `expiry` | - |


<br>

**Additional simulation scenarios:** 
- Any bank account verification object will be in a `pending` state as soon as it is created. You need to fetch the `id` present in this object and poll [Fetch Bank Account Verification by ID](https://fintechprimitives.com/docs/api/#fetch-bank-account-verification-by-id) API to get the updated status
- To simulate an expiry scenario, you could use any pattern that is different from the ones mentioned above. The bank account verification object would be in `pending` state initially and would change to `failed` state after 15 minutes with the reason as `expiry`
- To simulate any `failed` cases of bank account verification, you must use the bank account number pattern `31XX` where `XX` can be any number between 00 - 99

<br>

### How to start verifying bank accounts?

If you want to make use of this bank account verification service, please write to [FP Support](mailto:fpsupport@cybrilla.com) and we will enable this service for your tenant. You can either choose a default verification option offered as a part of Fintech Primitives API collection or choose a CAMSPay integration. If you are going ahead with CAMSPay integration option, you would have to configure an input match threshold value, without which the bank account verifications cannot be performed. If you are going ahead with the default option, then you can either configure an input match threshold value or not; the behaviour would vary accordingly, as indicated in the above simulation logics.