#!/usr/bin/env bash
set -euo pipefail

pnpm i
pnpm run test --watchAll=false
source tools/lint.sh
