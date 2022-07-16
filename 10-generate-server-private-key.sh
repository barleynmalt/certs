#/bin/bash -e

# Check the command line arguments.
if [ $# -ne 3 ] ; then
   echo "Usage: $0 <fqdn> <algorithm> <bits>"
   echo "Exmaple: ./generate-server-private-key.sh example.com des3 2048"
   exit 1
fi

# Fully qualified domain name
FQDN=$1

# Encryption algorithm
ENCRYPTION_ALGO=$2

# Key length
KEY_SIZE_IN_BITS=$3

PRIVATE_KEY_OUTFILE="server/private/${FQDN}-private.key"

# Do not override the existing file. Must check and delete manuall
# for this script to work.
if [ -e $PRIVATE_KEY_OUTFILE ] ; then
   echo "Private key for ${FQDN} already exists"
   exit 1
fi

echo "Generating server private key for ${PRIVATE_KEY_OUTFILE} ..."
openssl genrsa -out $PRIVATE_KEY_OUTFILE $KEY_SIZE_IN_BITS
