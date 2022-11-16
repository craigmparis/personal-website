#!/usr/bin/env bash
set -euo pipefail

source ./tools/bootstrap.sh

npx prettier --check .
npx textlint "**/*"
npx eslint .
npx markdownlint-cli2 "**/*.md" "#node_modules" "#tools/.*/**"
npx jscpd .

# Comment these out for now until the bootstrapper is ready
# terraform -chdir=infrastructure fmt -check
# tflint infrastructure
