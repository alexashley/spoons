#!/usr/bin/env bash

set -euo pipefail

for spoon in *.spoon; do
  echo "Building documentation JSON for $spoon"
  pushd $spoon
  hs -c "hs.doc.builder.genJSON(\"$(pwd)\")" | grep -v "^--" > docs.json
  popd
done
