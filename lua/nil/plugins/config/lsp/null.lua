local M = {}

function M.null_ls()
    local nls = require 'null-ls'
    local augroup = vim.api.nvim_create_augroup('Format', {})
    local lsp_formatting = function(bufnr)
        vim.lsp.buf.format {
            filter = function(clients)
                return vim.tbl_filter(function(client)
                    return client == 'null-ls'
                end, clients)
            end,
            bufnr = bufnr,
        }
    end
    local function on_attach(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    lsp_formatting(bufnr)
                end,
            })
        end
    end

    nls.setup {
        debounce = 150,
        save_after_format = false,
        on_attach = on_attach,
        diagnostics_format = '[#{c}] #{m} (#{s})',
        sources = {
            nls.builtins.formatting.prettierd.with { filetypes = { 'html', 'json', 'markdown' } },
            nls.builtins.formatting.eslint_d,
            nls.builtins.diagnostics.eslint_d,
            nls.builtins.formatting.goimports,
            nls.builtins.formatting.goimports_reviser.with {
                args = { { '-imports-order', 'std,general,company,project' } },
            },
            nls.builtins.formatting.gofumpt,
            nls.builtins.formatting.rustfmt,
            nls.builtins.formatting.stylua,
            nls.builtins.formatting.nixpkgs_fmt,
            nls.builtins.formatting.shfmt.with { args = { '-i', '2', '-ci' } },
        },
    }
end

return M
