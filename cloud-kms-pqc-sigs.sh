#!/bin/bash

# Configuration
PROJECT_ID="YOUR_PROJECT_ID"
LOCATION="global" # also works with regional keyrings, e.g., us-central1
KEY_RING="YOUR_KEYRING"
KEY_NAME="KEYNAME"
TOKEN=$(gcloud auth print-access-token)
ALGORITHM="PQ_SIGN_SLH_DSA_SHA2_128S"
#ALGORITHM="PQ_SIGN_ML_DSA_65"
URL="https://cloudkms.googleapis.com/v1/projects/${PROJECT_ID}/locations/${LOCATION}/keyRings/${KEY_RING}/cryptoKeys?crypto_key_id=${KEY_NAME}"

# Check if the key already exists (using ${KEY_NAME})
if gcloud kms keys describe "projects/${PROJECT_ID}/locations/${LOCATION}/keyRings/${KEY_RING}/cryptoKeys/${KEY_NAME}" --project="${PROJECT_ID}" > /dev/null 2>&1; then
  echo "Key ${KEY_NAME} already exists. Skipping key creation."
else
  echo "Key ${KEY_NAME} does not exist. Creating..."

  # Construct the JSON payload for key creation
  DATA='{"purpose": "ASYMMETRIC_SIGN", "versionTemplate": { "algorithm": "'"${ALGORITHM}"'" }}'

  # Make the API call to create the key
  curl "${URL}" \
      --request "POST" \
      --header "authorization: Bearer ${TOKEN}" \
      --header "content-type: application/json" \
      --data "${DATA}"

  if [ $? -ne 0 ]; then
    echo "Error creating key. Check the response above."
    exit 1
  fi

  echo "Key creation request sent. Check the Cloud KMS console for the key."
fi


# Sign message

# Get the key version (using ${KEY_NAME})
KEY_VERSION=$(gcloud kms keys versions list --keyring="${KEY_RING}" --location="${LOCATION}" --key="${KEY_NAME}" --project="${PROJECT_ID}" --filter="state=ENABLED" --format="value(name)")

# Construct the URL for signing (using the full key version name)
SIGN_URL="https://cloudkms.googleapis.com/v1/${KEY_VERSION}:asymmetricSign"

# Construct the JSON payload for signing (including key version, digest algorithm, and base64-encoded digest)
BASE64_DATA=$(cat ./data.txt | base64 -w 0)
SIGN_DATA=$(cat <<EOF
{
"data": "$BASE64_DATA"
}
EOF
)


# Make the API call to sign
SIGN_RESPONSE=$(curl -s "${SIGN_URL}" \
    --request "POST" \
    --header "authorization: Bearer ${TOKEN}" \
    --header "content-type: application/json" \
    --data "${SIGN_DATA}")

echo "${SIGN_RESPONSE}"
# Extract the signature from the response
SIGNATURE=$(echo "${SIGN_RESPONSE}" | jq -r '.signature')

# Decode the signature (it's base64 encoded)
SIGNATURE_DECODED=$(echo "${SIGNATURE}" | base64 -d | xxd -p)

# Print the message, digest, and signature
echo "Message: ${BASE64_DATA}"
# echo "Signature (hex): ${SIGNATURE_DECODED}" | tail
#echo "Signing Key: ${KEY_VERSION}" # Use the full key version name

# Error handling (optional)
if [ $? -ne 0 ]; then
    echo "Error signing message. Check the response above."
    echo "${SIGN_RESPONSE}" #print the response for debugging.
    exit 1
fi

echo "Message signed successfully."



