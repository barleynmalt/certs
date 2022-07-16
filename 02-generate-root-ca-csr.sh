#/bin/bash -e

# Description: generate the Root CA CSR
# Pre-cond: the Root CA private key must have been created and
#           stored in the root directory relative to the current
#           directory where this script is in.

# Check command line argument - expected an integer.
if [ $# -ne 1 ] ; then
   echo "Usage: $0 <days>"
   echo "Exmaple: ./02-generate-root-ca-csr.sh 365"
   exit 1
fi

# The CSR  when generated successfully will be
# valid up until n days (inc time components).
VALID_IN_DAYS=$1

ROOT_CA_CSR_OUTFILE="root/root-ca-csr.pem"
ROOT_CA_PRIVATE_KEY="root/root-ca-private.key"

# Do not override existing file. Check and delete manually.
if [ -e $ROOT_CA_CSR_OUTFILE ] ; then
   echo "Root CA CSR already exists"
   exit 1
fi

echo "Generating Root CA CSR ${ROOT_CA_CSR} ..."
openssl req -x509 -sha256 -new -nodes \
       -key $ROOT_CA_PRIVATE_KEY \
       -days $VALID_IN_DAYS \
       -out $ROOT_CA_CSR_OUTFILE
