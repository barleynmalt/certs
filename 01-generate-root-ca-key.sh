#/bin/bash -e

# Description: generate a Root CA private key.
# Pre-cond: a directory called root must be created prior.
#           The directory is relative to the current directory
#           where this script is in.

# Check command line arguments.
if [ $# -lt 1 ] ; then
   echo "Usage: $0 <algorithm> <bits: default=4096>"
   echo "Exmaple: ./01-generate-root-ca-key.sh des3 [4096]"
   exit 1
fi

# Encryption algorithm
ENCRYPTION_ALGO=$1

# Key length. If not provided in the command line argument
# 4096 is used as the default.
KEY_SIZE_IN_BITS=${2-4096}

PRIVATE_KEY_OUTFILE="root/root-ca-private.key"

# Do not override existing key. Must check and delete manually
# for this script to work.
if [ -e $PRIVATE_KEY_OUTFILE ] ; then
   echo "Root CA already exists"
   exit 1
fi

echo "Generating Root CA private key for ${PRIVATE_KEY_OUTFILE} ..."
openssl genrsa -out $PRIVATE_KEY_OUTFILE $KEY_SIZE_IN_BITS
