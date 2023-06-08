---
title: Migrating from V1 SIPs to Purchase plans
---
## Migrating from V1 SIPs to Purchase plans


#### 1. SIP Creation
**Earlier**
`POST /api/oms/investment_accounts/:investment_account_id/orders/sips`
```json
{
  "orders": [
    {
      "isin": "INF204KA1B64",
      "amount": 10000,
      "start_day": "2",
      "frequency": "MONTHLY",
      "installments": 20,
      "folio_number":"1234567890",
      "mandate_id": 23,
      "generate_first_installment_now":"false",
      "source_ref_id": "0876789",
      "user_ip": "192.168.2.92",
      "server_ip": "192.168.2.95",
      "consent": 
      {
        "email": "mfp@cybrilla.com",
        "isd_code": "91",
        "mobile": "9008580644"
      }
    }
  ]
}
```
**Now**
`POST /v2/mf_purchase_plans`
```json
{
  "mf_investment_account": "mfia_798fa03aba614840b983609e89ed16f2",
  "scheme": "INF204KA1B64",
  "amount": 1000.0,
  "installment_day": 2,
  "frequency": "monthly",
  "number_of_installments": 20,
  "folio_number": "1234567890",
  "payment_method": "mandate",
  "payment_source": "man_89111b00566431db0dace538hgc",
  "generate_first_installment_now": false,
  "source_ref_id": "0876789",
  "user_ip": "192.168.2.92",
  "server_ip": "192.168.2.95"
  "systematic": true,
  "purpose": "children_education",
  "euin": "E1234",
  "initiated_by": "investor",
  "initiated_via": "mobile_app",
  "consent": 
  {
        "email": "mfp@cybrilla.com",
        "isd_code": "91",
        "mobile": "9008580644"
      }
}
```

#### 2. Change mandate of an SIP
**Earlier**
`PATCH /api/oms/investment_accounts/1/orders/sips/1`
```json
{
  "operation": "update",
  "data": {
    "mandate_id": "DQ12"
  }
}
```
**Now**
`PATCH /v2/mf_purchase_plans`
```json
{
	"plan":"mfpp_dbabb25ba34c48329dbfbeff70c846f0",
	"payment_source":"<new_mandate_id>"
}
```

#### 3.Cancel SIP
**Earlier**
`PATCH /api/oms/investment_accounts/1/orders/sips/1`
```json
{
  "operation": "deactivate",
}
```
**Now**
`POST /v2/mf_purchase_plans/mfpp_dbabb25ba34c48329dbfbeff70c846f0/cancel`

#### 4. Cancel next installment 
**Earlier**
`PATCH /api/oms/investment_accounts/1/orders/sips/1`
```json
{
  "operation": "deactivate",
}
```
**Now**
`POST /v2/mf_purchase_plans/mfpp_dbabb25ba34c48329dbfbeff70c846f0/skip_instructions`
```json
{
	"from":"<date>",
	"to":"<date>"//optional
}
```

#### 5. Fetch SIP
**Earlier**
`GET /api/oms/investment_accounts/1/orders/sips/1`

**Now**
`GET /v2/mf_purchase_plans/mfpp_dbabb25ba34c48329dbfbeff70c846f0`

#### 6. Fetch installments of a SIP
**Earlier**
`GET /api/oms/investment_accounts/1/orders/sips/1/installments`

**Now**
`GET /v2/mf_purchases?plan=mfpp_dbabb25ba34c48329dbfbeff70c846f0`

#### 7. List all SIPs
**Earlier**
`GET /api/oms/investment_accounts/:investment_account_id/orders/sips`

**Now**
`GET /v2/mf_purchase_plans?mf_investment_account=mfia_14bafabfbfbc423d9b54412dd577981b`





