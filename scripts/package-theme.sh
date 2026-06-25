#!/usr/bin/env bash
# File Name     : package-theme.sh
# Version       : v0.1.0
# Created       : 2026-06-25
# Last Modified : 2026-06-25
# Author        : Nouramon Alvestrasza
# Organization  : Alvestrasza Corporation
# Description   : Package the A-Corp Keycloak theme into a distributable ZIP archive.

set -euo pipefail

THEME_NAME="acorp-login"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
DIST_DIR="${REPO_ROOT}/dist"

mkdir -p "${DIST_DIR}"
rm -f "${DIST_DIR}/${THEME_NAME}.zip"

cd "${REPO_ROOT}/themes"
zip -qr "${DIST_DIR}/${THEME_NAME}.zip" "${THEME_NAME}"

echo "Created ${DIST_DIR}/${THEME_NAME}.zip"
