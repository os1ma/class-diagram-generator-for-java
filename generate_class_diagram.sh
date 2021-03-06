#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

readonly IMAGE_NAME='os1ma/class-diagram-generator-for-java'
readonly IMAGE_TAG='latest'
readonly CONTAINER_BASE_DIR="/volume/base"
readonly CONTAINER_OUTPUT_DIR="/volume/output"

readonly HOST_BASE_DIR="$1"
readonly HOST_BASE_DIR_ABSOLUTE_PATH="$(cd "${HOST_BASE_DIR}"; pwd)"
readonly HOST_OUTPUT_DIR="$2"
mkdir -p "${HOST_OUTPUT_DIR}"
readonly HOST_OUTPUT_DIR_ABSOLUTE_PATH="$(cd "${HOST_OUTPUT_DIR}"; pwd)"

docker run \
  --rm \
  -v "${HOST_BASE_DIR_ABSOLUTE_PATH}:${CONTAINER_BASE_DIR}" \
  -v "${HOST_OUTPUT_DIR_ABSOLUTE_PATH}:${CONTAINER_OUTPUT_DIR}" \
  "${IMAGE_NAME}:${IMAGE_TAG}"
