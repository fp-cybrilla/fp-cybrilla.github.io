---
title: Pause an SIP
---
## Pause installments of an existing SIP
> The use case explained here is implemented via APIs which are in Alpha Stage. The API specs might change.

Using FP APIs, you can pause a SIP indefinitely or you can pause an SIP for a specific period of time.

#### 1. Create a skip instruction
Let us assume that you have existing active SIP with purchase plan id = `mfpp_dbabb25ba34c48329dbfbeff70c846f0`. This is how you can pause this SIP by creating a [skip instruction] (https://fintechprimitives.com/docs/api/#skip-installments-via-skip-instructions).

`POST /v2/mf_purchase_plans/psi_dbabb25ba34c48329dbfbeff70c846f0/skip_instructions`
```json
{
	"from":"2022-09-01",
	"to":"2022-11-01"
}
```
Response
```json
# Displaying only a part of the object for brevity
{
    "object":"skip_instruction",
    "id":"psi_dbabb25ba34c48329dbfbeff70c846f0",
    "plan":"mfpp_dbabb25ba34c48329dbfbeff70c846f0",
    "state":"active",
    "from":"2022-09-01",
    "to":"2022-11-01",
    "remaining_installments":2,
    "skipped_installments":0,
}
```
Upon calling this API, a skip instruction is created. All the installments having their installment dates between `from` and `to` date range will be marked as `cancelled`. If you want to pause indefinitely, you can only provide `from` date while creating a skip instruction against the plan

Note: Pause SIP feature is not supported for BSE SIPs.

#### 2. List all MF Purchases by skip instruction id
Use `GET /v2/mf_purchases?skip_instruction=psi_dbabb25ba34c48329dbfbeff70c846f0` [API](https://fintechprimitives.com/docs/api/#list-all-mf-purchases) to list all installments skipped due to a particular skip instruction.

#### 3. Cancel Skip instruction
If you want to resume an SIP, you can cancel the skip instruction.
Example: `POST /v2/mf_purchase_plans/skip_instructions/psi_dbabb25ba34c48329dbfbeff70c846f0/cancel`




