local _border = 'single'

vim.diagnostic.config {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    float = { border = _border },
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = _border,
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = _border,
})
