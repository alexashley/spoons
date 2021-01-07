local module = {
    name = "Spotify",
    version = "0.1.0",
    author = "Alex Ashley",
    license = "MIT https://opensource.org/licenses/MIT",
    homepage = "https://github.com/alexashley/spoons"
}

module.init = function()
    module._logger = hs.logger.new(string.lower(module.name), 'debug')

    module._logger.d('init')
end

module.shuffle = function()
    module._runApplescript("tell application \"Spotify\" to set shuffling to true")
end

-- repeat is a Lua keyword
module.loop = function()
    module._runApplescript("tell application \"Spotify\" to set repeating to true")
end

module._runApplescript = function(script)
    module._logger.d(script)
    return hs.osascript.applescript(script)
end

