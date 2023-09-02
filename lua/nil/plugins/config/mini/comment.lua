local M = {}

M.config = function()
    local comment = require 'mini.comment'
    comment.setup {
        mappings = {
            comment = 'gc',
            comment_line = 'gcc',
        },
    }
end

return M
