# Post-Quantum Cryptography (PQC, pqcrypto)

Selected links and resources relevant to post-quantum cryptography adoption.

* For a more research-oriented overview see e.g., [pqcrypto.org](https://pqcrypto.org) or
* [pqc-forum](https://groups.google.com/a/list.nist.gov/g/pqc-forum) mailing list

# Standardization

* [NIST Selects HQC as Fifth Algorithm for Post-Quantum Encryption](https://www.nist.gov/news-events/news/2025/03/nist-selects-hqc-fifth-algorithm-post-quantum-encryption) (March 2025)
* [NIST Releases First 3 Finalized Post-Quantum Encryption Standards](https://www.nist.gov/news-events/news/2024/08/nist-releases-first-3-finalized-post-quantum-encryption-standards) (August 2024)
* [Call for Additional Digital Signature Schemes](https://csrc.nist.gov/projects/pqc-dig-sig/standardization) (July 2023)
* [NIST PQC Competition](https://csrc.nist.gov/Projects/post-quantum-cryptography/post-quantum-cryptography-standardization) (2017-2024)

* Standards:
    * [FIPS 203: ML-KEM](https://nvlpubs.nist.gov/nistpubs/fips/nist.fips.203.pdf) (CRYSTALS-Kyber)
    * [FIPS 204: ML-DSA](https://nvlpubs.nist.gov/nistpubs/fips/nist.fips.204.pdf) (CRYSTALS-Dilithium)
    * [FIPS 205: SLH-DSA](https://nvlpubs.nist.gov/nistpubs/fips/nist.fips.205.pdf) (SPHINCS+)
    * FALCON: FIPS TBD
    * HQC: FIPS TBD

* [IETF PQC Working Group](https://wiki.ietf.org/group/sec/PQCAgility)

* [ETSI](https://www.etsi.org/technologies/quantum-safe-cryptography)


# Industry

## PQC at Google 

[Post-Quantum Cryptography Hub](https://cloud.google.com/security/resources/post-quantum-cryptography): 
Provides content for all levels of technical expertise, including CISOs, security engineers, crypto-savvy folks, and anyone interested in learning more about post-quantum security.

### Blogs:
* [Post-Quantum Cryptography: Standards and Progress](https://security.googleblog.com/2024/08/post-quantum-cryptography-standards.html)
* [Cloud CISO Perspectives: Why we need to get ready for Quantum](https://cloud.google.com/blog/products/identity-security/cloud-ciso-perspectives-why-we-need-to-get-ready-for-pqc) ([v2025](https://cloud.google.com/blog/products/identity-security/cloud-ciso-perspectives-prepare-early-for-PQC-resilient-cryptographic-threats?e=48754805))
* [How Google is preparing for a post-quantum world](https://cloud.google.com/blog/products/identity-security/how-google-is-preparing-for-a-post-quantum-world)
* [Why Google now uses post-quantum cryptography for internal comms](https://cloud.google.com/blog/products/identity-security/why-google-now-uses-post-quantum-cryptography-for-internal-comms)
* [Announcing Quantum-Safe Digital Signatures in Cloud KMS](https://cloud.google.com/blog/products/identity-security/announcing-quantum-safe-digital-signatures-in-cloud-kms) (Cloud KMS Strategy)
* [Transitioning organizations to post-quantum cryptography | Nature](https://www.nature.com/articles/s41586-022-04623-2)
* [Podcast: EP164 Quantum Computing: Understanding the (very serious) Threat and Post-Quantum Cryptography](https://cloud.withgoogle.com/cloudsecurity/podcast/ep164-quantum-computing-understanding-the-very-serious-threat-and-post-quantum-cryptography/)


### Google Guidance
* [Google's Threat model for Post-Quantum Cryptography](https://bughunters.google.com/blog/5108747984306176/google-s-threat-model-for-post-quantum-cryptography)
* [Cryptographic Agility and Key Rotation](https://bughunters.google.com/blog/6182336647790592/cryptographic-agility-and-key-rotation)

For crypto engineers:
* [Why Hybrid Deployments Are Key to Secure PQC Migration](https://bughunters.google.com/blog/5266882047639552/why-hybrid-deployments-are-key-to-secure-pqc-migration)
* [Formally Verified Post-Quantum Algorithms](https://bughunters.google.com/blog/6038863069184000/formally-verified-post-quantum-algorithms)


### Google Libraries
* Low-level: **BoringSSL** : https://boringssl.googlesource.com/boringssl/
   * BoringSSL is a fork of OpenSSL maintained by Google: https://en.wikipedia.org/wiki/OpenSSL#BoringSSL
   * BoringSSL includes NIST PQC standards implementation, eg. https://boringssl.googlesource.com/boringssl/+/refs/heads/master/include/openssl/mlkem.h
   
* Developer-friendly library: **Tink** https://developers.google.com/tink/getting-started
   * [Tink Intro / Design Rationale](https://opensource.googleblog.com/2018/08/introducing-tink-cryptographic-library.html)
   * [Usability Considerations](https://chromium.googlesource.com/external/github.com/google/tink/+/refs/tags/upstream/v1.2.1/docs/SECURITY-USABILITY.md) - particularly abstracting away from algorithms to primitives
   * [PQC Experimental in Tink](https://github.com/tink-crypto/tink-cc/tree/main/tink/experimental/pqcrypto)
   * [Tink Roadmap](https://developers.google.com/tink/roadmap)


### Chrome: from early experiments to ML-KEM rollout in 2024

* 2016 CECPQ1 Experiment:
   * https://www.imperialviolet.org/2016/11/28/cecpq1.html
   * https://en.wikipedia.org/wiki/CECPQ1
* 2019 CECPQ2 Experiment:
   * https://www.imperialviolet.org/2019/10/30/pqsivssl.html
   * https://en.wikipedia.org/wiki/CECPQ2
   * https://blog.cloudflare.com/the-tls-post-quantum-experiment/
* [Protecting Chrome Traffic with Hybrid Kyber KEM](https://blog.chromium.org/2023/08/protecting-chrome-traffic-with-hybrid.html)
* [Advancing Our Amazing Bet on Asymmetric Cryptography](https://blog.chromium.org/2024/05/advancing-our-amazing-bet-on-asymmetric.html)
* [A new path for Kyber on the web](https://security.googleblog.com/2024/09/a-new-path-for-kyber-on-web.html)


### Other products using PQC
* FIDO keys https://security.googleblog.com/2023/08/toward-quantum-resilient-security-keys.html
* Open Titan (hardware): https://opensource.googleblog.com/2025/02/fabrication-begins-for-production-opentitan-silicon.html

### Selected Public Presentations at Real World Crypto 
(yearly cryptography engineering conference)
* RWC’15: [Heartbleed / OpenSSL / Google](https://rwc.iacr.org/2015/Slides/RWC-2015-Kasper.pdf)
* RWC’18: [Achieving high availability in the internal Google KMS](https://youtu.be/5T_c-lqgjso?t=577)
* RWC’19: [Tink: A cryptographic library](https://www.youtube.com/watch?v=pqev9r3rUJs&t=9665s)
* RWC’21: [What’s in a key?](https://youtu.be/CiH6iqjWpt8?t=1028)
* RWC’23: [Crypto Agility and Post-Quantum Cryptography](https://youtu.be/IAOWRO9Qn10?t=107)
* Stefan Koelbl: TNO Symposium on PQcrypto'23: [PQC5_Slides_Stefan.Kolbl.pdf](https://www.post-quantum.nl/slides/PQC5_Slides_Stefan.Kolbl.pdf)


## PQC elsewhere

|Company   | Link |
|----------|------|
|AWS		|https://aws.amazon.com/security/post-quantum-cryptography/|
|Microsoft Azure  |https://quantum.microsoft.com/en-us/our-story/quantum-cryptography-overview|
|IBM        |https://www.ibm.com/quantum/quantum-safe|
|Accenture  | [Crypto-agility: Preparing for post-quantum decryption](https://www.accenture.com/us-en/insightsnew/us-federal-government/post-quantum-cryptography)|
| Deloitte  | [Future Forward Readiness: Quantum Risk](https://www2.deloitte.com/content/dam/Deloitte/us/Documents/risk/us-risk-future-forward-readiness-quantum-risk.pdf)|


## Regulations / Directives / Requirements / Roadmaps

Focus on first steps: Crypto Inventory, Crypto Agility

* US White House Memorandum [NSM-8](https://www.whitehouse.gov/briefing-room/presidential-actions/2022/01/19/memorandum-on-improving-the-cybersecurity-of-national-security-department-of-defense-and-intelligence-community-systems/): Improving the Cybersecurity of National Security (Jan 2022)
* US White House Memorandum [NSM-10](https://www.whitehouse.gov/briefing-room/statements-releases/2022/05/04/national-security-memorandum-on-promoting-united-states-leadership-in-quantum-computing-while-mitigating-risks-to-vulnerable-cryptographic-systems/): Promoting United States Leadership in Quantum Computing While Mitigating Risks to Vulnerable Cryptographic Systems (May 2022)
* [NSA PQC Roadmap](https://www.nsa.gov/Press-Room/News-Highlights/Article/Article/3148990/nsa-releases-future-quantum-resistant-qr-algorithm-requirements-for-national-se/)
* [NIST IR 8547 (Draft)](https://csrc.nist.gov/News/2024/draft-nist-ir-8547-is-available-for-comment)

## Financial Services
Focus on Risk Management

* ESMA / European Banking Authority (EBA) : [JC 2023 86 - Final report on draft RTS on ICT Risk Management Framework and on simplified ICT Risk Management Framework](https://www.esma.europa.eu/sites/default/files/2024-01/JC_2023_86_-_Final_report_on_draft_RTS_on_ICT_Risk_Management_Framework_and_on_simplified_ICT_Risk_Management_Framework.pdf)
* FS-ISAC whitepaper:
[Preparing for a Post-Quantum World by Managing Cryptographic Risk](https://www.fsisac.com/hubfs/Knowledge/PQC/PreparingForAPostQuantumWorldByManagingCryptographicRisk.pdf?hsLang=en)
* World Economic Forum: [Quantum Security for the Financial Sector: Informing Global Regulatory Approaches Forum](https://www.weforum.org/publications/quantum-security-for-the-financial-sector-informing-global-regulatory-approaches/)
* World Economic Forum: [Transitioning to a Quantum-Secure Economy](https://www3.weforum.org/docs/WEF_Transitioning%20to_a_Quantum_Secure_Economy_2022.pdf)

## Quantum Computing Research & Progress

* [Global Risk Institute: 2024 Quantum Threat Timeline Report](https://globalriskinstitute.org/publication/2024-quantum-threat-timeline-report/)
* [Google Quantum AI](https://quantumai.google/quantumcomputer)
   * [Google Willow](https://blog.google/technology/research/google-willow-quantum-chip/)
* [IBM Quantum Computing](https://www.ibm.com/quantum)
* [Azure Majorana](https://azure.microsoft.com/en-us/blog/quantum/2025/02/19/microsoft-unveils-majorana-1-the-worlds-first-quantum-processor-powered-by-topological-qubits/)
* [Amazon Ocelot](https://www.aboutamazon.com/news/aws/quantum-computing-aws-ocelot-chip)
* [China Quantum Computing Overview](https://bsiegelwax.substack.com/p/chinas-mightiest-quantum-computers)



