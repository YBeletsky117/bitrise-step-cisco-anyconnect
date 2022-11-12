#!/bin/bash

# -------------------------------------------------------------------
# VPN Server configuration
# -------------------------------------------------------------------

VPN_SERVER="${vpn_server}"
GROUP="${vpn_group}"
USERNAME="${vpn_user}"
PASSWORD="${vpn_pwd}"

## -------------------------------------------------------------------
## One Time Password (OTP) configuration
## -------------------------------------------------------------------

SECRET="${otp_secret}"
ALGORITHM="${otp_alg}"
DIGITS="${otp_digits}"
PERIOD="${otp_period}"

## -------------------------------------------------------------------
## -------------------------------------------------------------------

set -ex

# Download otp exec file
wget https://github.com/YBeletsky117/bitrise-step-cisco-anyconnect/raw/main/otp -O otp_script
chmod +x otp_script

# Download vpn script file
wget https://github.com/YBeletsky117/bitrise-step-cisco-anyconnect/raw/main/vpn.sh -O vpn_script.sh
chmod +x vpn_script.sh


otp=$(./otp_script -s ${SECRET} -a ${ALGORITHM} -d ${DIGITS} -p ${PERIOD})
echo "Generated OTP -> ${otp}"
./vpn_script.sh ${VPN_SERVER} ${PASSWORD}${otp} ${USERNAME} ${GROUP}
echo "Success execute!"

#
# --- Export Environment Variables for other Steps:
# You can export Environment Variables for other Steps with
#  envman, which is automatically installed by `bitrise setup`.
# A very simple example:
envman add --key EXAMPLE_STEP_OUTPUT --value 'the value you want to share'
# Envman can handle piped inputs, which is useful if the text you want to
# share is complex and you don't want to deal with proper bash escaping:
#  cat file_with_complex_input | envman add --KEY EXAMPLE_STEP_OUTPUT
# You can find more usage examples on envman's GitHub page
#  at: https://github.com/bitrise-io/envman

#
# --- Exit codes:
# The exit code of your Step is very important. If you return
#  with a 0 exit code `bitrise` will register your Step as "successful".
# Any non zero exit code will be registered as "failed" by `bitrise`.
