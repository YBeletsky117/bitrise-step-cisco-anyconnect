#!/bin/bash

serv=$1
pwd=$2
usr=$3
gr=$4

echo "${serv}"
echo "${pwd}"
echo "${usr}"
echo "${gr}"

printf "${pwd}\ny" | openconnect ${serv} --protocol=anyconnect  --user=${usr} --authgroup=${gr} --passwd-on-stdin --background
