#!/bin/bash

serv=$0
pwd=$1
usr=$2
gr=$3

echo "${serv}"
echo "${pwd}"
echo "${usr}"
echo "${gr}"

printf "${pwd}\ny" | sudo openconnect ${serv} --protocol=anyconnect  --user=${usr} --authgroup=${gr} --passwd-on-stdin --background
