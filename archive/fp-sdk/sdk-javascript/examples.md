## Javascript SDK examples

### Investors

#### Create an investor

```javascript
async function investorCreate() {
    const fpClient = new fp(options)
    try {
        const params = {
            display_name: "SuvarnaMFACC",
            user_id: null,
            perm_addr_is_corres_addr: true,
            nomination: {
                skip_nomination: true,
                nominee1: null,
                nominee2: null,
                nominee3: null,
            },
            contact_detail: {
                email: "vaity.suvarna@abc.com",
                isd_code: 91,
                mobile: "9012901290",
                office_telephone_no: null,
                residence_telephone_no: null,
            },
            fatca_detail: {
                country_of_birth_ansi_code: "IN",
                source_of_wealth: "BUSINESS",
                first_trc_ansi_code: "IN",
                first_trc_taxid_type: "TIN",
                first_trc_taxid_number: "123456",
                gross_annual_income: 100000,
                no_other_tax_residences: false,
                address_type: "RESIDENTIAL",
            },
            kyc_identity_detail: {
                name: "Suvarna",
                father_or_spouse_name: "Suvarnafather",
                mothers_name: "mother",
                kyc_relation: "FATHER",
                date_of_birth: "1980-10-10",
                marital_status: "SINGLE",
                pan_number: "AREPD1040N",
                gender: "MALE",
                occupation: "BUSINESS",
                residential_status: "RESIDENT_INDIVIDUAL",
                country_of_citizenship_ansi_code: "IN",
                pan_exempt: false,
                pep_exposed: false,
                pep_related: false,
                guardian_relationship: "OTHERS",
                guardian_name: null,
            },
            bank_accounts: [
                {
                    account_holder_name: "Suvarnabank",
                    type: "SAVINGS",
                    primary_account: true,
                    number: "05411000068533",
                    cancelled_cheque: "file_2bfdcced2e714a3e89ccfd45e583e2be",
                    ifsc_code: "HDFC0000541",
                },
            ],
            correspondence_address: {
                line1: "Test",
                line2: "Bangalore",
                line3: null,
                pincode: "560102",
                city: "Bengaluru",
                state: "KARNATAKA",
                country_ansi_code: "IN",
            },
        }
        console.log(await fpClient.investors().create(params))
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Create an investor reference](https://fintechprimitives.com/docs/api/#create-a-mf-purchase)

#### Update an investor

```javascript
async function investorPatch() {
    const fpClient = new fp(options)
    try {
        const params = {
            id: "668",
            display_name: "SuvarnaMFACC123",
        }
        console.log(await fpClient.investors().update(params))
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Update an investor reference](https://fintechprimitives.com/docs/api/#update-an-investor)

#### Fetch an investor

```javascript
async function getInvestor() {
    const fpClient = new fp(options)
    // using async / await
    try {
        const data = await fpClient.investors().fetch("669")
        console.log("data", data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Fetch an investor reference](https://fintechprimitives.com/docs/api/#fetch-an-investor)

#### Search Investors

```javascript
async function investorSearch() {
    const fpClient = new fp(options)
    try {
        console.log(
            await fpClient.investors().fetchAll({
                bank_account_ids: "663,662",
            })
        )
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Search Investors reference](https://fintechprimitives.com/docs/api/#search-investors)

### Bank Accounts (Early Access)

#### Create Bank Account

```javascript
async function createBankAccount() {
    const fpClient = new fp(options)
    try {
        const params = {
            investor: "669",
            account_holder_name: "Suvarna  space",
            account_number: "05411000061135",
            type: "savings",
            ifsc_code: "HDFC0000501",
        }
        const data = await fpClient.bank_accounts().create(params)
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Create Bank Account reference](https://fintechprimitives.com/docs/api/#create-bank-account)

#### Fetch all Bank Accounts

```javascript
async function getAllBankAccounts() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.bank_accounts().fetchAll({
            investor: "677",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Fetch all Bank Accounts reference](https://fintechprimitives.com/docs/api/#fetch-all-bank-accounts)

#### Fetch Bank Account by ID

```javascript
async function getBankAccount() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .bank_accounts()
            .fetch("bac_666929e99b7b4c9c94d4f838990eef89")
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Fetch Bank Account by ID reference](https://fintechprimitives.com/docs/api/#fetch-bank-account-by-id)

### MF Folios

#### Fetch all folios

```javascript
async function getMfFolios() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_folios().fetchAll({})
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Fetch all folios reference](https://fintechprimitives.com/docs/api/#fetch-all-folios)

### Master Data

#### Pincode

```javascript
async function getPincode() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.master_data().fetchPincode("560102")
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Pincode reference](https://fintechprimitives.com/docs/api/#pincode)

#### States

```javascript
async function getStates() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.master_data().fetchStates()
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, States reference](https://fintechprimitives.com/docs/api/#states)

#### Countries

```javascript
async function getCountries() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.master_data().fetchCountries()
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Countries reference](https://fintechprimitives.com/docs/api/#countries)

#### IFSC

```javascript
async function getIfscCodes() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.master_data().fetchIfscCodes("ICIC0000611")
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, IFSC reference](https://fintechprimitives.com/docs/api/#ifsc)

#### Fund Scheme

```javascript
async function getSchemes() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.master_data().fetchScheme("INF760K01DF2")
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Fund Scheme reference](https://fintechprimitives.com/docs/api/#fund-scheme)

#### AMCs

```javascript
async function getAmcs() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.master_data().fetchAmcs()
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, AMCs reference](https://fintechprimitives.com/docs/api/#amcs)

### MF Investment Accounts

#### Create a MF Investment Account

```javascript
async function createMfInvestmentAccount() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_investment_accounts().create({
            primary_investor_old_id: "672",
            holding_pattern: "single",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create a MF Investment Account reference](https://fintechprimitives.com/docs/api/#create-a-mf-investment-account)

#### Update a MF Investment Account

```javascript
async function updateMfInvestmentAccount() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_investment_accounts().update({
            primary_investor_old_id: "664",
            id: "mfia_88d32ec56554483c8ccc1fee6f7a1b57",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Update a MF Investment Account reference](https://fintechprimitives.com/docs/api/#update-a-mf-investment-account)

#### Fetch a mf investment account

```javascript
async function updateMfInvestmentAccount() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_investment_accounts().update({
            primary_investor_old_id: "664",
            id: "mfia_88d32ec56554483c8ccc1fee6f7a1b57",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch a mf investment account reference](https://fintechprimitives.com/docs/api/#fetch-a-mf-investment-account)

#### List all MF Investment Accounts

```javascript
async function fetcAllMfInvestmentAccount() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_investment_accounts().fetchAll({
            investor: "AREPD1040N",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, List all MF Investment Accounts reference](https://fintechprimitives.com/docs/api/#list-all-mf-investment-accounts)

### MF Purchases

#### Create a MF Purchase

```javascript
async function mFpurchaseCreate() {
    const fpClient = new fp(options)
    //create
    try {
        let req = {
            mf_investment_account: "mfia_6b418c10f1744183bae65c7209189eed",
            scheme: "INF109K01VQ1",
            amount: 500,
        }
        const data = await fpClient.mf_purchases().create(req)
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create a MF Purchase reference](https://fintechprimitives.com/docs/api/#create-a-mf-purchase)

#### Update a MF Purchase

```javascript
async function updateMfPurchase() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_purchases().update({
            id: "mfp_177177219f634373b01072986d2eea7d",
            state: "confirmed",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Update a MF Purchase reference](https://fintechprimitives.com/docs/api/#update-a-mf-purchase)

#### Fetch a MF Purchase

```javascript
async function fetchMfPurchase() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .mf_purchases()
            .fetch("mfp_b6874a51adf64109bb6e19129e5e7556")
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Fetch a MF Purchase reference](https://fintechprimitives.com/docs/api/#fetch-a-mf-purchase)

#### List all MF Purchases

```javascript
async function fetchAllMfPurchase() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_purchases().fetchAll({})
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, List all MF Purchases reference](https://fintechprimitives.com/docs/api/#list-all-mf-purchases)

#### Retry MF Purchase

```javascript
async function retryMfPurchase() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .mf_purchases()
            .retry("mfp_b6874a51adf64109bb6e19129e5e7556")
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Retry MF Purchase](https://fintechprimitives.com/docs/api/#retry-mf-purchase)

### Payments

#### Create a payment

```javascript
async function createNetBankingPayment() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.payments().createNetbankingPayment({
            amc_order_ids: [68608],
            bank_account_id: 704,
            method: "NETBANKING",
            payment_postback_url: "https://example.com/",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Create a payment reference](https://fintechprimitives.com/docs/api/#create-a-payment)

#### Create a Nach Payment

```javascript
async function createNachPayment() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.payments().createNachPayment({
            amc_order_ids: [68615],
            mandate_id: 153,
        })
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Create a Nach Payment reference](https://fintechprimitives.com/docs/api/#create-a-nach-payment)

#### Fetch a payment

```javascript
async function fetchPayment() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.payments().fetch(725)
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch a payment reference](https://fintechprimitives.com/docs/api/#fetch-a-payment)

#### List all payments

```javascript
async function fetcAllPayment() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.payments().fetchAll({})
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, List all payments reference](https://fintechprimitives.com/docs/api/#list-all-payments)

### MF Redemption Plans

#### Create a redemption plan

```javascript
async function createMfRedemptions() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_redemptions().create({
            mf_investment_account: "mfia_71abd0d0802e48b2a7253eec92956a73",
            folio_number: "A6O4H0BLSXYRM",
            amount: 10,
            scheme: "INF204K01UP4",
            units: null,
            user_ip: "10.0.128.12",
            server_ip: "126.1.10.1",
            source_ref_id: "fad6ca01-a002-46ab-8e5c-ea6fe195a5de",
            euin: null,
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create a redemption plan reference](https://fintechprimitives.com/docs/api/#create-a-redemption-plan)

#### Update a redemption plan

```javascript
async function updateMfRedemptions() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_redemptions().update({
            id: "44",
            state: "confirmed",
            consent: {
                mobile: "9876543212",
            },
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Update a redemption plan reference](https://fintechprimitives.com/docs/api/#update-a-redemption-plan)

#### Fetch a redemption plan by ID

```javascript
async function fetchMfRedemptions() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_redemptions().fetch("44")
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch a redemption plan by ID reference](https://fintechprimitives.com/docs/api/#fetch-a-redemption-plan-by-its-id)

#### List all redemption plans

```javascript
async function fetcAllMfRedemptions() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_redemptions().fetchAll({})
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, List all redemption plans reference](https://fintechprimitives.com/docs/api/#list-all-redemption-plans)

### MF Purchase Plans

#### Create a purchase plan

```javascript
async function createMfPurchasePlan() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_purchase_plans().create({
            mf_investment_account: "mfia_71abd0d0802e48b2a7253eec92956a73",
            scheme: "INF204K01UP4",
            frequency: "monthly",
            folio_number: "A6O4H0BLSXYRM",
            amount: 10,
            transaction_day: 2,
            number_of_installments: 12,
            installment_type: "systematic_purchase_installment",
            mandate_old_id: 24,
            auto_generate_installments: true,
            activate_after: null,
            initiated_by: "investor",
            initiated_via: "mobile_app",
            user_ip: "10.0.128.12",
            server_ip: "126.1.10.1",
            source_ref_id: "fad6ca01-a002-46ab-8e5c-ea6fe195a5de",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create a purchase plan reference](https://fintechprimitives.com/docs/api/#create-a-purchase-plan)

#### Update a purchase plan

```javascript
async function updateMfPurchasePlan() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_purchase_plans().update({
            id: "mfpord_a5711b0ec1ae44b2bea47ef0aa68d4db",
            state: "confirmed",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Update a purchase plan reference](https://fintechprimitives.com/docs/api/#update-a-purchase-plan)

#### Fetch a purchase plan by ID

```javascript
async function fetchMfPurchasePlan() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .mf_purchase_plans()
            .fetch("mfpord_9a050cac4f8143cf87a957acb77207f3")
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch a purchase plan by ID reference](https://fintechprimitives.com/docs/api/#fetch-a-purchase-plan-by-its-id)

#### List all purchase plans

```javascript
async function fetcAllMfPurchasePlan() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_purchase_plans().fetchAll({})
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, List all purchase plans reference](https://fintechprimitives.com/docs/api/#list-all-purchase-plans)

### KYC Checks

#### Create a kyc check

```javascript
async function createKycCheck() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.kyc_checks().create({
            pan: "AREPD1040N",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

#### Fetch a kyc check

```javascript
async function fetchKycCheck() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .kyc_checks()
            .fetch("5620fd1f-eb14-442e-b0ee-da96a6c305c0")
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch a kyc check reference](https://fintechprimitives.com/docs/api/#fetch-a-kyc-check)

#### Refetch a kyc check

```javascript
async function refetcKycCheck() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .kyc_checks()
            .refetch("5620fd1f-eb14-442e-b0ee-da96a6c305c0")
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Refetch a kyc check reference](https://fintechprimitives.com/docs/api/#refetch-a-kyc-check)

### KYC Requests

#### Create a kyc request

```javascript
async function createKycRequest() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.kyc_requests().create({
            pan: "K1PPG1998U",
            email: "raj@example.com",
            aadhaar_number: "1210",
            mobile: {
                isd: "+91",
                number: "8160597103",
            },
            name: "Rani Gupta",
            father_name: "Rajesh Gupta",
            spouse_name: "",
            mother_name: "Neha Gupta",
            gender: "male",
            date_of_birth: "1980-10-19",
            country_of_birth: "in",
            marital_status: "unmarried",
            residential_status: "resident_individual",
            occupation_type: "private_sector",
            address: {
                line_1: "E/&02",
                line_2: "Opp SBI ATM",
                city: "Delhi",
                pincode: "110001",
                country: "in",
                proof: "4192de0d-165f-458e-89ec-d4334b370256",
                proof_back: "771a4d57-5447-4b1e-b4b6-dcb6049bda8c",
                proof_type: "passport",
                proof_number: "JXXXXXX0",
                proof_issue_date: "2004-10-20",
                proof_expiry_date: "2020-10-20",
            },
            geolocation: {
                latitude: 12.354,
                longitude: 77.453,
            },
            bank_account: {
                account_holder_name: "Rani Gupta",
                account_number: "919017057965811",
                ifsc_code: "UTIB0003093",
                proof: "cc10460f-905d-4b37-8983-97a5a8afc07a",
            },
            identity_proof: "2f4d93e0-b700-41b8-b78e-e130224cfb03",
            signature: "434ceed567-53c5-3f68-ba3b-cbdc58526c64",
            photo: "946848da-50bb-4957-a940-c164c0c71172",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create a kyc request reference](https://fintechprimitives.com/docs/api/#create-a-kyc-request)

#### Fetch a kyc request

```javascript
async function fetchKycRequest() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .kyc_requests()
            .fetch("mfpord_9a050cac4f8143cf87a957acb77207f3")
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch a kyc request reference](https://fintechprimitives.com/docs/api/#fetch-a-kyc-request)

#### List all kyc requests

```javascript
async function fetcAllKycRequest() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.kyc_requests().fetchAll({})
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, List all kyc requests reference](https://fintechprimitives.com/docs/api/#list-all-kyc-requests)

#### Update a kyc request

```javascript
async function updateKycRequest() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.kyc_requests().update({})
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Update a kyc request reference](https://fintechprimitives.com/docs/api/#update-a-kyc-request)

### Esigns

#### Create an esign

```javascript
async function esignCreate() {
    const fpClient = new fp(options)
    //create
    try {
        const data = await fpClient.esigns().create({
            kyc_request: "c6b524ed-fcbd-4e37-9348-6fee95f7d997",
            postback_url: "http://localhost:3000",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create an esign reference](https://fintechprimitives.com/docs/api/#create-an-esign)

#### Fetch an esign

```javascript
async function fetchEsign() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .esigns()
            .fetch("8f05d378-3cf2-4e57-83c8-5ad767f21f12")
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Fetch an esign reference](https://fintechprimitives.com/docs/api/#fetch-an-esign)

### Parses

#### Create a parse

```javascript
async function parseCreate() {
    const fpClient = new fp(options)
    //create
    try {
        const data = await fpClient.parses().create({
            file: "file_fe8a573f4a6b4a68be04d26e7aa164a0",
            password: "password",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create a parse reference](https://fintechprimitives.com/docs/api/#create-a-parse)

#### Fetch a parse

```javascript
async function parseCreate() {
    const fpClient = new fp(options)
    //create
    try {
        const data = await fpClient.parses().create({
            file: "file_fe8a573f4a6b4a68be04d26e7aa164a0",
            password: "password",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch a parse reference](https://fintechprimitives.com/docs/api/#fetch-a-parse)

#### Map Parsed Folios

```javascript
async function mapParsedFolios() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.parses().mapParsedFolios({
            parse_operation_id: "parse_71a50be288154737ad6a3e53a27bf1c6",
            mf_investment_account_id: "mfia_798fa03aba614840b983609e89ed16f2",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Map Parsed Folios reference](https://fintechprimitives.com/docs/api/#map-parsed-folios)

### Files

#### Fetch a file

```javascript
async function fetchFile() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .files()
            .fetch("8f05d378-3cf2-4e57-83c8-5ad767f21f12")
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Fetch a file reference](https://fintechprimitives.com/docs/api/#fetch-a-file)

#### List all files

```javascript
async function fetchAllFile() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.files().fetchAll()
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, List all files reference](https://fintechprimitives.com/docs/api/#list-all-files)

### MF Switches

#### Create a MF Switch

```javascript
async function createMfSwitch() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_switches().create({
            mf_investment_account: "mfia_189111b00566431db0dace5332db519c",
            folio_number: "15075102",
            amount: 10000,
            switch_out_scheme: "INF273K01FQ0",
            switch_in_scheme: "INF171K07FQ0",
            units: null,
            user_ip: "10.0.128.12",
            server_ip: "126.1.10.1",
            source_ref_id: "fad6ca01-a002-46ab-8e5c-ea6fe195a5de",
            euin: null,
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create a MF Switch reference](https://fintechprimitives.com/docs/api/#create-a-mf-switch)

#### Update a MF Switch

```javascript
async function updateMfSwitchService() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_switches().update({
            id: "mfs_4b53c94f99f1412c88ae42b11eec8312",
            state: "confirmed",
            consent: {
                email: "mfp@cybrilla.com",
                isd_code: "91",
                mobile: "9008580644",
            },
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Update a MF Switch reference](https://fintechprimitives.com/docs/api/#update-a-mf-switch)

#### Fetch a MF Switch

```javascript
async function fetchMfSwitchService() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .mf_switches()
            .fetch("mfs_4b53c94f99f1412c88ae42b11eec8312")
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch a MF Switch reference](https://fintechprimitives.com/docs/api/#fetch-a-mf-switch)

#### List all MF Switches

```javascript
async function fetcAllMfSwitchService() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_switches().fetchAll({})
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, List all MF Switches reference](https://fintechprimitives.com/docs/api/#list-all-mf-switches)

### MF Settlement Details

#### Create a MF Settlement Detail

```javascript
async function createMfSettlementDetail() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_settlement_details().create({
            mf_purchase: "mfp_621f8a91658b41c3b1f41f005dc393b6",
            payment_type: "netbanking",
            utr_number: "UTB123312",
            bank_account_number: "999900002222",
            bank_ifsc: "UTIB0003098",
            beneficiary_account_number: "1233453",
            beneficiary_account_title: "PMF MF Collection A/c",
            beneficiary_bank_name: "Amc Bank Name",
            settlement_processed_at: "2022-03-17T06:30:09+05:30",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create a MF Settlement Detail reference](https://fintechprimitives.com/docs/api/#create-a-mf-settlement-detail)

#### Update a MF Settlement Detail

```javascript
async function updateMfSettlementDetail() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_settlement_details().update({
            id: "mfsd_3c496b27ece044418e7eda9e101875e1",
            utr_number: "UTB123312",
            settlement_processed_at: "2022-03-17T06:30:09",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Update a MF Settlement Detail reference](https://fintechprimitives.com/docs/api/#update-a-mf-settlement-detail)

#### Fetch a MF Settlement Detail

```javascript
async function fetchMfSettlementDetail() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .mf_settlement_details()
            .fetch("mfsd_3c496b27ece044418e7eda9e101875e1")
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch a MF Settlement Detail reference](https://fintechprimitives.com/docs/api/#fetch-a-mf-settlement-detail)

#### List all MF Settlement Details

```javascript
async function fetcAllMfSettlementDetail() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_settlement_details().fetchAll({
            mf_purchase: "mfp_b6874a51adf64109bb6e19129e5e7556",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, List all MF Settlement Details reference](https://fintechprimitives.com/docs/api/#list-all-mf-settlement-details)

### MF Redemptions

#### Create a MF Redemption

```javascript
async function createMfRedemptions() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_redemptions().create({
            mf_investment_account: "mfia_71abd0d0802e48b2a7253eec92956a73",
            folio_number: "A6O4H0BLSXYRM",
            amount: 10,
            scheme: "INF204K01UP4",
            units: null,
            user_ip: "10.0.128.12",
            server_ip: "126.1.10.1",
            source_ref_id: "fad6ca01-a002-46ab-8e5c-ea6fe195a5de",
            euin: null,
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create a MF Redemption reference](https://fintechprimitives.com/docs/api/#create-a-mf-redemption)

#### Update a MF Redemption

```javascript
async function updateMfRedemptions() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_redemptions().update({
            id: "44",
            state: "confirmed",
            consent: {
                mobile: "9876543212",
            },
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Update a MF Redemption reference](https://fintechprimitives.com/docs/api/#update-a-mf-redemption)

#### Fetch a MF Redemption

```javascript
async function fetchMfRedemptions() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_redemptions().fetch("44")
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch a MF Redemption reference](https://fintechprimitives.com/docs/api/#fetch-a-mf-redemption)

#### List all MF Redemptions

```javascript
async function fetcAllMfRedemptions() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_redemptions().fetchAll({})
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, List all MF Redemptions reference](https://fintechprimitives.com/docs/api/#list-all-mf-redemptions)

### MF Redemption Plans

#### Create a MF Redemption Plan

```javascript
async function createMfRedemptionPlan() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_redemption_plans().create({
            mf_investment_account: "mfia_189111b00566431db0dace5332db519c",
            folio_number: "15075102",
            amount: 10000,
            scheme: "INF173K01FQ0",
            frequency: "monthly",
            transaction_day: 2,
            number_of_installments: 5,
            initiated_by: null,
            initiated_via: null,
            user_ip: "10.0.128.12",
            server_ip: "126.1.10.1",
            source_ref_id: "fad6ca01-a002-46ab-8e5c-ea6fe195a5de",
            euin: null,
            consent: {
                email: "mfp@cybrilla.com",
                isd_code: "91",
                mobile: "9008580644",
            },
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create a MF Redemption Plan reference](https://fintechprimitives.com/docs/api/#create-a-mf-redemption-plan)

#### Fetch a MF Redemption Plan

```javascript
async function fetchMfRedemptionPlan() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .mf_redemption_plans()
            .fetch("mfpord_9a050cac4f8143cf87a957acb77207f3")
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch a MF Redemption Plan reference](https://fintechprimitives.com/docs/api/#fetch-a-mf-redemption-plan)

#### List all MF Redemptions Plans

```javascript
async function fetcAllMfRedemptionPlan() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mf_redemption_plans().fetchAll({})
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, List all MF Redemptions Plans reference](https://fintechprimitives.com/docs/api/#list-all-mf-redemptions-plans)

### Transactions

#### List all transactions

```javascript
async function fetcAllTransaction() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.transactions().fetchAll({
            folios: "INF173K01EZ4",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, List all transactions reference](https://fintechprimitives.com/docs/api/#list-all-transactions)

### File Operations

#### Create a file operation

```javascript
async function createFileOperation() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.file_operations().create({
            type: "transaction_processing",
            file: "bf8253b0-c302-4715-974b-87a8d7a9efc3",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create a file operation reference](https://fintechprimitives.com/docs/api/#create-a-file-operation)

#### Fetch a file operation

```javascript
async function fetchFileOperation() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .file_operations()
            .fetch("mfpord_9a050cac4f8143cf87a957acb77207f3")
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch a file operation reference](https://fintechprimitives.com/docs/api/#fetch-a-file-operation)

### SIPs

#### Create a SIP

```javascript
async function createSip() {
    const fpClient = new fp(options)
    const orders = {
        orders: [
            {
                isin: "INF204KA1B64",
                amount: 10000,
                start_day: "2",
                frequency: "MONTHLY",
                installments: 20,
                mandate_id: 23,
                source_ref_id: "0876789",
                user_ip: "192.168.2.92",
                server_ip: "192.168.2.95",
            },
        ],
    }

    try {
        const data = await fpClient.sips().create(orders, 123)
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create investor reference](https://fintechprimitives.com/docs/api/#create-a-sip)

#### Modify a SIP

```javascript
async function updateSip() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.sips().update(
            {
                operation: "update",
                data: {
                    mandate_id: "DQ12",
                },
            },
            123,
            457
        )
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Modify a SIP reference](https://fintechprimitives.com/docs/api/#modify-a-sip)

#### Fetch a SIP

```javascript
async function fetchSip() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.sips().fetch(123, 456)
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch a SIP reference](https://fintechprimitives.com/docs/api/#fetch-a-sip)

#### Fetch installments of a SIP

```javascript
async function fetchInstallmentsSip() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.sips().fetchInstallmentsSip(123, 456)
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch installments of a SIP reference](https://fintechprimitives.com/docs/api/#fetch-installments-of-a-sip)

#### List all SIPs

```javascript
async function fetcAllSip() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.sips().fetchAll({}, 123)
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, List all SIPs reference](https://fintechprimitives.com/docs/api/#list-all-sips)

### Mandates

#### Create a mandate (eNACH)

```javascript
async function createMandateService() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mandates().create({
            mandate_type: "E_MANDATE",
            bank_account_id: 1,
            mandate_limit: 100000,
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create a mandate (eNACH) reference](https://fintechprimitives.com/docs/api/#create-a-mf-purchase)

#### Authorize a mandate (eNACH)

```javascript
async function authorizeMandateService() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mandates().authorize({
            mandate_id: 153,
            payment_postback_url: "https://example.com/",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Authorize a mandate (eNACH) reference](https://fintechprimitives.com/docs/api/#authorize-a-mandate-enach)

#### Fetch a mandate

```javascript
async function fetchMandateService() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mandates().fetch(153)
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch a mandate reference](https://fintechprimitives.com/docs/api/#fetch-a-mandate)

#### List all mandates

```javascript
async function fetchAllMandateService() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mandates().fetchAll({})
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, List all mandates reference](https://fintechprimitives.com/docs/api/#list-all-mandates)

#### Cancel a mandate

```javascript
async function cancelMandateService() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.mandates().cancel(153)
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Cancel a mandate reference](https://fintechprimitives.com/docs/api/#cancel-a-mandate)

### Investor Reports

#### Generate holdings report

```javascript
async function fetchHoldingsInvestorReport() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.investor_reports().fetchHoldings({
            investment_account_id: 467,
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Generate holdings report reference](https://fintechprimitives.com/docs/api/#generate-holdings-report)

#### Capital gains report

```javascript
async function fetchAllCapitalGainsInvestorReport() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.investor_reports().fetchCapitalGains({
            mf_investment_account: "mfia_689893b9596e4ab5acb612f179496540",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Capital gains report reference](https://fintechprimitives.com/docs/api/#capital-gains-report)

#### Scheme wise returns

```javascript
async function fetchSchemewiseReturns() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.investor_reports().fetchSchemewiseReturns({
            mf_investment_account: "mfia_689893b9596e4ab5acb612f179496540",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Scheme wise returns reference](https://fintechprimitives.com/docs/api/#scheme-wise-returns)

#### Investment account returns

```javascript
async function fetchInvestmentAccountReturns() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .investor_reports()
            .fetchInvestmentAccountReturns({
                mf_investment_account: "mfia_689893b9596e4ab5acb612f179496540",
            })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Investment account returns reference](https://fintechprimitives.com/docs/api/#investment-account-returns)

### Other Reports

#### Transaction type wise amount summary report

```javascript
async function fetchTransactionTypeWiseAmountSummary() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .other_reports()
            .fetch_transaction_type_wise_amount_summary({
                partner: "ARN-98783",
                traded_on_from: "2000-01-01",
                traded_on_to: "2021-07-07",
            })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Transaction type wise amount summary report reference](https://fintechprimitives.com/docs/api/#transaction-type-wise-amount-summary-report)

#### Fund scheme category wise AUM summary report

```javascript
async function fetchfundSchemeCategoryWiseAumSummary() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .other_reports()
            .fund_scheme_category_wise_aum_summary({
                partner: "ARN-98783",
                traded_on_from: "2000-01-01",
                traded_on_to: "2021-07-07",
            })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fund scheme category wise AUM summary report reference](https://fintechprimitives.com/docs/api/#fund-scheme-category-wise-aum-summary-report)

#### Transaction list report

```javascript
async function fetchtransactionList() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.other_reports().transaction_list({
            partner: "ARN-98783",
            traded_on_from: "2000-01-01",
            traded_on_to: "2021-07-07",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Transaction list report reference](https://fintechprimitives.com/docs/api/#transaction-list-report)

#### Investor list report

```javascript
async function fetchinvestorList() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.other_reports().investor_list({
            partner: "ARN-98783",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Investor list report reference](https://fintechprimitives.com/docs/api/#investor-list-report)

#### Mf Purchase list report

```javascript
async function fetchMfPurchaseList() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.other_reports().mf_purchase_list({})
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Mf Purchase list report reference](https://fintechprimitives.com/docs/api/#mf-purchase-list-report)

#### Mf Redemption list report

```javascript
async function fetchMfRedemptionList() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.other_reports().mf_redemption_list({})
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Mf Redemption list report reference](https://fintechprimitives.com/docs/api/#mf-redemption-list-report)

### Bank Account Verification

#### Create Bank Verification

```javascript
async function createBankAccountVerification() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.bank_account_verifications().create({
            bank_account: "710",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Create Bank Verification reference](https://fintechprimitives.com/docs/api/#create-bank-verification)

#### Fetch Bank Account Verification by ID

```javascript
async function fetchBankAccountVerification() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient
            .bank_account_verifications()
            .fetch("bav_bca82dad078a43e38b853058c8ab48dc")
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch Bank Account Verification by ID reference](https://fintechprimitives.com/docs/api/#fetch-bank-account-verification-by-id)

#### Fetch all Bank Account Verifications

```javascript
async function fetchAllBankAccountVerification() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.bank_account_verifications().fetchAll({
            status: ["completed"],
            reason: ["digital_verification"],
            confidence: ["very_low"],
        })
        console.log(data)
    } catch (e) {
        console.log("error", e.error)
    }
}
```

[FPDocs, Fetch all Bank Account Verifications reference](https://fintechprimitives.com/docs/api/#fetch-all-bank-account-verifications)

### Authentication

#### Tenant Authentication

```javascript
async function fetchTenantToken() {
    const options = {
        hostUrl: "https://s.finprim.com/",
    }
    const fpClient = new fp(options)
    try {
        const data = await fpClient.authentication().fetchTenantToken({
            client_id: "robox-api",
            client_secret: "",
            grant_type: "",
            tenant: "robox",
        })
        console.log(data)
    } catch (e) {
        console.log("error", e)
    }
}
```

[FPDocs, Tenant Authentication reference](https://fintechprimitives.com/docs/api/#token-object)

### Users

#### Create User

```javascript
async function createUser() {
    const fpClient = new fp(options)
    const params = {
        username: "PAN",
        enabled: true,
        attributes: {
            fp_user_type: "investor",
            name: "TEST",
            mobile_number: "97456623451",
            pan: "PAN",
            completed_step: "registration_details",
            fp_campaign_id: "999",
            isonboarded: "false",
        },
    }

    try {
        const data = await fpClient.users().createUser(params)
        console.log(data)
    } catch (e) {
        console.log(e)
    }
}
```

[FPDocs, Create User reference](https://fintechprimitives.com/docs/api/#users-early-access)

#### Create User (Admin)

```javascript
async function adminCreateUser() {
    const fpClient = new fp(options)
    const params = {
        username: "931",
        enabled: true,
        attributes: {
            fp_user_type: "investor",
            name: "Rick",
            mobile_number: "97456623451",
            pan: "PAN",
            completed_step: "registration_details",
            fp_campaign_id: "999",
            isonboarded: "false",
        },
    }

    try {
        const data = await fpClient.users().adminCreateUser(params)
        console.log(data)
    } catch (e) {
        console.log(e)
    }
}
```

#### Fetch User (self)

```javascript
async function fetchUser() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.users().fetchUser()
        console.log(data)
    } catch (e) {
        console.log(e)
    }
}
```

[FPDocs, Fetch User (self) reference](https://fintechprimitives.com/docs/api/#users-early-access)

#### Update User

```javascript
async function updateUser() {
    const fpClient = new fp(options)
    const params = {
        username: "01234",
        enabled: true,
        attributes: {
            fp_user_type: "investor",
            fp_identifier: "01234",
            mobile_number: "97456623451",
            fp_campaign_id: "999",
            isonboarded: "true",
            test: "test",
        },
    }

    try {
        const data = await fpClient.users().updateUser(params)
        console.log(data)
    } catch (e) {
        console.log(e)
    }
}
```

[FPDocs, Update User reference](https://fintechprimitives.com/docs/api/#users-early-access)

#### Update User (Admin)

```javascript
async function adminUpdateUser() {
    const fpClient = new fp(options)
    const params = {
        username: "01234",
        enabled: true,
        attributes: {
            fp_user_type: "investor",
            fp_identifier: "01234",
            mobile_number: "97456623451",
            fp_campaign_id: "999",
            isonboarded: "true",
        },
    }

    try {
        const data = await fpClient
            .users()
            .adminUpdateUser("404f9a73-d08c-4236-bc49-528424176ee8", params)
        console.log(data)
    } catch (e) {
        console.log(e)
    }
}
```

#### Search User

```javascript
async function searchUser() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.users().searchUser({
            username: "739",
        })
        console.log(data)
    } catch (e) {
        console.log(e)
    }
}
```

[FPDocs, Search User reference](https://fintechprimitives.com/docs/api/#users-early-access)

#### Search User (Admin)

```javascript
async function adminSearchUser() {
    const fpClient = new fp(options)
    try {
        const data = await fpClient.users().adminSearchUser({
            username: "739",
        })
        console.log(data)
    } catch (e) {
        console.log(e)
    }
}
```
