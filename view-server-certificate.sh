#!/bin/bash -e

# Display 'human readable' certificate content.

if [ $# -ne 1 ] ; then
   echo "Usage: $0 <path/to/certificate/file>"
   exit 1
fi

SERVER_CERT_FILE=$1
openssl x509 -noout -text -in $SERVER_CERT_FILE
