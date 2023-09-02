local M = {}

function M.setup(on_attach, capabilities)
    local lspconfig = require 'lspconfig'
    lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_attach = function(client)
            on_attach(client)
        end,
        root_dir = require('lspconfig').util.root_pattern '.git/',
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = { 'vim', 'awesome', 'client', 'screen' },
                },
                workspace = {
                    library = {
                        [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                        [vim.fn.stdpath 'config' .. '/lua'] = true,
                    },
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    }
end

return M
