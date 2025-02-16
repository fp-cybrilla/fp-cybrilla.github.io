---
title: Migrate offline folios
---
## Migrate offline folios
#### Learn how to bring offline folios linked to your MF distribution code into your FP account

If your investors have purchased mutual funds using your distribution code, but not using an MF app running on your FP account, you can bring in the folios of investors into your FP account. This will help investors get a complete view of all investments under your distribution code. Purchases via below channels can be migrated to your FP account

1. Fund house (AMC)
2. RTA branch offices
3. Any other online sites like MFU, MF Central, RTA websites
4. Assisted purchase by RM\Sales\EUINs using physical or any online modes like RTA or exchange systems

### How it works

1. FP will migrate all folios and associated transactions (buy\sell) using your daily MF reverse feed reports obtained from RTA
   1. Currently FP supports this `Resident individuals` only
2. Ensure below RTA feed files are setup for auto forward to opscybrilla@cybrilla.com from your email registered with RTA
   1. WBR2 in DBF
   2. WBR9 in csv
   3. MFSD 201 in DBF
   4. MFSD 211 in Excel
3. FP will migrate since inception MF reverse feed for one time to ensure all past folios are migrated into your FP account
4. FP will migrate newer folios on a daily basis

### Access migrated folios

1. FP will create `mf_folio` and link it with an MF investment account  `mf_investment_account`
   1. If the investor has onboarded on an MF App running on your FP Account, then the investor would have an MF investment account already for the PAN & holding pattern. In this case FP will link newly created `mf_folio` to existing `mf_investment_account`
2. If the investor has `NOT`  onboarded on an MF App running on your FP Account at the time of daily folio migration, then FP will create a new `mf_investment_account` for the PAN and holding pattern, link newly created `mf_folio`.
3. FP will create `mf_investment_account` for each PAN and holding pattern. Eg. Holding patterns like single, anyone_or_survivor etc.

> 1. Ensure you do not create multiple investor profiles (V1 or V2) for same PAN in your FP account
   > 1. If you have multiple investor profiles, it is likely that there could be multiple MF investment accounts for same PAN and holding pattern
> 2. When onboarding any investor, always check if an `mf_investment_account` exists for the [PAN and holding pattern](https://fintechprimitives.com/docs/api/#list-all-mf-investment-accounts). If yes, link the existing mf investement account object to investor profiles(V1 or V2).

### Failure scenarios

1. FP will not migrate folios, if an investor has multiple `mf_investment_account` for PAN and holding pattern
   1. You will need to close the duplicate `mf_investment_account` and FP will migrate the folios in the next schedule applicable

### Capabilities supported for migrated folios

1. View [folio](https://fintechprimitives.com/docs/api/#mf-folio-object) details
2. View [holdings and returns](https://fintechprimitives.com/docs/api/#investor-reports) of investor

> Note for any MF orders on migrated folios, ensure investor onboarding is completed
   

