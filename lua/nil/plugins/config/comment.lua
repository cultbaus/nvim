return {
    'numToStr/Comment.nvim',
    config = function()
        local comment = require 'Comment'

        comment.setup {
            padding = true,
            mappings = {
                bassic = true,
                extra = true,
            },
        }
    end,
}
