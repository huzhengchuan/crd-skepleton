#!/usr/bin/env bash

set -o errexit
set -o nounset
set po pipefail


SKEPLETON_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
source "${SKEPLETON_ROOT}/hack/util.sh"

util::get_version