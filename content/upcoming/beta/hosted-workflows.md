---
title: Hosted Workflows
---
## Hosted Workflows

### Introduction

Hosted workflows allow a user to perform a specifc activity while buying or selling mutual funds. For example an investor needs to establish his\her identity as per KYC guidelines before an investment can be done. FP brings these activities as independent hosted workflows that can be plugged readily into any application. 

You can use these workflows directly via URLs, embed in any of your application to quickly start distributing mutual funds.

> 1. Ensure you have all the prerequisites as per [go live checklist](/going-live/checklist/). 
> 2. Refer [this script](/upcoming/beta/embed-hosted-workflow) to embed the hosted workflows.

#### Branding guidelines for hosted workflows

If you wish to apply your brand guidelines, email the below details to us at [fpsupport@cybrilla.com](mailto:fpsupport@cybrilla.com) as part of go live checklist.

1. Your website URL (* For color theme*)
2. Images (in svg or png or jpg format)
   - Business logo under 200 KB (*Width between 100px and 200px & height between 20px and 40px*)
   - Favicon under 1 KB (*16px X 16px*)


### Workflows

#### KYC

Mutuals funds in India are regulated by SEBI (Securities and Exchange Board of India) and it mandates all the financial intermediaries to follow certain guidelines in establishing and verifying the identity of an investor before accepting any investments from them, which is commonly called as KYC (Know your customer). 

KYC workflow supports submission of online video KYC application


1. Register investor 
   - Register with a PAN if you are an Indian resident individual
   - Log in with OTP on registered email\mobile
   - Provide details necessary to setup investments 
2. Choose proof of address
3. If proof of adderss is aadhaar, then perform digilocker account verification to complete KYC application
4. If the proof of address is other than aadhaar, record an online IPV video to complete KYC application
5. E-sign the KYC application


<div>
<button class="btn btn-primary inline-block w-auto px-4" onclick="handleOpen('https://prueba.sandbox.fpapps.io/kyc?mtm_campaign=beta_live')">
	Try KYC workflow
</button>
</div> 

#### Invest

Invest workflow allows an investor to buy mutual funds. It performs below activities:

1. Choose a fund scheme offered by your service provider (AMC\Distributor\Advisor)
2. Select a folio to invest
   - View list of all existing folios with details and select
   - Or create a new folio
3. Place an investment order
   - **Purchase** one time  or as a recurring purchase plan
   - **Switch** amount invested in an existing scheme to a new schme - one time or as a recurring plan
4. Pay investment amount
   - Pay online via Netbanking or UPI
   - Setup auto pay for recurring purchase plans

If the investor has not setup an investment account earlier, invest workflow will facilitate below setup activities:

1. Verify if the investor's account is setup
2. Setup investment account
   - Register with a PAN if you are an Indian resident individual
   - Log in with OTP on registered email\mobile
   - Provide details necessary to setup investments 
     - Includes personal, financial, bank, Video KYC, communication and nomination information


<div>
<button class="btn btn-primary inline-block w-auto px-4" onclick="handleOpen('https://prueba.sandbox.fpapps.io/checkout?mtm_campaign=beta_live')">
	Try invest workflow
</button>
</div>

