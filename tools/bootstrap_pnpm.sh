#!/usr/bin/env bash
set -euo pipefail

source VERSIONS.env
parent_folder=$(realpath "tools/pnpm")
destination_folder="${parent_folder}/pnpm-v${PNPM_VERSION}"
pnpm="${destination_folder}/pnpm"
pnpm_tgz="${destination_folder}/linux-x64-${PNPM_VERSION}.tgz"
pnpm_url="https://registry.npmjs.org/@pnpm/linux-x64/-/linux-x64-${PNPM_VERSION}.tgz"
if [[ ! -f "${pnpm}" ]]; then
  mkdir -p "${destination_folder}"
  curl "${pnpm_url}" -o "${pnpm_tgz}"
  tar -xzf "${pnpm_tgz}" -C "${destination_folder}" --strip-components=1
  chmod +x "${pnpm}"
  rm "${pnpm_tgz}"
fi

$pnpm --version

export pnpm=$pnpm
export PATH="${destination_folder}:${PATH}"
