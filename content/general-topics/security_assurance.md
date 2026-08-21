# Security Assurance

## Compliance at a Glance

| Aspect | Details |
|--------|---------|
| **Certification** | ISO 27001 Certified |
| **Data Residency** | India region only (Data stored within Indian jurisdiction) |
| **Encryption at Rest** | AES-256-GCM |
| **Encryption in Transit** | TLS 1.2+ with strong ciphers |

> **ISO 27001 Certificate:** [View Certificate](/images/cybrilla-iso-27001-2022-cert.pdf)

---

#### 1. Organizational security
Cybrilla has implemented an Information Security Management System (ISMS) framework and obtained **ISO 27001 Certification**. Our policies ensure the security, availability, integrity, and confidentiality of customer data.  

**Employee background checks:** We verify each employee's background by checking criminal records, past employment, and education through reputable external agencies.  

**Security Awareness & Training:** All new employees at Cybrilla receive training in information security, privacy, and compliance. They then undergo tests to determine areas that may require additional training. Ongoing education on these topics is provided through internal community updates.
#### 2. Hosted Service :
Cybrilla operates as a SaaS platform hosted on a Cloud Infrastructure Provider (AWS), which is empanelled by the Ministry of Electronics and Information Technology (MeitY). Cybrilla follows SEBI’s Cloud Adoption Framework guidelines for regulated entities and adheres to CIS benchmarks security practices to consistently secure operating systems, databases, and network devices.

#### 2.1 Data Localization & Regional Residency
**Data Residency Confirmation:** All customer data is stored exclusively within the **India region**. Cybrilla ensures:
- All infrastructure, databases, and storage remain within Indian jurisdiction
- No data is replicated or transferred outside India without explicit customer consent
- Data localization requirements mandated by Indian regulations are met
- Audit trails verify data locality

This ensures your data remains within India at all times, addressing data sovereignty and compliance requirements.

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
**At Rest:** All data stored at rest is encrypted with AES-256-GCM (Galois/Counter Mode), an industry-standard authenticated encryption algorithm.    
**In Transit:** Data in transit is secured using TLS 1.2 or higher with strong ciphers (currently TLS 1.3).  
**In Use:** Confidential computing solution is utilised to protect data in use or in process.  

#### 5. Data Security

 5.1 Secure by Design
Cybrilla's SDLC policy adheres to secure coding guidelines and uses code analysers,vulnerability scanners, and manual reviews to identify security issues. Our OWASP-based framework mitigates threats such as SQL injection, XSS, and DDoS attacks.
##### 5.2 Encryption
**At Rest:** Sensitive customer data is encrypted with AES-256-GCM (Galois/Counter Mode), providing authenticated encryption that ensures both confidentiality and integrity of stored data.  
**In Transit:** We protect all customer data transmitted over public networks with Transport Layer Security (TLS 1.2 or higher) with strong ciphers for web and API access. Current standard is TLS 1.3. This ensures secure connections by authenticating both parties and encrypting transferred data.  
**In Use:** Cybrilla employs confidential computing solutions to secure data during processing and protect sensitive information while in use.  
##### 5.3 Key Management
Cybrilla manages encryption keys through a secure key management system. Data encryption keys are further secured by master keys, stored separately with restricted access.  
**Algorithms:**. 
Cybrilla employs advanced encryption algorithms to ensure data security:
  - **AES-256-GCM** for data at rest
  - **RSA** for key management
  - **SHA** for data integrity
  - **TLS 1.2+** for data in transit (current standard: TLS 1.3) 

##### 5.4 Network Security
Network security devices such as VPNs, WAFs, DDoS protection, Network Security Groups, and intrusion detection systems protect IT infrastructure from threats. Cloud infrastructure uses network micro-segmentation to isolate workloads and apply detailed security policies, reducing attack surfaces. Production, Staging, QA, and Development environments are fully isolated for secure operation.

##### 5.5 Endpoint Security
All workstations assigned to Cybrilla employees, both full-time and part-time, operate on current versions of their operating systems and are equipped with antivirus and EDR software. These workstations adhere to stringent security standards, ensuring they are correctly configured, patched, and consistently tracked and monitored. Endpoint security measures include:  
- Regular application of the latest security patches and updates to mitigate vulnerabilities.
- Installation of anti-virus and anti-malware software to protect against various threats.
- Implementation and monitoring of security configurations that conform to industry best practices to fortify endpoints against attacks. 

