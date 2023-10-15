local M = {}

function M.setup(on_attach, capabilities)
    local lspconfig = require 'lspconfig'
    lspconfig.gopls.setup {
        on_attach = function(client, bufnr)
            vim.o.list = false
            on_attach(client, bufnr)
        end,
        capabilities = capabilities,
        cmd = { 'gopls', 'serve' },
        settings = {
            gopls = {
                gofumpt = true,
                analyses = {
                    unreachable = true,
                    unusedparams = true,
                },
                staticcheck = true,
            },
        },
    }
end

return M
