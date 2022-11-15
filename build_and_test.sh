#!/usr/bin/env bash
set -euo pipefail

dart=$(realpath "tools/.dart/dart-sdk/bin/dart")

# test Dart
pushd tools/buildtool
$dart test test/buildtool_test.dart --chain-stack-traces
popd

# source tools/bootstrap_node.sh
# source tools/bootstrap_pnpm.sh

# pnpm i
# pnpm run test --watchAll=false
# source tools/lint.sh
