#!/usr/bin/env bash
set -euo pipefail

pnpm i
pnpm run test
source tools/lint.sh
