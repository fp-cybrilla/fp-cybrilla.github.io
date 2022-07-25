## Perform Bank Account Verification

Use FP APIs to verify bank accounts.

### Prerequisite
 - Create an investor before performing the bank account verifications.
 - After creating investor, you can attach more bank accounts for the investor using the [create bank account api](https://fintechprimitives.com/docs/api/#bank-accounts-early-access)

### 1. Create a bank account verification request

Call the [create bank account verification api](https://fintechprimitives.com/docs/api/#create-bank-verification-transaction) by providing the FP id of the bank account which you want verify. 

```json
{
  "bank_account": "bac_98367e8972b43867a9c68a7c4605a31d"
}
```

A bank account verification object will be created with state=`pending`

### 2. Check the bank account verification status periodically to check the status of the verification.
Once the bank_account_verification object is created, we need to poll the [fetch bank account verification transaction by ID](https://fintechprimitives.com/docs/api/#fetch-bank-account-verification-transaction-by-id) API to check status periodically. If the `status` is `completed`, the verification is successful. At this point, we can consider the `confidence` value to decide on the confidence of the bank account verified.

If the `status` is `failed`, it means the bank account could not be verified. If `reason` for failure is `expiry`, you can retry bank account verification. If the status is `failed` and `reason` is `digital_verification_failure`, you can attempt verify some other bank account instead.

## Testing

- Live verification is not available in the sandbox and the request will be simulated using pattern matching of bank account number.
- The last `4` digits of the bank account will be considered to match the pattern.

example:
    if `05411000061185` is the account number, the last 4 digits `1185` will be considered. Where the digits
`11` will be a pattern to match the status and reason, the other two digits `85` will be considered for generating the `confidence` level.

Patterns:
- completed: 1XXX
- pending: 2XXX
- failed: 3XXX

By default expiry and pending(digital_verification) are handled no need to simulate.

| Status | Account no. pattern | Last two digits of account no. |  Confidence |
| ------ | ------ | ------ |  ------ |
| `completed` | 11XX | 99 - 90  |  `very_high` |
| `completed` | 12XX | 90 - 60 |  `high` |
| `completed` | 13XX | 60 - 40 |  `uncertain` |
| `completed` | 14XX | 40 - 20 |  `low` |
| `completed` | 15XX | 20 - 1 |  `very_low` |
| `completed` | 1600 | 00 | `zero` |
| `failed` | 31XX | - | `null` |
