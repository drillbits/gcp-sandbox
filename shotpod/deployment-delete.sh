#!/bin/bash

NAME=shot

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. ${DIR}/init.sh

echo "Delete Kubernetes deployment: ${DEPLOY_NAME}"
kubectl delete deployments,services ${DEPLOY_NAME}
