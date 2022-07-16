#/bin/bash -e

# DELETE ALL CERTIFCATES AND KEYS

if [ $# -ne 1 ] ; then
   echo "Usage: $0 --force-delete"
   exit 1
else
   if [ "$1" != "--force-delete" ] ; then
      echo "Usage: $0 --force-delete"
      exit 1
   fi
fi

delete_files_in() {
   dir=$1
   if [ -z $(ls ${dir}) ] ; then
      echo "Empty directory ${dir}"
   else
      echo "Deleting files in ${dir} ..."
      rm ${dir}/*
   fi
}

delete_files_in root
delete_files_in "server/private"
delete_files_in "server/public"
delete_files_in "server/csr"
delete_files_in "server/certs"
