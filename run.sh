#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

readonly SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
readonly IMAGE_NAME='class-diagram-generator-for-java'

exist_target_image() {
  docker image ls | grep "${IMAGE_NAME}"

  if [[ "$?" != 0 ]]; then
    echo 'false'
  else
    echo 'true'
  fi
}

build_image_if_needed() {
  if [[ "$(exist_target_image)" = 'false' ]]; then
    docker build -t "${IMAGE_NAME}" "${SCRIPT_DIR}"
  fi
}

generate_class_diagram() {
  local host_base_dir="$1"
  local container_base_dir="/work"
  local container_working_dir="/app"
  local pu_file="${container_base_dir}/output.pu"

  local host_base_dir_absolute="$(cd "${host_base_dir}"; pwd)"

  docker run \
    --rm \
    -v "${host_base_dir_absolute}:${container_base_dir}" \
    -w "${container_working_dir}" \
    "${IMAGE_NAME}" \
    bash -c \
      "java -jar plantuml-dependency-cli-*/plantuml-dependency-cli-*-jar-with-dependencies.jar \
        --basedir "${container_base_dir}" \
        -o "${pu_file}" \
      && sed -i '/ java\./d' "${pu_file}" \
      && java -jar plantuml.*.jar "${pu_file}""
}

main() {
  build_image_if_needed
  generate_class_diagram "$1"
}

main "$@"
