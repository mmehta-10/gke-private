#!/bin/bash

rm -rf live/*/.terragrunt-cache
rm -rf live/*/.terraform.lock.hcl

# Kill IAP tunnel
if command -v pkill; then
  pkill -f 'gcloud.*start-iap-tunnel'
fi