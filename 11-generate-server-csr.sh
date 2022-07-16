#!/bin/bash -e

# Generate a server CSR into server/csr/<generated-filename>

# Check the command line argument.
if [ $# -ne 1 ] ; then
   echo "Usage: $0 <path/to/server/private/key>"
   echo "Example: ./11-generate-server-csr.sh server/private/marketing.example.com-private.key"
   exit 1
fi

SERVER_PRIVATE_KEY=$1

# Generate CSR filename.
CSR_FILENAME=$(basename ${SERVER_PRIVATE_KEY} | sed "s/-private.key//g")
SERVER_CSR_OUTFILE="server/csr/${CSR_FILENAME}.csr"

# Do not override the existing file. Must check and 
# delete manually.
if [ -e $SERVER_CSR_OUTFILE ] ; then
   echo "Server CSR ${SERVER_CSR_OUTFILE} already exists"
   exit 1
fi

openssl req -new -sha256 \
    -key $SERVER_PRIVATE_KEY \
    -out $SERVER_CSR_OUTFILE
