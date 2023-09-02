local M = {}

M.config = function()
    require('mini.pick').setup {
        mappings = {
            move_down = '<C-j>',
            move_up = '<C-k>',
        },
        window = {
            config = function()
                local height = math.floor(0.618 * vim.o.lines)
                local width = math.floor(0.618 * vim.o.columns)
                return {
                    anchor = 'NW',
                    height = height,
                    width = width,
                    row = math.floor(0.5 * (vim.o.lines - height)),
                    col = math.floor(0.5 * (vim.o.columns - width)),
                }
            end,
        },
    }
end

M.keys = {
    {
        '<C-p>',
        function()
            require('mini.pick').builtin.files { tool = 'git' }
        end,
    },
    {
        '<C-g>',
        function()
            require('mini.pick').builtin.grep_live { tool = 'rg' }
        end,
    },
    {
        'fae',
        function()
            local items = {}
            for _, err in ipairs(vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR })) do
                table.insert(items, {
                    bufnr = err.bufnr,
                    lnum = err.lnum,
                    col = err.col,
                    text = string.format(
                        '[%s:%s:%s] %s',
                        vim.fn.fnamemodify(vim.fn.bufname(err.bufnr), ':t'),
                        err.lnum,
                        err.col,
                        err.message
                    ),
                })
            end
            if #items == 0 then
                print 'No errors found.'
                return
            end
            require('mini.pick').start {
                source = {
                    items = items,
                    name = 'Diagnostics',
                },
            }
        end,
    },
}

return M
