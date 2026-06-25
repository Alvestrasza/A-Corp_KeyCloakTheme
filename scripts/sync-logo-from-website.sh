#!/usr/bin/env bash
# File Name     : sync-logo-from-website.sh
# Version       : v0.1.0
# Created       : 2026-06-25
# Last Modified : 2026-06-25
# Author        : Nouramon Alvestrasza
# Organization  : Alvestrasza Corporation
# Description   : Copy the official A-Corp website logo into the Keycloak login theme.

set -euo pipefail

WEBSITE_REPO="${1:-../A-Corp_Website}"
SOURCE_LOGO="${WEBSITE_REPO}/public/assets/alvestrasza-emblem-transparent.png"
TARGET_LOGO="themes/acorp-login/login/resources/img/alvestrasza-emblem-transparent.png"
CSS_FILE="themes/acorp-login/login/resources/css/acorp-login.css"

if [[ ! -f "${SOURCE_LOGO}" ]]; then
  echo "Logo not found: ${SOURCE_LOGO}" >&2
  exit 1
fi

cp "${SOURCE_LOGO}" "${TARGET_LOGO}"
python3 - <<'PY'
from pathlib import Path
css = Path('themes/acorp-login/login/resources/css/acorp-login.css')
text = css.read_text(encoding='utf-8')
text = text.replace('url("../img/alvestrasza-emblem.svg")', 'url("../img/alvestrasza-emblem-transparent.png")')
css.write_text(text, encoding='utf-8')
PY

echo "Synchronized logo from ${SOURCE_LOGO}"
