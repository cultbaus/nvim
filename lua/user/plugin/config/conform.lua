local M = {}

M.conform = function()
    local conform = require 'conform'
    conform.setup {
        notify_on_error = false,
        format_after_save = { lsb_fallback = true },
        formatters_by_ft = {
            c = { 'clang_format' },
            cpp = { 'clang_format' },
            go = { 'gofumpt', 'goimports' },
            lua = { 'stylua' },
            markdown = { 'markdownlint' },
            sh = { 'shfmt' },
            bash = { 'shfmt' },
            ['_'] = { 'trim_whitespace' },
        },
    }
end

return M
