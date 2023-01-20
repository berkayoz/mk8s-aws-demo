#!/bin/bash

sudo microk8s enable aws-ebs-csi-driver -k $AWS_ACCESS_KEY_ID -a $AWS_SECRET_ACCESS_KEY

sudo microk8s enable aws-efs-csi-driver -i $EFS_ID

sudo microk8s enable aws-elb-controller -c $CLUSTER_ID

sudo microk8s enable aws-iam-authenticator
# A restart is needed after updating the IAM authenticator ConfigMap in the cluster.
# sudo microk8s kubectl rollout restart ds aws-iam-authenticator -n kube-system