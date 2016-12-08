#!/bin/bash

NAME=shot

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. ${DIR}/init.sh

echo "Create GKE cluster: ${CLUSTER_NAME}"
set -x
gcloud container clusters create ${CLUSTER_NAME} --project ${PROJECT_ID} $@
gcloud container clusters get-credentials ${CLUSTER_NAME} --project ${PROJECT_ID}
