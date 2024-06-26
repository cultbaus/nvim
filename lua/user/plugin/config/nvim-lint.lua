local M = {}

M.nvim_lint = function()
    local lint = require 'lint'

    local revive = require('lint').linters.revive
    revive.args = {
        '-config',
        'revive.toml',
    }
    lint.linters_by_ft = {
        go = { 'revive' },
    }
    vim.api.nvim_create_autocmd({ 'BufEnter', 'TextChanged', 'InsertLeave', 'BufWritePost' }, {
        callback = function()
            lint.try_lint()
        end,
    })
end

return M
