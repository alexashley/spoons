--- === Spotify ===
---
--- Extra Spotify-related functions not in hs.spotify
local module = {
    name = "Spotify",
    version = "0.1.0",
    author = "Alex Ashley",
    license = "MIT - https://opensource.org/licenses/MIT",
    homepage = "https://github.com/alexashley/spoons"
}

--- Spotify.init()
--- Function
--- Configures the Spotify spoon
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
module.init = function()
    module._logger = hs.logger.new(string.lower(module.name), 'debug')

    module._logger.d('init')
end

--- Spotify.shuffle(enabled)
--- Function
--- Sets shuffle on/off
---
--- Parameters:
---  * enabled - boolean, set shuffle on (true) or off (false)
---
--- Returns:
---  * None
module.shuffle = function(enabled)
    local state = "false"
    if enabled then
        state = "true"
    end

    module._runApplescript("tell application \"Spotify\" to set shuffling to " .. state)
end

--- Spotify.loop(enabled)
--- Function
--- Sets repeat on/off. Repeat is Lua keyword, hence "loop".
---
--- Parameters:
---  * enabled - boolean, set repeat on (true) or off (false)
---
--- Returns:
---  * None
module.loop = function(enabled)
    local state = "false"
    if enabled then
        state = "true"
    end

    module._runApplescript("tell application \"Spotify\" to set repeating to ".. state)
end

module._runApplescript = function(script)
    module._logger.d(script)
    return hs.osascript.applescript(script)
end

return module
