#!/usr/bin/env bash
set -euo pipefail

source tools/bootstrap_node.sh
source tools/bootstrap_pnpm.sh

pnpm i
pnpm run test --watchAll=false
source tools/lint.sh
