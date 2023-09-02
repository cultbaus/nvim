local M = {}

function M.setup(on_attach, capabilities)
    local lspconfig = require 'lspconfig'
    lspconfig.tsserver.setup {
        capabilities = capabilities,
        on_attach = function(client)
            if client.config.flags then
                client.config.flags.allow_incremental_sync = true
            end
            on_attach(client)
        end,
    }
end

return M
