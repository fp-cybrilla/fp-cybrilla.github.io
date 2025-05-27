# Sandbox Simulation

In the ONDC gateway, orders are processed by the SellerApp, which performs both KYC verification and Bank Account Validation (BAV) during new folio creation.

To ensure an order is successfully simulated in the sandbox environment:
1. Use a PAN that is simulated to be KYC verified.
2. Provide bank account details that are simulated to return a BAV success.

**Rules for PAN Simulation:**

| Scenario | PAN format | Description |
| - | - | - | - |
| *Status Check* - KYC compliant investor | XXXPX3751X | PAN numbers that match XXXPX3751X (replace X with any alphabet) are considered full KYC compliant and the response object will contain `status` as true, with no constraints. You can also use this to simulate the scenarios where KYC applications are under process at KRA and have not used Aadhaar as thier POA |
| Status Check - KYC non-compliant investor (KYC not available)     | XXXPX3753X | KYC applications with PAN numbers that match XXXPX3753X (replace X with any alphabet) are not available in any of the KRAs. You can use FP's KYC APIs to [perform digital KYC](https://docs.fintechprimitives.com/identity/kyc-request/) |

For rules of Bank account verification simulation, Refer to [here](https://docs.fintechprimitives.com/identity/verification/perform-bank-account-verification/)

### Order Simulation
* Orders with amounts ending in 0, once successfully submitted to the ONDC gateway, are automatically simulated as successful at the RTA.
* Orders with amounts ending in 1, once successfully submitted to the ONDC gateway, are automatically simulated as failed at the RTA.
