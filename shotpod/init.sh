#!/bin/bash

if [ "${NAME}" = "" ]; then
	echo "Set base name: "
	read NAME
fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV=${DIR}/.env

if [ -e ${ENV} ] && [ "${1}" != "clean" ]; then
	echo "Load .env: ${ENV}"
	. ${ENV}
else
	echo "Create .env: ${ENV}"
	echo -n "GCP Project ID: "
	read PROJECT_ID

	echo "PROJECT_ID=${PROJECT_ID}" > ${ENV}
	echo "CLUSTER_NAME=${NAME}" >> ${ENV}
	echo "DEPLOY_NAME=${NAME}-node" >> ${ENV}
	echo "IMAGE_NAME=asia.gcr.io/${PROJECT_ID}/${NAME}" >> ${ENV}
	echo "ZONE=asia-northeast1-a" >> ${ENV}
	. ${ENV}
fi

if [ "${1}" == "clean" ]; then
	shift
fi

echo ""
cat ${ENV}
echo ""
