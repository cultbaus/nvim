local M = {}

M.conform = function()
    local conform = require 'conform'
    conform.setup {
        notify_on_error = false,
        format_on_save = { lsp_fallback = true, timeout_ms = 500 },
        formatters_by_ft = {
            go = { 'gofumpt', 'goimports' },
            lua = { 'stylua' },
            markdown = { 'markdownlint' },
            sh = { 'shfmt' },
            bash = { 'shfmt' },
            ['*'] = { 'codespell' },
            ['_'] = { 'trim_whitespace' },
        },
    }
end

return M
