local path = (...):gsub('%.init%', '')

local mason = require(path .. '.mason')
local lsp = require(path .. '.lsp')

local servers = {
    'lua_ls',
    'gopls',
    'tsserver',
    'bashls',
}

local tools = {
    'stylua',
    'shfmt',
    'prettierd',
    'stylua',
    'revive',
    'goimports',
}

return {
    { 'williamboman/mason.nvim', config = mason.mason_config },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim', config = mason.mason_tool_installer_config(tools) },
    { 'williamboman/mason-lspconfig.nvim', config = mason.mason_lsp_config(servers) },
    { 'neovim/nvim-lspconfig', config = lsp.config(servers), keys = lsp.keys },
}
