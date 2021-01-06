local module = {
    name = "keyboard",
    version = "0.1.0",
    author = "Alex Ashley",
    license = "MIT https://opensource.org/licenses/MIT",
    homepage = "https://github.com/alexashley/spoons"
}

module.init = function()
    module._logger = hs.logger.new(module.name, 'debug')

    module._logger.d('init')
end

local tellSystemEvents = function(message)
    local systemEvents = "tell application \"System Events\" to keystroke "

    return hs.osascript.applescript(systemEvents .. message)
end

module.type = function(line)
    -- TODO: escape single/double quotes in line
    -- TODO: wrap line in double quote
    tellSystemEvents(line)
end

module.typeLines = function(lines)
    for _, line in ipairs(lines) do
        module.type(line)
        -- delay 1
        tellSystemEvents("return")
    end
end

module.lockScreen = function()
    tellSystemEvents("'q' using {control down, command down}")
end

return module
