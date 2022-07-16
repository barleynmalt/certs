#!/bin/bash -e

# Generate the public key using the private key.

if [ $# -ne 1 ] ; then
   echo "Usage: $0 <path/to/private/key"
   exit 1
fi

SERVER_PRIVATE_KEY=$1

# Generate the public key output filename.
SERVER_PUBLIC_KEY=$(echo ${SERVER_PRIVATE_KEY} | sed -e "s/private/public/g")

echo "Generating server Public Key ${SERVER_PUBLIC_KEY} ..."
echo "====================================================="

openssl rsa -pubout -in $SERVER_PRIVATE_KEY -out $SERVER_PUBLIC_KEY
