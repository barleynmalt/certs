#!/bin/bash -e

ROOT_CA_PRIVATE_KEY=root/root-ca-private.key
ROOT_CA_PUBLIC_KEY=$(echo ${ROOT_CA_PRIVATE_KEY} | sed -e "s/private/public/g")

echo "Generating server Public Key ${ROOT_CA_PUBLIC_KEY} ..."
echo "======================================================"

openssl rsa -pubout -in $ROOT_CA_PRIVATE_KEY -out $ROOT_CA_PUBLIC_KEY
