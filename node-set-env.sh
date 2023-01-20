#!/bin/bash

export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)

ssh ubuntu@"$1" "
    sudo echo CLUSTER_ID=mk8s | sudo tee -a /etc/environment > /dev/null
    sudo echo AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} | sudo tee -a /etc/environment > /dev/null
    sudo echo AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} | sudo tee -a /etc/environment > /dev/null
"

scp -r ./manifests ubuntu@"$1":~