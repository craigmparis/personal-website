#!/usr/bin/env bash
set -euo pipefile

docker pull github/super-linter:latest
docker run -e RUN_LOCAL=true -env-file .github/super-linter.env  -v /path/to/local/codebase:/tmp/lint github/super-linter
 