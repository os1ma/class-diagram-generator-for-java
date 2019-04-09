#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

readonly IMAGE_NAME='os1ma/class-diagram-generator-for-java'
readonly IMAGE_TAG='latest'
readonly CONTAINER_BASE_DIR="/work"
readonly CONTAINER_WORKING_DIR="/app"
readonly PU_FILE="${CONTAINER_BASE_DIR}/output.pu"

readonly SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly HOST_BASE_DIR="$1"
readonly HOST_BASE_DIR_ABSOLUTE="$(cd "${HOST_BASE_DIR}"; pwd)"

docker run \
  --rm \
  -v "${HOST_BASE_DIR_ABSOLUTE}:${CONTAINER_BASE_DIR}" \
  -w "${CONTAINER_WORKING_DIR}" \
  "${IMAGE_NAME}:${IMAGE_TAG}" \
  bash -c \
    "java -jar plantuml-dependency-cli-*/plantuml-dependency-cli-*-jar-with-dependencies.jar \
      --basedir "${CONTAINER_BASE_DIR}" \
      -o "${PU_FILE}" \
    && sed -i '/ java\./d' "${PU_FILE}" \
    && java -jar plantuml.*.jar "${PU_FILE}""
