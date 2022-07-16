#/bin/bash -e

if [ $# -ne 1 ] ; then
   echo "Usage: $0 <path/to/server/certificate/file>"
   exit 1
fi

SERVER_CERT=$1

ROOT_CERT=root/root-ca-csr.pem

echo "Verifying Server Certificate ${SERVER_CERT} ..."
echo "==============================================="

openssl verify -verbose \
        -CAfile $ROOT_CERT \
        $SERVER_CERT
