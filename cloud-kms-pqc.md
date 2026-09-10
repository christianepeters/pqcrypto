# Signing with ML-DSA in Google Cloud KMS

This guide shows how to generate and verify post-quantum digital signatures (ML-DSA / FIPS 204) using Google Cloud KMS, and why it is important to choose the right key algorithm based on payload size.


## Local Workstation pre-requisites (also in Cloud Console)

We need openssl version 3.5+ for ML-DSA support. See these instructions on how to install: [install openssl3.5+](https://github.com/christianepeters/howto/blob/master/openssl.md)


## Configuration Variables

Set these environment variables before running the commands:

```
export PROJECT_ID="FILL_IN_YOUR_PROJECT_ID"
export LOCATION="us-central1"
export KEY_RING="FILL_IN_YOUR_KEYRING_NAME"
export PURE_KEY="my-pqc-pure-key"
export MU_KEY="my-pqc-external-mu-key"
```


## Example 1: Small Payloads with Pure ML-DSA (`pq-sign-ml-dsa-65`)

Pure ML-DSA sends the raw data directly to Cloud KMS. It is ideal for small messages, tokens, and metadata (< 64 KiB).

1. Create the Key

```
gcloud kms keys create "${PURE_KEY}" \
    --project="${PROJECT_ID}" \
    --location="${LOCATION}" \
    --keyring="${KEY_RING}" \
    --purpose="asymmetric-signing" \
    --default-algorithm="pq-sign-ml-dsa-65"
```

2. Sign a Small File
```
echo "Hello post-quantum world" > small_message.txt
gcloud kms asymmetric-sign \
    --project="${PROJECT_ID}" \
    --location="${LOCATION}" \
    --keyring="${KEY_RING}" \
    --key="${PURE_KEY}" \
    --version=1 \
    --input-file=small_message.txt \
    --signature-file=signature.sig
```

3. Verify the Signature Locally using openssl

```
gcloud kms keys versions get-public-key 1 \
    --project="${PROJECT_ID}" \
    --location="${LOCATION}" \
    --keyring="${KEY_RING}" \
    --key="${PURE_KEY}" \
    --output-file=public_key.pem

openssl pkeyutl -verify \
    -pubin -inkey public_key.pem \
    -rawin -in small_message.txt \
    -sigfile signature.sig
```


## Signing Files Larger Than 64 KiB

Cloud KMS limits the raw `data` field of the `AsymmetricSign` API to **64 KiB**. Because pure ML-DSA passes the entire payload directly to the API, signing files larger than 64 KiB (such as firmware images, binaries, or archives) fails.

1. Create a Large File (> 64 KiB)
```bash
# Create a 100 KiB test file
head -c 100K </dev/urandom > large_file.bin
```

2. Try to Sign with Pure ML-DSA Key
```bash
gcloud kms asymmetric-sign \
    --project="${PROJECT_ID}" \
    --location="${LOCATION}" \
    --keyring="${KEY_RING}" \
    --key="${PURE_KEY}" \
    --version=1 \
    --input-file=large_file.bin \
    --signature-file=large_signature.sig
```

Output:
```text
ERROR: (gcloud.kms.asymmetric-sign) The file [large_file.bin] is larger than the maximum size of 65536 bytes.
```


## Example 2: Large Payloads with External-μ ML-DSA (pq-sign-ml-dsa-65-external-mu)
To sign payloads larger than 64 KiB without running into API limits, use the external-μ variant.

1. Create External-μ ML-DSA key
```bash
gcloud kms keys create "${MU_KEY}" \
    --project="${PROJECT_ID}" \
    --location="${LOCATION}" \
    --keyring="${KEY_RING}" \
    --purpose="asymmetric-signing" \
    --default-algorithm="pq-sign-ml-dsa-65-external-mu"
```

2. Sign the Large File

```bash
gcloud kms asymmetric-sign \
    --project="${PROJECT_ID}" \
    --location="${LOCATION}" \
    --keyring="${KEY_RING}" \
    --key="${MU_KEY}" \
    --version=1 \
    --digest-algorithm="external-mu" \
    --input-file=large_file.bin \
    --signature-file=large_signature.sig
```

3. Verify the Signature Locally
```bash
gcloud kms keys versions get-public-key 1 \
    --project="${PROJECT_ID}" \
    --location="${LOCATION}" \
    --keyring="${KEY_RING}" \
    --key="${MU_KEY}" \
    --output-file=mu_public_key.pem

openssl pkeyutl -verify \
    -pubin -inkey mu_public_key.pem \
    -rawin -in large_file.bin \
    -sigfile large_signature.sig
```



## Notes

### References
* Cloud KMS documentation: https://docs.cloud.google.com/kms/docs/algorithms#pqc_signing_algorithms
* [Blog: Quantum-safe digital signatures in Cloud KMS](https://cloud.google.com/blog/products/identity-security/future-proofing-data-integrity-quantum-safe-digital-signatures-in-cloud-kms?e=48754805)


### Initial experiments
When PQC signature support launched in Cloud KMS in 2025, I created this script [cloud-kms-pqc-sigs.sh](https://github.com/christianepeters/pqcrypto/blob/main/cloud-kms-pqc-sigs.sh) to test creation of PQC signature keys. Back then there was no support via the Cloud Console or `gcloud` for PQC algorithms in Cloud KMS. So that script still uses plain API calls but should be considered superseded.


