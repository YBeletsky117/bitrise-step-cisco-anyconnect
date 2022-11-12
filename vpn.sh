#!/bin/bash

echo "$0" | sudo openconnect $1 --protocol=anyconnect  --user=$2 --authgroup=$3 --passwd-on-stdin --background