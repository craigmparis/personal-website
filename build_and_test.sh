#!/usr/bin/env bash
set -euo pipefail

pnpm i
pnpm run test
pnpm run lint
npx prettier --check .
