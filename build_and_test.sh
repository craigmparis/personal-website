#!/usr/bin/env bash
set -euo pipefail

source tools/bootstrap.sh

pnpm i

pushd frontend
pnpm run test --watchAll=false
popd

pushd buildtool
npx tsc
pnpm run test
popd

source tools/lint.sh
