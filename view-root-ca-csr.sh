#!/bin/bash -e

# Display 'human readable' content of the Root CA CSR.

ROOT_CA_CSR="root/root-ca-csr.pem"
openssl x509 -in $ROOT_CA_CSR -text
