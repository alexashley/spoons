#!/usr/bin/env bash

set -euo pipefail

brew install --cask hammerspoon
make docs
make package

assets=()
for asset in *.zip; do
  assets+=("-a" "$asset")
done

version="v${VERSION}-$(git rev-parse --short HEAD)"

hub release create "${asset[*]}" -m "${version}" "${version}"
