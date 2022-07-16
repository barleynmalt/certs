#!/bin/bash -e

if [ $# -ne 1 ] ; then
   echo "Usage: $0 <path/to/certificate/file>
   exit 1
fi

SERVER_CERT=$1

# Generate the public key output filename.
SERVER_PUBLIC_KEY=$(echo ${SERVER_CERT} | sed -e "s/certs/public/" |  sed -e "s/.cert/-public.key-generated-from-cert/g")

echo "Generating server Public Key ${SERVER_PUBLIC_KEY} ..."
echo "====================================================="

openssl x509 -pubkey -noout -in $SERVER_CERT > $SERVER_PUBLIC_KEY 
