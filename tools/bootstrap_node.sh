#!/usr/bin/env bash
set -euo pipefail

source VERSIONS.env
parent_folder=$(realpath "tools/.node")
destination_folder="${parent_folder}/node-v${NODE_VERSION}-linux-x64"
node_bin=${destination_folder}/bin
node="${node_bin}/node"
npm="${node_bin}/npm"
node_xz="${destination_folder}.tar.xz"
node_url="https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz"
if [[ ! -f "${node}" ]]; then
  mkdir -p "${parent_folder}"
  curl "${node_url}" -o "${node_xz}"
  tar -xf "${node_xz}" -C "${parent_folder}"
  rm "${node_xz}"
  rm "${npm}"
fi

$node --version

export node=$node
export PATH="${node_bin}:${PATH}"
