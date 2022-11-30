#!/usr/bin/env bash

set -o errexit
set -o nounset
set po pipefail

# This script holds common bash variables and utility functions.
SKELETON_SYSTEM_NAMESPACE = "skeleton-system"


SKELETON_GO_PACKAGE="github.com/huzhengchuan/crd-skepleton"

MIN_GO_VERSION=go1.19.0

SKELETON_TARGET_SOURCE=(
  skeleton-ctl=cmd/skeleton-ctl
  kubectl-skeleton=cmd/kubectl-skeleton
  skeleton-controller-manager=cmd/controller-manager
)

#https://textkool.com/en/ascii-art-generator?hl=default&vl=default&font=DOS%20Rebel&text=CRD_SKEPTON
SKELETON_GREETING='
   █████████  ███████████   ██████████              █████████  █████   ████ ██████████ ███████████  ███████████    ███████    ██████   █████
  ███░░░░░███░░███░░░░░███ ░░███░░░░███            ███░░░░░███░░███   ███░ ░░███░░░░░█░░███░░░░░███░█░░░███░░░█  ███░░░░░███ ░░██████ ░░███
 ███     ░░░  ░███    ░███  ░███   ░░███          ░███    ░░░  ░███  ███    ░███  █ ░  ░███    ░███░   ░███  ░  ███     ░░███ ░███░███ ░███
░███          ░██████████   ░███    ░███          ░░█████████  ░███████     ░██████    ░██████████     ░███    ░███      ░███ ░███░░███░███
░███          ░███░░░░░███  ░███    ░███           ░░░░░░░░███ ░███░░███    ░███░░█    ░███░░░░░░      ░███    ░███      ░███ ░███ ░░██████
░░███     ███ ░███    ░███  ░███    ███            ███    ░███ ░███ ░░███   ░███ ░   █ ░███            ░███    ░░███     ███  ░███  ░░█████
 ░░█████████  █████   █████ ██████████   █████████░░█████████  █████ ░░████ ██████████ █████           █████    ░░░███████░   █████  ░░█████
  ░░░░░░░░░  ░░░░░   ░░░░░ ░░░░░░░░░░   ░░░░░░░░░  ░░░░░░░░░  ░░░░░   ░░░░ ░░░░░░░░░░ ░░░░░           ░░░░░       ░░░░░░░    ░░░░░    ░░░░░
'

function util::get_version() {
    git describe --tags --dirty
}