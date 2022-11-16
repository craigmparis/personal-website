#!/usr/bin/env bash
set -euo pipefail

source tools/bootstrap_node.sh
source tools/bootstrap_pnpm.sh

pushd frontend
pnpm i
pnpm run test --watchAll=false
popd

source tools/lint.sh
