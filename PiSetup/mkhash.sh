#!/bin/bash
echo "hashed root password":
mkpasswd $(cat ./secrets/Root_pwd.txt)
echo "hashed user password":
mkpasswd $(cat ./secrets/Usr_pwd.txt)