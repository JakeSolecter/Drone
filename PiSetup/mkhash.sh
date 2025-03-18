#!/bin/bash
echo "hashed root password":
mkpasswd -m sha-512 --stdin <<< ./secrets/Root_pwd.txt
echo "hashed user password":
mkpasswd -m sha-512 --stdin <<< ./secrets/User_pwd.txt