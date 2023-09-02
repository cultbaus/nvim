return {
    'mfussenegger/nvim-lint',
    config = function()
        local lint = require 'lint'
        lint.linters_by_ft = {
            go = { 'revive' },
            typescript = { 'eslint_d' },
        }
        vim.api.nvim_create_autocmd({ 'BufEnter', 'TextChanged', 'InsertLeave', 'BufWritePost' }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
