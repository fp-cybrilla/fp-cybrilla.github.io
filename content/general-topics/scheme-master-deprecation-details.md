---
title: Deprecated features of scheme master
---
## Deprecated features of scheme master

### Deprecated attributes that will be removed

| Deprecated Attributes |New Attribute |
|--|--|
|min_sip_amount <br><br>min_swp_amount<br><br>min_stp_in_amount|<br> min_installment_amount|
|max_sip_amount<br><br>max_swp_amount<br><br>max_stp_in_amount|<br>max_installment_amount|
|sip_multiples<br><br>swp_multiples<br><br>stp_in_amount_multiples|<br>amount_multiples|
|min_sip_installments<br><br>min_swp_installments<br><br>min_stp_out_installments|<br>min_installments|
|sip_frequency_data | [sip_frequency_specific_data](#frequency-specific-data)|
|swp_frequency_data|[swp_frequency_specific_data](#frequency-specific-data)|
|stp_frequency_data|[stp_frequency_specific_data](#frequency-specific-data)|

### Modification of data Types for amount/unit related attributes in Fund Scheme API

All amount/unit related attributes currently are of integer data type. At times, AMCs maintain decimal values for amounts especially for the `amount multiples`. FP will change to decimal data type for below attributes to enhance the accuracy in order collection. 

#### List of decimal type attributes in scheme master

* min_initial_investment
* min_additional_investment
* initial_investment_multiples
* max_initial_investment
* max_additional_investment
* additional_investment_multiples
* min_withdrawal_amount
* min_withdrawal_units
* max_withdrawal_amount
* max_withdrawal_units
* withdrawal_multiples
* withdrawal_multiples_units
* min_sip_amount
* min_swp_amount
* min_stp_in_amount
* max_sip_amount
* max_swp_amount
* max_stp_in_amount
* sip_multiples
* swp_multiples
* stp_in_amount_multiples
* min_switch_in_amount
* switch_in_amount_multiples

