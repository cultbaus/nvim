return {
    'stevearc/conform.nvim',
    config = function()
        local conform = require 'conform'
        conform.setup {
            format_on_save = { lsp_fallback = true, timeout_ms = 500 },
            formatters_by_ft = {
                go = { 'gofmt', 'goimports' },
                lua = { 'stylua' },
                markdown = { 'prettierd' },
                sh = { 'shfmt' },
                typescript = { 'prettierd' },
            },
        }
    end,
}
