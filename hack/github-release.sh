#!/usr/bin/env bash

set -euo pipefail

function installHammerspoon() {
    brew install --cask hammerspoon
    # enable AppleScript: https://github.com/Hammerspoon/hammerspoon/blob/c16bbeb8606486076cbcedf6891b1137bf65b8ec/Hammerspoon/HSAppleScript.m#L69-L71
    defaults write org.hammerspoon.Hammerspoon HSAppleScriptEnabledKey 1
    # install the hs cli
    osascript -l AppleScript -e 'tell application "Hammerspoon" to execute lua code "hs.ipc.cliInstall(nil, true)"'
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
