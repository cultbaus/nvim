local M = {}

function M.setup(on_attach, capabilities)
    local lspconfig = require 'lspconfig'
    lspconfig.bashls.setup {
        capabilities = capabilities,
        on_attach = function(client)
            on_attach(client)
        end,
    }
end

return M
