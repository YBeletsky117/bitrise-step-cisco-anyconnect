#!/bin/bash

# -------------------------------------------------------------------
# VPN Server configuration
# -------------------------------------------------------------------

VPN_SERVER="devc.ffinpay.ru"
GROUP="vpnrad"
USERNAME="yabeletskiy"
PASSWORD="9lhWlxw3K3a7x4G7"

## -------------------------------------------------------------------
## One Time Password (OTP) configuration
## -------------------------------------------------------------------

SECRET="OL3KJGHXDPJKRCQR234XQXSY4N7BJR4LQJVLP24H5K6DXP7T56PGLWWY"
ALGORITHM="sha1"
DIGITS="6"
PERIOD="30"

## -------------------------------------------------------------------
## -------------------------------------------------------------------

echo "${otp-script-path}"
set -ex
newotp=$(${otp-script-path} -s ${SECRET} -a ${ALGORITHM} -d ${DIGITS} -p ${PERIOD})
echo "New otp: ${newotp}" 
otp=$(./otp -s ${SECRET} -a ${ALGORITHM} -d ${DIGITS} -p ${PERIOD})
# echo "This is the value specified for the input 'example_step_input': ${example_step_input}"
echo "Your OTP: ${otp}"
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
