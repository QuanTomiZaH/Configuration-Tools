#!/bin/bash

#$1 is the azure devops repo location
#$2 is the username to authenticate to the azure devops npm feed
#$3 is an email adress(this entry does nothing)
#$4 is the password to authenticate to the azure devops npm feed

npm config set registry=$1
npm config set always-auth=true
npm config set username=$2
npm config set email=$3
npm config set _password=$4
sudo npm install -g grunt