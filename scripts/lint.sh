#!/bin/bash

set -xeuo pipefail

cd ./live
terragrunt hclfmt
terraform fmt -recursive

cd ../modules
terraform fmt -recursive
