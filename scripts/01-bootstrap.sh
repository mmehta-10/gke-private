#!/bin/bash
set -ex

BASEDIR=$(dirname $0)

if [ -z "$1" ]
  then
    echo "No argument supplied"
    exit 1
fi

export TERRAGRUNT_DOWNLOAD=${PWD}/.terragrunt-cache
export TERRAGRUNT_WORKING_DIR=${PWD}/live/01-common
# export TERRAGRUNT_PLAN_OUTPUT_DIR=$PWD/$(dirname $BASH_SOURCE)
# export TERRAGRUNT_INCLUDE_EXTERNAL_DEPENDENCIES=true #same as --terragrunt-include-external-dependencies 
# export TF_INPUT=false # same as --terragrunt-non-interactive

# cd bootstrap
# terraform fmt

source $BASEDIR/00-env.sh

case $1 in
  init | i)
    terragrunt init -reconfigure
    ;;
  plan | p)
    terragrunt plan
    ;;
  apply | a)
    terraform apply -auto-approve
    ;;
  destroy | d)
    terraform destroy -auto-approve
    ;;
  validate | v)
    terraform validate
    ;;
esac
