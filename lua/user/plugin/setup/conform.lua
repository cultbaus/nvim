local config = require 'user.plugin.config.conform'

return {
    { 'stevearc/conform.nvim', event = 'BufWritePre', cmd = 'ConformInfo', config = config.conform },
}
