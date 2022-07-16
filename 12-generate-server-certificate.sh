#/bin/bash -e

# Generate server or intermediate certificate using
# the Root CA.

# Check the command line arguments.
if [ $# -ne 2 ] ; then
   echo "Usage: $0 <server-csr> <days>"
   echo "Exmaple: ./12-generate-server-certificate.sh <server-csr> 365"
   exit 1
fi

SERVER_CSR=$1

# The certificate, when generated successfully, will
# be valid up to n days (inc. time components).
VALID_IN_DAYS=$2

ROOT_CA_CSR="root/root-ca-csr.pem"
ROOT_CA_PRIVATE_KEY="root/root-ca-private.key"

# Generate certificate filename.
CERT_FILENAME=$(basename ${SERVER_CSR} | sed "s/.csr//")
SERVER_CERTIFICATE="server/certs/${CERT_FILENAME}.cert"

# Do not override the existing certificate. Must check and
# remove manually.
if [ -e $SERVER_CERTIFICATE ] ; then
   echo "Server certificate ${SERVER_CERTIFICATE} already exists"
   exit 1
fi

echo "======================================================="
echo "Generating server certificate ${SERVER_CERTIFICATE} ..."
echo "Root CA CSR: ${ROOT_CA_CSR}"
echo "Root CA Private Key: ${ROOT_CA_PRIVATE_KEY}"
echo "======================================================="
echo " "
echo " "


openssl x509 -req -sha256 -CAcreateserial \
    -CA $ROOT_CA_CSR \
    -CAkey $ROOT_CA_PRIVATE_KEY \
    -in $SERVER_CSR \
    -days $VALID_IN_DAYS \
    -out $SERVER_CERTIFICATE
