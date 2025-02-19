# Security Assurance
#### 1. Organizational security
Cybrilla has implemented an Information Security Management System (ISMS)framework and obtained ISO 27001 Certification. Our policies ensure the security,availability, integrity, and confidentiality of customer data.  
**Employee background checks:** We verify each employee's background by checking criminal records, past employment, and education through reputable external agencies.  
**Security Awareness & Training:** All new employees at Cybrilla receive training in information security, privacy, and compliance. They then undergo tests to determine areas that may require additional training. Ongoing education on these topics is provided through internal community updates.
#### 2. Hosted Service :
Cybrilla, an API platform provider, uses AWS Cloud Services Provider (CSP) and complies with SEBI’s Cloud Service Framework for regulated entities. AWS India is empanelled by the Ministry of Electronics and Information Technology (MeitY). Cybrilla adheres to CIS benchmark, NIST security practices and recommendations by AWS CSP to consistently secure operating systems, databases, and network devices.
#### 3. Identity & Access Management
Cybrilla enforces strict access control policies to minimize customer data risks.
  - **Principle of Least Privilege:** Any user access is enabled based on their job role.Role Based access control (RBAC) is enabled.  
  - **Principle of Need to know:** Access is limited to essential resources.     

##### 3.1 Single Sign-On (SSO). 
Cybrilla’s systems are integrated with the Cybrilla-managed SSO system, utilizing protocols like OAuth 2.0 and OpenID Connect. This setup provides secure authentication across multiple applications, reducing the need for multiple logins. 
##### 3.2 Multi-Factor Authentication (MFA) 
All user are enabled with Multi-Factor Authentication (MFA) across all systems to add a security layer beyond passwords. Compliance is continuously monitored.  
##### 3.3 Privileged Access 
Cybrilla oversees a privileged access group for production systems to ensure efficiency. All group activities are logged for auditing and review.  
##### 3.4 Strong Password Policy. 
Cybrilla enforces a strong password policy with requirements including:  
  - Minimum Length
  - Complexity
  - Expiration
  - Reuse Prevention
  - Account Lockout


#### 4. Multi-tenancy
The Cybrilla FP platform is a multi-tenant solution where infrastructure, computing, and storage resources are shared among customers, optimizing efficiency and reducing costs. Cybrilla enforces segregation controls for each tenant (customer) and implements effective encryption strategies to ensure tenant isolation and prevent unauthorized access.
##### 4.1 Security and Isolation
Despite shared resources, each tenant's data and activities are isolated through security measures and data segregation techniques. Strategies include:    
**Logical Isolation:** Data is logically isolated using database schema-level isolation or row-level tenant identifiers.  
**Tenant-Specific Access:** Data access is restricted to credentials specific to each tenant. The platform identifies tenants by their credentials and serves exclusive data accordingly.  
##### 4.2 Data Encryption
**At Rest:** All data stored at rest is encrypted with industry-standard algorithms (AES 256).    
**In Transit:** Data in transit is secured using protocols like TLS 1.3.  
**In Use:** Confidential computing solution is utilised to protect data in use or in process.  

#### 5. Data Security

 5.1 Secure by Design
Cybrilla's SDLC policy adheres to secure coding guidelines and uses code analysers,vulnerability scanners, and manual reviews to identify security issues. Our OWASP-based framework mitigates threats such as SQL injection, XSS, and DDoS attacks.
##### 5.2 Encryption
**In Transit:** We protect all customer data transmitted over public networks with strong encryption protocols. We require Transport Layer Security (TLS 1.3) with strong ciphers for web and API access. This ensures secure connections by authenticating both parties and encrypting transferred data.  
**At Rest:** Sensitive customer data is encrypted with 256-bit AES.  
**In Use:** Cybrilla uses confidential computing solutions from our Cloud Service Provider (CSP) to secure data during processing. We utilize M6A EC2 instance types built on the AWS Nitro system, which continuously monitors, protects, and verifies the instance hardware and firmware for enhanced security.  
##### 5.3 Key Management
We manage keys through our Key Management Service (KMS) solutions. Data encryption keys are further secured by master keys, stored separately with restricted access.  
**Algorithms:**. 
Cybrilla employs advanced encryption algorithms to ensure data security:
  - AES for data at rest
  - RSA for key management
  - SHA for data integrity
  - TLS for data in transit. 

