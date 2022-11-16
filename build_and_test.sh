#!/usr/bin/env bash
set -euo pipefail

source tools/bootstrap.sh

pnpm i

pushd frontend
pnpm run test --watchAll=false
popd

pushd buildtool
npx tsc
popd

source tools/lint.sh
