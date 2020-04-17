# Deprecation of existing staging instances : FAQs

1. What are we deprecating?<br>
We are deprecating existing staging instances which are not hosted on https://s.finprim.com. 
 
2. Why should I start using the new staging instance?<br>
New features, patches, security updates will be available only on new staging instances. Using new staging instances will ensure that you will always have access to the latest stable version of our APIs.


3. Will my production deployment be affected?<br>
No. This deprecation is concerned with staging instances only. Production instances will not get impacted by this change.


4. Will I be able to access existing APIs in the new staging instance also?<br>
Yes. 


5. Will the APIs change after I move to my new staging instance?<br>
Only the base url will change. All the APIs will remain the same. 


6. What is the IP address?<br>
IP Address :  104.211.244.201.<br>
Important note: We don’t recommend doing anything with this IP address. Please rely on the domain name as this might change in the future.


7. What is the base url and how do I handle the authentication?<br>
For tenant login we will issue  new private_api_key and  tenant_secret  for HMAC token generation.
There are two options to call the tenant login
* Option 1 (New and Recommended)<br>
Base URL: https://s.finprim.com<br>
Pass x-tenant-id(domain name of the new staging instance) as a http header in the tenant login api (api/auth/tenant/login)
And all other API calls can be made without having the subdomain in the URL

* Option 2 (Old and will be deprecated in the future)<br>
Base URL: https://&lt;sub domain name&gt;.s.finprim.com<br>
The current way of calling the tenant login api without any extra http headers will succeed.


8. What happens to my existing staging instance?<br>
Your existing staging instance will be shut down and you will not be able to access it.


9. Is the new staging instance dedicated or shared?<br>
A new dedicated staging instance will be set up for you.


10. I have other concerns. Whom do I contact?<br>
Please write an email to fpsupport@cybrilla.com explaining your concerns.
