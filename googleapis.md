# Testing Google APIs for PQC

Google and Google Cloud APIs (including google.com and *.googleapis.com) are accessible via TLS 1.3 with hybrid key exchange based on ML-KEM and curve25519.

## How to test?
You need a client capable of initiating a TLS 1.3 handshake using the `X25519MLKEM768` parameter.


### 1. Using Chrome

This is the easiest way. Type [https://www.google.com](https://www.google.com) into the Chrome address bar and then use Developer Tools to look at the details in the Security tab.

Note that if you test an API, e.g., if you paste [https://cloudkms.googleapis.com](https://cloudkms.googleapis.com) into the addess bar, you will likely see *"404. That’s an error."* However, the Develper Tools Security tab will confirm the handshake:
*"The connection to this site is encrypted and authenticated using QUIC, X25519MLKEM768, and AES_128_GCM."*



### 2. Using BoringSSL
Using `bssl client` from BoringSSL, hybrid ML-KEM handshakes can be established with various APIs.

Example:

```
./bssl client -connect www.google.com -server-name www.google.com -curves X25519MLKEM768
```
Output:
```
Connecting to XXX
Connected.
  Version: TLSv1.3
  Resumed session: no
  Cipher: TLS_AES_128_GCM_SHA256
  ECDHE group: X25519MLKEM768
  Signature algorithm: ecdsa_secp256r1_sha256
  Secure renegotiation: yes
  Extended master secret: yes
  Next protocol negotiated: 
  ALPN protocol: 
  OCSP staple: no
  SCT list: no
  Early data: no
  Encrypted ClientHello: no
  Cert subject: CN = www.google.com
  Cert issuer: C = US, O = Google Trust Services, CN = WE2
```

### 3. Using OpenSSL

Test success depends on your version of openssl.

E.g., on one of my machines I still have openssl version `LibreSSL 3.3.6` which results in a failure that `s_client` does not recognize the TLS1.3 group `X25519MLKEM768`. 
However, on another machine where I have openssl version `OpenSSL 3.5.5` installed it works:

```
openssl s_client -connect www.google.com:443 -servername www.google.com -groups X25519MLKEM768
```

Output:

```
Negotiated TLS1.3 group: X25519MLKEM768
---
SSL handshake has read 3889 bytes and written 1578 bytes
Verification: OK
---
New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
Protocol: TLSv1.3
Server public key is 256 bit
This TLS version forbids renegotiation.
```



## Scaling the Test
To cycle through all Google Cloud APIs, use the gcloud command.

```
#!/bin/bash

# Define your project ID variable to satisfy gcloud's context requirement
PROJECT_ID="FILL_IN_YOUR_PROJECT_ID"

echo "Fetching global list of Google APIs..."

# 1. We use the project ID to authorize the global 'available' list request
# 2. Filtering for 'googleapis.com' to target public API endpoints
SERVICES=$(gcloud services list --available --project="$PROJECT_ID" --format="value(config.name)" 2>/dev/null | grep "googleapis.com")

if [ -z "$SERVICES" ]; then
    echo "Error: Could not fetch services. Check your PROJECT_ID and gcloud auth."
    exit 1
fi

echo "Starting Global PQC Handshake Test (X25519MLKEM768)..."
echo "------------------------------------------------------"

for api in $SERVICES; do
  # Pipe 'Q' to quit bssl after handshake and grep for the PQC group
  if echo "Q" | ./bssl client -connect "${api}:443" -server-name "${api}" -curves X25519MLKEM768 2>&1 | grep -q "X25519MLKEM768"; then
    echo "$api: PQC OK"
  else
    echo "$api: FAILED"
  fi
done
```

Using this [apipqctest.sh](./googleapis/apipqctest.sh) script I successfully validated 500+ Google APIs, confirming use of an ML-KEM hybrid handshake: [apipqctest.out](./googleapis/apipqctest.out) using the above script against projects in my Google Cloud environment.
