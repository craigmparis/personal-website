#!/usr/bin/env bash
set -euo pipefail

npx prettier --check .
npx textlint "**/*"
npx eslint .
npx markdownlint-cli2 "**/*.md" "#node_modules" "#tools/.*/**"
npx jscpd .

terraform -chdir=infrastructure fmt -check
tflint infrastructure
