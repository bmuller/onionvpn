#!/bin/bash
export KEY_COUNTRY="US"
export KEY_PROVINCE="NC"
export KEY_CITY="Winston-Salem"
export KEY_ORG="Example Company"
export KEY_EMAIL="steve@example.com"
export KEY_CN=MyVPN
export KEY_NAME=MyVPN
export KEY_OU=MyVPN
export SERVER_NAME=example.com

export EASY_RSA="/etc/openvpn/easy-rsa"
export OPENSSL="openssl"
export PKCS11TOOL="pkcs11-tool"
export GREP="grep"
export KEY_CONFIG=/etc/openvpn/easy-rsa/openssl-1.0.0.cnf
export KEY_DIR="$EASY_RSA/keys"
export PKCS11_MODULE_PATH="dummy"
export PKCS11_PIN="dummy"
export KEY_SIZE=2048
export CA_EXPIRE=3650
export KEY_EXPIRE=3650

mkdir /etc/openvpn/easy-rsa/
cp -r /usr/share/easy-rsa/* /etc/openvpn/easy-rsa/

cd /etc/openvpn/easy-rsa

./clean-all
./build-ca
./pkitool --server $SERVER_NAME
./build-dh
cp keys/$SERVER_NAME.crt keys/$SERVER_NAME.key keys/ca.crt keys/dh2048.pem /etc/openvpn
