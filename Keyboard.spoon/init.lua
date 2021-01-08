--- === Keyboard ===
---
--- A handful of functions to automate typing.
local module = {
    name = "Keyboard",
    version = "0.1.0",
    author = "Alex Ashley",
    license = "MIT - https://opensource.org/licenses/MIT",
    homepage = "https://github.com/alexashley/spoons"
}

--- Keyboard.init()
--- Function
--- Configures the Keyboard spoon
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

--- Keyboard.type(line)
--- Function
--- Types the contents into whatever window is currently active.
---
--- Parameters:
---  * line - A string of characters to type. Any double quotes will be escaped.
---
--- Returns:
---  * None
module.type = function(line)
    module._logger.d(line)
    module._delay(5)
    local escaped = "\"" .. string.gsub(line, "\"", "\\\"") .. "\""
    module._tellSystemEvents(escaped)
end

--- Keyboard.typeLines(lines)
--- Function
--- Type several lines of content into whatever window is currently active.
---
--- Parameters:
---  * lines - A table of lines to type. Any double quotes will be escaped. Between each line is a brief delay and a return.
---
--- Returns:
---  * None
module.typeLines = function(lines)
    for _, line in ipairs(lines) do
        module.type(line)
        module._delay(1)
        module._tellSystemEvents("return")
    end
end

--- Keyboard.lockScreen()
--- Function
--- Enters the lock screen shortcut
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
module.lockScreen = function()
    module._tellSystemEvents("\"q\" using {control down, command down}")
end

module._runApplescript = function(script)
    module._logger.d(script)
    return hs.osascript.applescript(script)
end

module._tellSystemEvents = function(message)
    return module._runApplescript("tell application \"System Events\" to keystroke " .. message)
end

module._delay = function(seconds)
    module._runApplescript(string.format("delay %d", seconds))
end

return module