##### 5.4 Network Security
Network security devices such as VPNs, WAFs, DDoS protection, Network Security Groups, and intrusion detection systems protect IT infrastructure from threats. Cloud infrastructure uses network micro-segmentation to isolate workloads and apply detailed security policies, reducing attack surfaces. Production, Staging, QA, and Development environments are fully isolated for secure operation.

##### 5.5 Endpoint Security
All workstations assigned to Cybrilla employees, both full-time and part-time, operate on current versions of their operating systems and are equipped with antivirus software. These workstations adhere to stringent security standards, ensuring they are correctly configured, patched, and consistently tracked and monitored. Endpoint security measures include:  
- Regular application of the latest security patches and updates to mitigate vulnerabilities.
- Installation of anti-virus and anti-malware software to protect against various threats.
- Implementation and monitoring of security configurations that conform to industry best practices to fortify endpoints against attacks. 

##### 5.6 Logging & Security Operation Centre(SOC) monitoring:
- Cybrilla collect and analyse logs using services like AWS CloudWatch, ELK Stack (Elasticsearch, Logstash, Kibana)
- We also use Centralized Security Posture Management tool (CSPM) which includes security alerts and incident management.
- AWS Guard Duty is configured to continuously monitor our EC2 instances and Kubernetes clusters for potential security threats or anomalous activities.
- Log retention policies are adhered as per SEBI guidelines.
- Cybrilla monitors security events to detect unauthorized activities, changes, access, and data transmission. Security logs of systems, applications, and network devices are checked for anomalies. Critical system and network capacity is continuously monitored to ensure resilience, availability, and attack detection.  

#### 6. Incident Management
Cybrilla has an Incident Management policy within its ISMS program to protect systems and data. We comply with CERT-In guidelines by notifying customers and CERT-In of any cyber-attacks, cybersecurity incidents, or breaches.

#### 7. Vulnerability & Patch Management
  - Cybrilla has an active Vulnerability & Patch Management policy and processes as part of its ISMS program.
  - Periodic vulnerability assessments are conducted on critical assets and infrastructure components like servers, networking systems, security devices, load balancers, and other IT systems. Vulnerabilities are categorized, prioritized,and addressed immediately per the SLA defined in the policy.
  - CERT-In empanelled organizations conduct yearly VAPT. Security patches are continuously identified, categorized, prioritized, tested, and deployed.

#### 8. Business Continuity & Disaster Recovery
Cybrilla has a comprehensive Business Continuity and Disaster Recovery (BCDR) policy as part of its ISMS program. This policy ensures that we can continue critical business operations during and after a disruptive incident. Our BCDR strategy includes:

  - Risk Assessment and Business Impact Analysis: We regularly conduct risk assessments and business impact analysis to identify potential threats and their impacts on our operations.
  - Contingency Planning: We develop and maintain detailed contingency plans that outline the steps to be taken during diYerent types of disruptions.
  - Data Backup and Recovery: We perform regular backups of critical data and systems, ensuring that they can be quickly restored in case of data loss or system failure.
  - Testing and Training: We conduct regular testing of our BCDR plans to ensure they are eYective and up-to-date. Additionally, we provide training to our employees on their roles and responsibilities during a disruption.
  - Crisis communication management : We have established Crisis communication protocols to keep stakeholders and customers informed during and after a disruptive event.

#### 9. Vendor Management
Cybrilla's Vendor Management policy ensures third-party vendors comply with security and privacy standards. This includes conducting thorough vendor risk assessments,incorporating specific security and privacy requirements in contracts, ongoing monitoring and audits of vendor compliance, periodic reviews of vendor performance and security practices, and established protocols for managing security incidents involving vendors.