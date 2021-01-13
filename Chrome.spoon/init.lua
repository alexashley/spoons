--- === Chrome ===
---
--- Functions for working with Google Chrome
local module = {
    name = "Chrome",
    version = "0.1.0",
    author = "Alex Ashley",
    license = "MIT - https://opensource.org/licenses/MIT",
    homepage = "https://github.com/alexashley/spoons"
}

--- Chrome.init()
--- Function
--- Configures the Chrome spoon
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

--- Chrome.findTabByUri(uri)
--- Function
--- Finds the first tab on that URI and puts it in focus
---
--- Parameters:
---  * uri - URI to locate
---
--- Returns:
---  * None
module.findTabByUri = function()
end

return module
