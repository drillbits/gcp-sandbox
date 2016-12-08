#!/bin/bash

NAME=shot

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. ${DIR}/init.sh

echo "Create Kubernetes deployment: ${DEPLOY_NAME} by ${IMAGE_NAME}"
kubectl run ${DEPLOY_NAME} --image=${IMAGE_NAME} $@

echo "Expose deployment"
kubectl expose deployment ${DEPLOY_NAME}--port 80 --type="LoadBalancer"

echo "	$ kubectl get services"
