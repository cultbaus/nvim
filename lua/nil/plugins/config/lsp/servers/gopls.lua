local M = {}

function M.setup(on_attach, capabilities)
    local lspconfig = require 'lspconfig'
    lspconfig.gopls.setup {
        on_attach = function()
            vim.o.list = false
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
