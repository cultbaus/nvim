local M = {}

M.conform = function()
    local conform = require 'conform'
    conform.setup {
        format_on_save = { lsp_fallback = true, timeout_ms = 500 },
        formatters_by_ft = {
            go = { 'gofumpt', 'goimports' },
            lua = { 'stylua' },
            markdown = { 'markdownlint' },
            ['*'] = { 'codespell' },
            ['_'] = { 'trim_whitespace' },
        },
    }
end

return M
