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

* [IETF TLS Working Group](https://datatracker.ietf.org/wg/tls/about/)
* [IETF PLANTS](https://datatracker.ietf.org/wg/plants/about/): PKI, Logs, And Tree Signatures (plants)
* [IETF PQC Working Group](https://wiki.ietf.org/group/sec/PQCAgility)

* [ISO/IEC 18033-2](https://www.iso.org/obp/ui/en/#iso:std:iso-iec:18033:-2:ed-1:v1:amd:2:v1:en) - full access requires payment
    * Classic McEliece ISO parameters: https://classic.mceliece.org/iso.html
    * FrodoKEM: https://frodokem.org/


# Industry

## PQC at Google 

[Post-Quantum Cryptography Hub](https://cloud.google.com/security/resources/post-quantum-cryptography): 
Provides content for all levels of technical expertise, including CISOs, security engineers, crypto-savvy folks, and anyone interested in learning more about post-quantum security.

### Blogs
* [Announcing quantum-safe key import in Cloud KMS](https://cloud.google.com/blog/products/identity-security/announcing-quantum-safe-key-import-in-cloud-kms?e=48754805)
August 2026
* [Google Cloud’s post-quantum cryptography roadmap](https://cloud.google.com/blog/products/identity-security/pqc-in-plaintext-google-clouds-post-quantum-cryptography-roadmap)
August 2026
* [More Cryptanalysis Makes Us All Safer](https://bughunters.google.com/blog/more-cryptanalysis-makes-us-all-safer)
August 2026
* [Future-proofing data integrity: Quantum-safe digital signatures in Cloud KMS](https://cloud.google.com/blog/products/identity-security/future-proofing-data-integrity-quantum-safe-digital-signatures-in-cloud-kms?e=48754805)
July 2026
* [Where to Go Next with Quantum-Safe Certificates](https://bughunters.google.com/blog/next-with-quantum-safe-certificates)
June 2026
* [Quantum frontiers may be closer than they appear](https://blog.google/innovation-and-ai/technology/safety-security/cryptography-migration-timeline/)
March 2026
* [Security for the Quantum Era: Implementing Post-Quantum Cryptography in Android](https://security.googleblog.com/2026/03/post-quantum-cryptography-in-android.html)
March 2026
* [The quantum era is coming. Are we ready to secure it?](https://blog.google/innovation-and-ai/technology/safety-security/the-quantum-era-is-coming-are-we-ready-to-secure-it/)
February 2026
* [Cultivating a robust and efficient quantum-safe HTTPS](https://security.googleblog.com/2026/02/cultivating-robust-and-efficient.html)
February 2026
* [Google's Commitment to a Quantum-Safe Future: Why PQC is Google's Path forward and not QKD](https://bughunters.google.com/blog/4625466008862720/google-s-commitment-to-a-quantum-safe-future-why-pqc-is-google-s-path-forward-and-not-qkd)
December 2025
* [How CISOs Can Navigate the Quantum Shift | Community](https://security.googlecloudcommunity.com/ciso-blog-77/how-cisos-can-navigate-the-quantum-shift-6133)
November 2025
* [PQC in plaintext: How we're helping customers prepare for a quantum-safe future](https://cloud.google.com/blog/products/identity-security/how-were-helping-customers-prepare-for-a-quantum-safe-future?e=0)
October 2025
* [Announcing quantum-safe Key Encapsulation Mechanisms in Cloud KMS](https://cloud.google.com/blog/products/identity-security/announcing-quantum-safe-key-encapsulation-mechanisms-in-cloud-kms)
October 2025
* [Google Online Security Blog: Tracking the Cost of Quantum Factoring](https://security.googleblog.com/2025/05/tracking-cost-of-quantum-factori.html)
May 2025
* [From Inventory to Agility: A CISO's Guide to Robust Key Management](https://www.googlecloudcommunity.com/gc/Community-Blog/From-Inventory-to-Agility-A-CISO-s-Guide-to-Robust-Key/ba-p/895332)
April 2025
* [Cloud CISO Perspectives - Getting ready for Quantum](https://cloud.google.com/blog/products/identity-security/cloud-ciso-perspectives-prepare-early-for-PQC-resilient-cryptographic-threats/?e=48754805)
March 2025
* [Announcing quantum-safe digital signatures in Cloud KMS](https://cloud.google.com/blog/products/identity-security/announcing-quantum-safe-digital-signatures-in-cloud-kms)
February 2025
* [Google Online Security Blog: A new path for Kyber on the web](https://security.googleblog.com/2024/09/a-new-path-for-kyber-on-web.html)
September 2024
* [Post-Quantum Cryptography: Standards and Progress](https://security.googleblog.com/2024/08/post-quantum-cryptography-standards.html)
August 2024
* [Perspectives on Security for the Board: Navigating the Quantum Leap](https://services.google.com/fh/files/misc/perspectives_on_security_for_the_board_ed5.pdf)
August 2024
* [Cloud CISO Perspectives: Why we need to get ready for PQC](https://cloud.google.com/blog/products/identity-security/cloud-ciso-perspectives-why-we-need-to-get-ready-for-pqc)
August 2024
* [Formally Verified Post-Quantum Algorithms](https://bughunters.google.com/blog/6038863069184000/formally-verified-post-quantum-algorithms)
August 2024
* [Cryptographic Agility and Key Rotation](https://bughunters.google.com/blog/6182336647790592/cryptographic-agility-and-key-rotation)
June 2024
* [Why Hybrid Deployments Are Key to Secure PQC Migration](https://bughunters.google.com/blog/5266882047639552/why-hybrid-deployments-are-key-to-secure-pqc-migration)
May 2024
* [Advancing Our Amazing Bet on Asymmetric Cryptography](https://blog.chromium.org/2024/05/advancing-our-amazing-bet-on-asymmetric.html)
May 2024
* [Podcast: EP164 Quantum Computing: Understanding the (very serious) Threat and Post-Quantum Cryptography](https://cloud.withgoogle.com/cloudsecurity/podcast/ep164-quantum-computing-understanding-the-very-serious-threat-and-post-quantum-cryptography/)
March 2024
* [Google's Threat model for Post-Quantum Cryptography](https://bughunters.google.com/blog/5108747984306176/google-s-threat-model-for-post-quantum-cryptography)
March 2024
* [Toward Quantum Resilient Security Keys](https://security.googleblog.com/2023/08/toward-quantum-resilient-security-keys.html)
August 2023
* [Chromium Blog: Protecting Chrome Traffic with Hybrid Kyber KEM](https://blog.chromium.org/2023/08/protecting-chrome-traffic-with-hybrid.html)
August 2023
* [Why Google now uses post-quantum cryptography for internal comms](https://cloud.google.com/blog/products/identity-security/why-google-now-uses-post-quantum-cryptography-for-internal-comms)
November 2022
* [How Google is preparing for a post-quantum world](https://cloud.google.com/blog/products/identity-security/how-google-is-preparing-for-a-post-quantum-world)
July 2022
* [Transitioning organizations to post-quantum cryptography | Nature](https://www.nature.com/articles/s41586-022-04623-2)
May 2022
* [Google Online Security Blog: Experimenting with Post-Quantum Cryptography](https://security.googleblog.com/2016/07/experimenting-with-post-quantum.html)
July 2016


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
* [Cultivating a robust and efficient quantum-safe HTTPS](https://security.googleblog.com/2026/02/cultivating-robust-and-efficient.html) (Merkle-Tree Certificates)


### Other products using PQC
* FIDO keys https://security.googleblog.com/2023/08/toward-quantum-resilient-security-keys.html
* Open Titan (hardware): https://opensource.googleblog.com/2025/02/fabrication-begins-for-production-opentitan-silicon.html



## PQC elsewhere

* Cloudflare: https://www.cloudflare.com/pqc/
* AWS: https://aws.amazon.com/security/post-quantum-cryptography/
* Microsoft: https://quantum.microsoft.com/en-us/our-story/quantum-cryptography-overview
* IBM: https://www.ibm.com/quantum/quantum-safe



## Quantum Computing Research & Progress

* [Global Risk Institute: 2024 Quantum Threat Timeline Report](https://globalriskinstitute.org/publication/2024-quantum-threat-timeline-report/)
* [Google Quantum AI](https://quantumai.google/quantumcomputer)
   * [Building superconducting and neutral atom quantum computers](https://blog.google/innovation-and-ai/technology/research/neutral-atom-quantum-computers/)
   * [Google Willow](https://blog.google/technology/research/google-willow-quantum-chip/)
   * [Google Quantum Echoes](https://blog.google/innovation-and-ai/technology/research/quantum-echoes-willow-verifiable-quantum-advantage/)
* [IBM Quantum Computing](https://www.ibm.com/quantum)
* [Azure Majorana](https://azure.microsoft.com/en-us/blog/quantum/2025/02/19/microsoft-unveils-majorana-1-the-worlds-first-quantum-processor-powered-by-topological-qubits/)
* [Amazon Ocelot](https://www.aboutamazon.com/news/aws/quantum-computing-aws-ocelot-chip)
* [China Quantum Computing Overview 2025](https://bsiegelwax.substack.com/p/chinas-mightiest-quantum-computers)
* [China Quantum Computing Overview 2026](https://bsiegelwax.substack.com/p/chinas-quantum-computers-2026)


