#!/bin/bash

apply () {
    cd vpc
    terraform init
    terraform apply --auto-approve
    cd ../subnet
    terraform init
    terraform apply --auto-approve
}

plan () {
    cd vpc
    terraform init
    terraform plan
    cd ../subnet
    terraform init
    terraform plan
}

destroy () {
    cd subnet
    terraform init
    terraform destroy --auto-approve
    cd ../vpc
    terraform init
    terraform destroy --auto-approve
}

case "$1" in
    "apply") apply
    ;;
    "plan") plan
    ;;
    "destroy") destroy
    ;;
    *) echo "Usage: $0 {apply|plan|destroy}"
    ;;
esac
        