local util = require 'user.plugin.util'

local M = {}

M.core = function()
    local mason = require 'mason'
    mason.setup {}
end

M.lsp = function()
    local mason_lspconfig = require 'mason-lspconfig'
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local handlers = util.mason.make_handlers(capabilities)
    mason_lspconfig.setup {
        ensure_installed = {
            'gopls',
            'marksman',
            'lua_ls',
        },
        handlers = handlers,
    }
end

M.installer = function()
    local installer = require 'mason-tool-installer'
    installer.setup {
        ensure_installed = {
            'gofumpt',
            'goimports',
            'markdownlint',
            'shfmt',
            'stylua',
            'revive',
        },
    }
end

return M
