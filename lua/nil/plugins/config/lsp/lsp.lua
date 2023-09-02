local M = {}

M.config = function(servers)
    return function()
        vim.diagnostic.config {
            underline = true,
            virtual_text = false,
            signs = true,
            update_in_insert = true,
            float = { border = 'single' },
        }
        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = 'single',
        })
        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = 'single',
        })
        for _, server in pairs(servers) do
            require('nil.plugins.config.lsp.servers.' .. server).setup(
                function() end,
                require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            )
        end
    end
end

M.keys = {
    { 'gd', vim.lsp.buf.definition },
    { 'gf', vim.lsp.buf.formatting },
    { 'gr', vim.lsp.buf.references },
    { 'K', vim.lsp.buf.hover },
    { 'qf', vim.lsp.buf.code_action },
    { '<leader>rn', vim.lsp.buf.rename },
    { 'fne', vim.diagnostic.goto_next },
    { 'fpe', vim.diagnostic.goto_prev },
}

return M
