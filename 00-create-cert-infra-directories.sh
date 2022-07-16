#/bin/bash -e

# Description: create certificate infrastructure directories

# Check the command line argument.
if [ $# -ne 1 ] ; then
   echo "Usage: $0 <path/to/create/directories>"
   exit 1
fi

# Create sub directories in this base path.
BASE_PATH=$1

# Create certificate infra directories
mkdir -p ${BASE_PATH}/root
mkdir -p ${BASE_PATH}/server/private
mkdir -p ${BASE_PATH}/server/public
mkdir -p ${BASE_PATH}/server/csr
mkdir -p ${BASE_PATH}/server/cert
