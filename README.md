# Post-Quantum Cryptography (PQC, pqcrypto)

Selected links and resources relevant to post-quantum cryptography adoption.

* For a more research-oriented overview see e.g., [pqcrypto.org](https://pqcrypto.org) or
* [pqc-forum](https://groups.google.com/a/list.nist.gov/g/pqc-forum) mailing list

# Standardization

* [NIST Releases First 3 Finalized Post-Quantum Encryption Standards](https://www.nist.gov/news-events/news/2024/08/nist-releases-first-3-finalized-post-quantum-encryption-standards) (August 2024)
* [Call for Additional Digital Signature Schemes](https://csrc.nist.gov/projects/pqc-dig-sig/standardization) (July 2023)
* [NIST PQC Competition](https://csrc.nist.gov/Projects/post-quantum-cryptography/post-quantum-cryptography-standardization) (2017-2024)

* Standards:
    * [FIPS 203: ML-KEM](https://nvlpubs.nist.gov/nistpubs/fips/nist.fips.203.pdf) (CRYSTALS-Kyber)
    * [FIPS 204: ML-DSA](https://nvlpubs.nist.gov/nistpubs/fips/nist.fips.204.pdf) (CRYSTALS-Dilithium)
    * [FIPS 205: SLH-DSA](https://nvlpubs.nist.gov/nistpubs/fips/nist.fips.205.pdf) (SPHINCS+)
    * FALCON: FIPS TBD

* [ETSI](https://www.etsi.org/technologies/quantum-safe-cryptography)


# Industry

## PQC at Google 

[Post-Quantum Cryptography Hub](https://cloud.google.com/security/resources/post-quantum-cryptography): 
Provides content for all levels of technical expertise, including CISOs, security engineers, crypto-savvy folks, and anyone interested in learning more about post-quantum security.

Blogs:
* [Post-Quantum Cryptography: Standards and Progress](https://security.googleblog.com/2024/08/post-quantum-cryptography-standards.html)
* [Cloud CISO Perspectives: Why we need to get ready for PQC](https://cloud.google.com/blog/products/identity-security/cloud-ciso-perspectives-why-we-need-to-get-ready-for-pqc)
* [How Google is preparing for a post-quantum world](https://cloud.google.com/blog/products/identity-security/how-google-is-preparing-for-a-post-quantum-world)
* [Why Google now uses post-quantum cryptography for internal comms](https://cloud.google.com/blog/products/identity-security/why-google-now-uses-post-quantum-cryptography-for-internal-comms)
* [Transitioning organizations to post-quantum cryptography | Nature](https://www.nature.com/articles/s41586-022-04623-2)
* [Podcast: EP164 Quantum Computing: Understanding the (very serious) Threat and Post-Quantum Cryptography](https://cloud.withgoogle.com/cloudsecurity/podcast/ep164-quantum-computing-understanding-the-very-serious-threat-and-post-quantum-cryptography/)


Technical:
* [Google's Threat model for Post-Quantum Cryptography](https://bughunters.google.com/blog/5108747984306176/google-s-threat-model-for-post-quantum-cryptography)
* [Cryptographic Agility and Key Rotation](https://bughunters.google.com/blog/6182336647790592/cryptographic-agility-and-key-rotation)
* [Why Hybrid Deployments Are Key to Secure PQC Migration](https://bughunters.google.com/blog/5266882047639552/why-hybrid-deployments-are-key-to-secure-pqc-migration)
* [Formally Verified Post-Quantum Algorithms](https://bughunters.google.com/blog/6038863069184000/formally-verified-post-quantum-algorithms)
* [Tink library: experimental | pqcrypto](https://github.com/tink-crypto/tink/tree/master/cc/experimental/pqcrypto)
* Sophie Schmieg, Stefan Koelbl: [RWC’23: Crypto Agility and Post-Quantum Cryptography](https://youtu.be/IAOWRO9Qn10?t=107)
* Stefan Koelbl: TNO Symposium on PQcrypto'23: [PQC5_Slides_Stefan.Kolbl.pdf](https://www.post-quantum.nl/slides/PQC5_Slides_Stefan.Kolbl.pdf)

Chrome:
* [A new path for Kyber on the web](https://security.googleblog.com/2024/09/a-new-path-for-kyber-on-web.html)
* [Advancing Our Amazing Bet on Asymmetric Cryptography](https://blog.chromium.org/2024/05/advancing-our-amazing-bet-on-asymmetric.html)
* [Protecting Chrome Traffic with Hybrid Kyber KEM](https://blog.chromium.org/2023/08/protecting-chrome-traffic-with-hybrid.html)

FIDO:
* [Toward Quantum Resilient Security Keys](https://security.googleblog.com/2023/08/toward-quantum-resilient-security-keys.html)



## Other

|Company   | Link |
|----------|------|
|AWS		|https://aws.amazon.com/security/post-quantum-cryptography/|
|Microsoft Azure  |https://quantum.microsoft.com/en-us/our-story/quantum-cryptography-overview|
|IBM        |https://www.ibm.com/quantum/quantum-safe|
|Accenture  | [Crypto-agility: Preparing for post-quantum decryption](https://www.accenture.com/us-en/insightsnew/us-federal-government/post-quantum-cryptography)|
| Deloitte  | [Future Forward Readiness: Quantum Risk](https://www2.deloitte.com/content/dam/Deloitte/us/Documents/risk/us-risk-future-forward-readiness-quantum-risk.pdf)|


## Public Sector
Regulations / Directives / Requirements / Roadmaps

Focus on first steps: Crypto Inventory, Crypto Agility

* US White House Memorandum [NSM-8](https://www.whitehouse.gov/briefing-room/presidential-actions/2022/01/19/memorandum-on-improving-the-cybersecurity-of-national-security-department-of-defense-and-intelligence-community-systems/): Improving the Cybersecurity of National Security (Jan 2022)
* US White House Memorandum [NSM-10](https://www.whitehouse.gov/briefing-room/statements-releases/2022/05/04/national-security-memorandum-on-promoting-united-states-leadership-in-quantum-computing-while-mitigating-risks-to-vulnerable-cryptographic-systems/): Promoting United States Leadership in Quantum Computing While Mitigating Risks to Vulnerable Cryptographic Systems (May 2022)
* [NSA PQC Roadmap](https://www.nsa.gov/Press-Room/News-Highlights/Article/Article/3148990/nsa-releases-future-quantum-resistant-qr-algorithm-requirements-for-national-se/)

## Financial Services
Focus on Risk Management

* ESMA / European Banking Authority (EBA) : [JC 2023 86 - Final report on draft RTS on ICT Risk Management Framework and on simplified ICT Risk Management Framework](https://www.esma.europa.eu/sites/default/files/2024-01/JC_2023_86_-_Final_report_on_draft_RTS_on_ICT_Risk_Management_Framework_and_on_simplified_ICT_Risk_Management_Framework.pdf)
* FS-ISAC whitepaper:
[Preparing for a Post-Quantum World by Managing Cryptographic Risk](https://www.fsisac.com/hubfs/Knowledge/PQC/PreparingForAPostQuantumWorldByManagingCryptographicRisk.pdf?hsLang=en)
* World Economic Forum: [Quantum Security for the Financial Sector: Informing Global Regulatory Approaches Forum](https://www.weforum.org/publications/quantum-security-for-the-financial-sector-informing-global-regulatory-approaches/)
* World Economic Forum: [Transitioning to a Quantum-Secure Economy](https://www3.weforum.org/docs/WEF_Transitioning%20to_a_Quantum_Secure_Economy_2022.pdf)

## Quantum Computing Research & Progress

* [Global Risk Institute: 2023 Quantum Threat Timeline Report](https://globalriskinstitute.org/publication/2023-quantum-threat-timeline-report/)
* [Google Quantum AI](https://quantumai.google/quantumcomputer)
* [IBM Quantum Computing](https://www.ibm.com/quantum)
