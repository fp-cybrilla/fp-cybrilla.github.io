---
title: Pause an STP
---
## Pause installments of an existing STP

Using FP APIs, you can pause a STP indefinitely or you can pause an STP for a specific period of time.

#### 1. Create a skip instruction

With the help of skip instructions you can pause your installments. For example if you have active STP with switch plan id `mfsp_c443474c228f4cf0a7f5ff1bad72431b`, This is how you can pause this STP by creating a skip instruction 

`POST /v2/mf_switch_plans/mfsp_c443474c228f4cf0a7f5ff1bad72431b/skip_instructions`
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
        "object":"plan_skip_instruction",
        "id":"psi_ab00cd7911fe4390a2b32519196d40f9",
        "plan":"mfsp_c443474c228f4cf0a7f5ff1bad72431b",
        "state":"active",
        "from":"2022-09-01",
        "to":"2022-11-01",
        "remaining_installments":2,
        "skipped_installments":0,
    }
```
Upon calling this API, a skip instruction is created. All the installments having their installment dates between  `from`  and  `to`  date range will be marked as  `cancelled`. If you want to pause indefinitely, you can only provide  `from`  date while creating a skip instruction against the plan.

Note: Pause STP feature is not supported for BSE STPs.

#### 2. List all MF Switches by skip instruction id
You can list all mf switch orders with skip instruction id using FP APIs. Use `GET /v2/mf_switches?skip_instruction=skip_dbabb25ba34c48329dbfbeff70c846f0`  [API](https://fintechprimitives.com/docs/api/#list-all-mf-switches) to list all installments skipped due to a particular skip instruction.

#### 3. Cancel Skip instruction
If you want to resume an STP and cancel the skip instruction, you can use

`POST /v2/mf_switch_plans/skip_instructions/skip_dbabb25ba34c48329dbfbeff70c846f0/cancel`
