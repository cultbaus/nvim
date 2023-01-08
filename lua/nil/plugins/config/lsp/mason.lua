local M = {}

function M.mason()
    require('mason').setup {}
end

function M.mason_tool_installer()
    require('mason-tool-installer').setup {
        ensure_installed = {
            'eslint_d',
            'prettierd',
            'stylua',
            'gofumpt',
            'goimports-reviser',
            'gotests',
            'rustfmt',
            'shfmt',
            'delve',
        },
        auto_update = true,
        run_on_start = true,
    }
end

function M.mason_lsp_config()
    require('mason-lspconfig').setup {
        ensure_installed = {
            'sumneko_lua',
            'gopls',
            'tsserver',
            'bashls',
            'rust_analyzer',
        },
    }
end

return M
