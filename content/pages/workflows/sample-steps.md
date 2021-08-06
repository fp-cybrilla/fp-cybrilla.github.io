## Video KYC
----------------

> **Assumptions** - The below steps are performed using CVL and CAMS respectively.

- **Step 1 -**
  > User inputs PAN

- **Step 2 -**
  > A background check for KYC status through PAN using CVL API is performed. The API returns -
      - Name
      - KYC Status code - Registered / submitted / rejected / on hold / etc.
      - KYC Mode - informs whether the user is non KYC, eKYC or full KYC

- **Step 3 -**
  > Name returned by API can be compared to the name entered on the front end (validated at application layer level).

- **Step 4 -**
  1. If KYC compliant, user can proceed ahead.
  2. If non KYC compliant,
    - User is redirected to CAMS site to perform eKYC
    - User has to enter both Aadhaar and PAN, along with other details. (PAN is validated by CAMS through a web service connecting to NSDL).

- **Step 5A -**
  > If eKYC is a success, then the response is -
      - KYC status
      - PAN number
      - Other details including name

- **Step 5B -**
  > If eKYC is a failure, then the response is -
      - KYC status
      - PAN number
      - Error code
  > In case of PAN related errors, the error codes are -
      - EK-105 : Invalid PAN provided – Income Tax
      - EK-106 : PAN verification service failure
