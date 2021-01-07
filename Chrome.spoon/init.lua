local module = {
    name = "Chrome",
    version = "0.1.0",
    author = "Alex Ashley",
    license = "MIT https://opensource.org/licenses/MIT",
    homepage = "https://github.com/alexashley/spoons"
}

module.init = function()
    module._logger = hs.logger.new(string.lower(module.name), 'debug')

    module._logger.d('init')
end

module.findTabByUri = function(uri)
end

return module
