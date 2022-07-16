#/bin/bash -e

CERT_FOLDER=server/certs
ROOT_CERT=root/root-ca-csr.pem

if [ -z $(ls ${CERT_FOLDER}) ] ; then
   echo "No certificates found"
   exit
fi

for file in $(ls ${CERT_FOLDER});
do
   echo "======================================================="
   echo "Verifying Server Certificate ${CERT_FOLDER}/${file} ..."

   openssl verify -verbose -CAfile $ROOT_CERT ${CERT_FOLDER}/$file
   echo "======================================================="
done
