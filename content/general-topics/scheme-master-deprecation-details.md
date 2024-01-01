---
title: Deprecated features of scheme master
---
## Deprecated features of scheme master


### Deprecated scheme related attributes that will be removed

Below attributes are now available in the [frequency specific data](https://fintechprimitives.com/docs/api/#frequency-specific-data) hash for each of the plan type (SIP\SWP\STP)

| Deprecated Attributes |New Attribute |
|--|--|
|min\_sip\_amount <br><br>min\_swp\_amount<br><br>min\_stp\_in\_amount|<br> min\_installment\_amount|
|max\_sip\_amount<br><br>max\_swp\_amount<br><br>max\_stp\_in\_amount|<br>max\_installment\_amount|
|sip\_multiples<br><br>swp\_multiples<br><br>stp\_in\_amount\_multiples|<br>amount\_multiples|
|min\_sip\_installments<br><br>min\_swp\_installments<br><br>min\_stp\_out\_installments|<br>min\_installments|
|sip\_frequency\_data | [sip\_frequency\_specific\_data](https://fintechprimitives.com/docs/api/#frequency-specific-data)|
|swp\_frequency\_data|[swp\_frequency\_specific\_data](https://fintechprimitives.com/docs/api/#frequency-specific-data)|
|stp\_frequency\_data|[stp\_frequency\_specific\_data](https://fintechprimitives.com/docs/api/#frequency-specific-data)|

### Modification of data Types for amount/unit related attributes in Fund Scheme API

All amount/unit related attributes currently are of integer data type. At times, AMCs maintain decimal values for amounts especially for the `amount multiples`. FP will change to decimal data type for below attributes to enhance the accuracy in MF order collection. 

#### List of decimal type attributes in scheme master

* min\_initial\_investment
* min\_additional\_investment
* initial\_investment\_multiples
* max\_initial\_investment
* max\_additional\_investment
* additional\_investment\_multiples
* min\_withdrawal\_amount
* min\_withdrawal\_units
* max\_withdrawal\_amount
* max\_withdrawal\_units
* withdrawal\_multiples
* withdrawal\_multiples\_units
* min\_sip\_amount
* min\_swp\_amount
* min\_stp\_in\_amount
* max\_sip\_amount
* max\_swp\_amount
* max\_stp\_in\_amount
* sip\_multiples
* swp\_multiples
* stp\_in\_amount\_multiples
* min\_switch\_in\_amount
* switch\_in\_amount\_multiples
* min\_switch\_out\_units
* switch\_out\_unit\_multiples
* switch\_out\_amount\_multiples