##### 5.6 Logging & Security Operation Centre (SOC) Monitoring
- **Log Collection & Analysis:** Cybrilla collects and analyzes logs from all systems, applications, and network devices
- **Security Posture Management:** Continuous security posture monitoring with security alerts and incident management
- **Threat Detection:** Real-time monitoring of infrastructure for potential security threats and anomalous activities
- **Log Retention:** Log retention policies are maintained as per SEBI and regulatory guidelines
- **Event Monitoring:** Cybrilla monitors security events to detect unauthorized activities, changes, access, and data transmission. Security logs are checked for anomalies. Critical system and network capacity is continuously monitored to ensure resilience, availability, and attack detection  

##### 5.7 Data Retention & Secure Disposal
**Cloud Storage:** All customer data is stored exclusively in cloud infrastructure. We do not maintain on-premise data centers.

**Data Retention:** Cybrilla retains customer data and certain logs as required by regulatory requirements per our data retention policy. Beyond the retention period mandated by regulations, data deletion follows customer requests.

**Data Deletion Upon Customer Request:** Cybrilla ensures customers have control over their data lifecycle:
- Customers can request data deletion at any time (subject to regulatory retention requirements)
- Data is securely deleted from all systems upon verified customer request
- A confirmation of deletion is provided to the customer after the process is complete

**Secure Disposal Policy:** When data reaches the end of its retention period or upon customer termination:
- Data is permanently deleted from all production systems
- Backups containing customer data are securely disposed of
- Encryption keys are destroyed after data deletion
- Audit logs confirm complete data removal from all systems and backups

This ensures complete data sovereignty and compliance with data protection regulations.

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

---

## Common Security Questions

#### Q: Where is our data stored?
**A:** All customer data is stored exclusively in the India region. Data remains within Indian jurisdiction at all times and is never transferred outside India without explicit consent.

#### Q: What encryption is used for data at rest?
**A:** We use **AES-256-GCM** (Galois/Counter Mode), an authenticated encryption algorithm that provides both confidentiality and integrity of stored data.

#### Q: What encryption is used for data in transit?
**A:** All data in transit is secured using **TLS 1.2 or higher** (current standard: TLS 1.3) with strong ciphers. This applies to all API calls, web access, and inter-service communication.

#### Q: Is the company ISO 27001 certified?
**A:** Yes, Cybrilla is **ISO 27001 Certified**. [View our ISO 27001 Certificate](/images/cybrilla-iso-27001-2022-cert.pdf). We maintain an Information Security Management System (ISMS) that ensures security, availability, integrity, and confidentiality of customer data.

#### Q: What infrastructure does Cybrilla use?
**A:** Cybrilla operates on a cloud infrastructure hosted exclusively in the India region. Our infrastructure provider (AWS) is empanelled by the Ministry of Electronics and Information Technology (MeitY). Cybrilla follows SEBI's Cloud Adoption Framework guidelines for regulated entities.

#### Q: What backup and disaster recovery measures are in place?
**A:** We have a comprehensive Business Continuity and Disaster Recovery (BCDR) policy that includes:
- Regular backups of critical data and systems
- Quick recovery procedures
- Regular testing and training of BCDR plans
- Crisis communication protocols

#### Q: How is access to customer data controlled?
**A:** Cybrilla enforces strict access control policies including:
- **Principle of Least Privilege:** Access based on job role with Role-Based Access Control (RBAC)
- **Multi-Factor Authentication (MFA):** Enabled for all users
- **Single Sign-On (SSO):** Centralized authentication using OAuth 2.0 and OpenID Connect
- **Privileged Access Management:** Separate access controls for production systems with complete audit logging


#### Q: How are vulnerabilities managed?
**A:** Cybrilla employs a comprehensive vulnerability management approach with multiple layers of protection:

- **Secure SDLC:** Our Software Development Lifecycle (SDLC) policy adheres to secure coding guidelines and uses code analyzers, vulnerability scanners, and manual reviews to identify security issues during development.
- **Internal Security Team:** Our dedicated internal security team manages all vulnerability identification, assessment, and remediation processes.
- **Vulnerability Management Solution:** We utilize an advanced vulnerability management platform that continuously scans and identifies vulnerabilities across our infrastructure and applications.
- **Patch Management:** Security patches are continuously identified, categorized, prioritized, tested, and deployed per our SLA to ensure timely remediation.
- **Penetration Testing:** Regular penetration tests are conducted on critical assets. CERT-In empanelled organizations conduct yearly VAPT (Vulnerability Assessment & Penetration Testing) assessments to validate our security posture.


#### Q: How is security monitoring performed?
**A:** We employ continuous security monitoring through:
- Centralized log collection and analysis for all systems and applications
- Security Operations Center (SOC) monitoring of security events for unauthorized activities and anomalies
- Web Application Firewall (WAF) to protect against web-based attacks
- Real-time threat detection and incident response processes