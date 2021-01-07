#!/usr/bin/env bash

set -euo pipefail

for spoon in *.spoon; do
  echo "Packaging $spoon"
  zip "${spoon%%.*}.zip" $spoon
done
