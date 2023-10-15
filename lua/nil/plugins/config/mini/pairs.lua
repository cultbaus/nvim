local M = {}

M.config = function()
    local pairs = require 'mini.pairs'
    pairs.setup {
        modes = {
            insert = true,
            command = false,
            terminal = false,
        },
    }
end

return M
