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
            local errs = vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR })
            local items = vim.tbl_map(function(err)
                return { bufnr = err.bufnr, lnum = err.lnum, col = err.col, text = err.message }
            end, errs)
            if #items == 0 then
                print 'No errors found.'
                return
            end
            require('mini.pick').start {
                source = {
                    items = items,
                    name = 'Diagnostics',
                    show = function(bufnr, xs, _, _)
                        local ns_id = vim.api.nvim_create_namespace 'DiagnosticError'
                        local extmarks = {}
                        local lines = vim.tbl_map(function(x)
                            local file = vim.fn.fnamemodify(vim.fn.bufname(x.bufnr), ':t')
                            local prefix = string.format('[%s:%s:%s] ', file, x.lnum, x.col)
                            local line = prefix .. x.text:gsub('\n', ' '):gsub('\t', string.rep(' ', vim.o.tabstop))
                            if string.len(prefix) <= string.len(line) then
                                table.insert(extmarks, string.len(prefix))
                            end
                            return line
                        end, xs)
                        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
                        for i, end_col in ipairs(extmarks) do
                            vim.api.nvim_buf_set_extmark(bufnr, ns_id, i - 1, 0, {
                                end_col = end_col,
                                hl_group = 'DiagnosticError',
                            })
                        end
                    end,
                },
            }
        end,
    },
}

return M
