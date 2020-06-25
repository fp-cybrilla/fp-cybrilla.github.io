# Required information about the investor
*All the data points needed for a kyc application*

### Data points

The following information about the investor needs to be collected for a successful kyc submission
1. Full name of the investor (`name`)
2. PAN number of the investor (`pan`)
3. Email ID and mobile number of the investor (`email`, `mobile`)
4. Date of birth (`date_of_birth`)
5. Last 4 digits of the Aadhaar number (`aadhaar_number`)
6. Father name or spouse name in full (`father_name`, `spouse_name`)
7. Mother name in full (`mother_name`)
8. Gender (`gender`)
9. Country of birth (`country_of_birth`)
10. Marital status (`marital_status`)
11. Residential status (currently we only support indian resident individual) (`residential_status`)
12. Occupation (`occupation_type`)
13. Address with proof (`address`)
14. PAN card copy (`identity_proof`)
15. Signature scan (`signature`)
16. Photo (`photo`)
17. Verification video (`ipv_video`)
18. Bank account details with a signed cancelled cheque copy (`bank_account`)
19. Geo location (`geolocation`)
20. Fatca/CRS self declaration (TBD)
21. Electronic signature on the application form

\*TBD: We will provide the field names when the APIs are released


### Accepted address proofs

The following address proofs are accepted currently. We will include more in the future.

|Address proof|Data required|
|-------------|-------------|
|Passport|1. Passport number <br> 2. Front page and back page scan of the passport <br> 3. Passport issue date and expiry date|
|Driving licence|1. Driving licence number <br> 2. Front scan of the licence <br> 3. Licence issue date and expiry date|
|Voter's identity card|1. ID card number <br> 2. Front page and back page scan of the ID|
