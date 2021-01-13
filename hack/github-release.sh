#!/usr/bin/env bash

set -euo pipefail

function installHammerspoon() {
    brew install --cask hammerspoon
    # enable AppleScript
    defaults write org.hammerspoon.Hammerspoon HSAppleScriptEnabledKey 1

    read -r -d '\0' installCli << EOF
tell application "Hammerspoon"
  execute lua code "hs.ipc.cliInstall(nil, true)"
end tell
\0
EOF
    # install the hs cli
    osascript -l AppleScript -e "$installCli"
}

installHammerspoon
make docs
make package

assets=()
for asset in *.zip; do
  assets+=("-a" "$asset")
done

version="v${VERSION}-$(git rev-parse --short HEAD)"

hub release create "${asset[*]}" -m "${version}" "${version}"
