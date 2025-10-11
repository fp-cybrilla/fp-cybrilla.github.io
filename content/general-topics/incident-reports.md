---
title: Incident Reports
---

## Incident Reports
#### Log of all incidents which impacted FP services

### Oct 2025
---

-  **Unavailability of few APIs**  
    [10th Oct] [Resolved]  
    For a duration of ~3 min from 18:16:38 IST to 18:19:37 IST, few FP APIs related to verification and onboarding returned 503 errors for few tenants.

    *Root cause*  
    A misconfiguration in our autoscaling setup resulted in these services being temporarily unavailable during a scaling event.

    *Resolution*  
    Immediate - The services were automatically rebalanced and fully operational in less than 3 min. No manual intervention was needed.  
    Long term - We are working on optimised autoscaling setup and improved service startup times.
