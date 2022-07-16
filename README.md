# certs
# Generate Root CA, server and client certificates

This is a scratchpad for learning and testing my scripts. It also serves as a handy store for me find and recall things easily, hopefully.

It is not particular useful for anyone and it should not be used for a Production environment.

## Create Directories/Folders
`./00-create-cert-infra-directories.sh`

The script creates directory tree structure as follows:
```
server/csr
server/certs
server/private
server/public
root
```
where `root` is the one folder for the CA private key and CA CSR and `server` is the folder for intermediate keys and certifcates signed by the Root CA.
## Root Certificate Authority
Generate the Root CA private key and CSR:

`./01-generate-root-ca-key.sh`
`./02-generate-root-ca-csr.sh`

## Generate and Sign an Intermediate Certificate

First, generate the private key for the domain `marketing.example.com`:

`./10-generate-server-private-key.sh marketing.example.com des3 2048`

Then generate the server CSR:

`./11-generate-server-csr.sh server/private/marketing.example.com-private.key`

Lastly, generate the certificate for `marketing`:

`./12-generate-server-cert.sh server/csr/marketing.example.com.csr 365`

Except for `clean-up-folders.sh` which delete all the keys and certificates permanently, the other scripts include scripts ranging from creating a public key from a private key or a certificate to scripts for viewing certificate content, to verifying certificates. 

#### TODO
- generate client certificates
- maintain a index/database of some sort for keeping tracks of the keys/certs