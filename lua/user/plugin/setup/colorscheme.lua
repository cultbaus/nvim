local config = require 'user.plugin.config.colorscheme'

return {
    { 'noahfrederick/vim-noctu', config = config.colorscheme, lazy = false },
}
