#!/usr/bin/env bash
# Copyright Amazon.com Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

REPO="$1"
OUTPUT_DIR="$2"
PACKAGE_FILTER="$3"
REPO_SUBPATH="${4:-}"
GOLANG_VERSION="${5:-}"
LICENSE_THRESHOLD="${6:-}"

SCRIPT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
source "${SCRIPT_ROOT}/common.sh"

cd $REPO/$REPO_SUBPATH
build::gather_licenses $OUTPUT_DIR "$PACKAGE_FILTER" "$GOLANG_VERSION" "$LICENSE_THRESHOLD"
