#!/usr/bin/env bash
set -euo pipefail

npx prettier --check .
npx textlint "**/*"
