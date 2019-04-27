#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

readonly BASE_DIR="/volume/base"
readonly OUTPUT_DIR="/volume/output"
readonly PU_FILE_NAME='class-diagram.pu'
readonly PU_FILE_ABSOLUTE_PATH="${OUTPUT_DIR}/${PU_FILE_NAME}"

java -jar plantuml-dependency-cli-*/plantuml-dependency-cli-*-jar-with-dependencies.jar \
  --basedir "${BASE_DIR}" \
  -o "${PU_FILE_ABSOLUTE_PATH}"

sed -i -E '/ (java|org)\./d' "${PU_FILE_ABSOLUTE_PATH}"

java -jar plantuml.*.jar "${PU_FILE_ABSOLUTE_PATH}"
