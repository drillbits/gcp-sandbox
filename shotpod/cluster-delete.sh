#!/bin/bash

NAME=shot

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. ${DIR}/init.sh

echo "Delete GKE cluster: ${CLUSTER_NAME}"
gcloud container clusters delete ${CLUSTER_NAME} --project ${PROJECT_ID}
