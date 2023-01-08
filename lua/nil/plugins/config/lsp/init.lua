local mason = require 'nil.plugins.config.lsp.mason'
local null = require 'nil.plugins.config.lsp.null'
local lsp = require 'nil.plugins.config.lsp.lsp'

return {
    { 'williamboman/mason.nvim', config = mason.mason },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim', config = mason.mason_tool_installer },
    { 'williamboman/mason-lspconfig.nvim', config = mason.mason_lsp_config },
    { 'jose-elias-alvarez/null-ls.nvim', config = null.null_ls },
    {
        'neovim/nvim-lspconfig',
        keys = {
            { 'gd', vim.lsp.buf.definition },
            { 'gf', vim.lsp.buf.formatting },
            { 'gr', vim.lsp.buf.references },
            { 'K', vim.lsp.buf.hover },
            { 'qf', vim.lsp.buf.code_action },
            { '<leader>rn', vim.lsp.buf.rename },
            { 'fne', vim.diagnostic.goto_next },
            { 'fpe', vim.diagnostic.goto_prev },
        },
        config = lsp.nvim_lspconfig,
    },
}
