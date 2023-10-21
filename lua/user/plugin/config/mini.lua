local util = require 'user.plugin.util'

local M = {}

M.ai = function()
    local ai = require 'mini.ai'
    ai.setup {
        n_lines = 500,
        custom_textobjects = {
            o = ai.gen_spec.treesitter({
                a = { '@block.outer', '@conditional.outer', '@loop.outer' },
                i = { '@block.inner', '@conditional.inner', '@loop.inner' },
            }, {}),
            f = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }, {}),
            c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }, {}),
            t = { '<([%p%w]-)%f[^<%w][^<>]->.-</%1>', '^<.->().*()</[^/]->$' },
        },
        silent = true,
    }
end

M.comment = function()
    local comment = require 'mini.comment'
    comment.setup {
        mappings = {
            comment = 'gc',
            comment_line = 'gcc',
        },
    }
end

M.files = function()
    local files = require 'mini.files'
    files.setup {
        mappings = {
            close = 'q',
            go_in_plus = '<CR>',
            go_out_plus = '<BS>',
            reset = '<Esc>',
            synchronize = ':w',
            trim_left = '<',
            trim_right = '>',
        },
        windows = { max_number = 1 },
    }
end

M.files_keys = {
    {
        '<C-n>',
        function()
            require('mini.files').open()
        end,
    },
}

M.pick = function()
    local pick = require 'mini.pick'
    pick.setup {
        mappings = {
            move_down = '<C-j>',
            move_up = '<C-k>',
        },
        window = { config = util.mini.window_config },
    }
end

M.pick_keys = {
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
            local mini_pick = require 'mini.pick'
            local diagnostics = util.mini.get_diagnostics()
            if #diagnostics == 0 then
                util.fn.echo({ { 'No errors found', 'DiagnosticInfo' } }, true)
                return
            end
            require('mini.pick').start {
                source = {
                    items = diagnostics,
                    name = 'Diagnostics',
                    show = function(bufnr, results, query)
                        local lines, extmarks =
                            util.mini.get_lines_and_extmarks(results, util.mini.make_diagnostics_prefix)
                        mini_pick.default_show(bufnr, lines, query)
                        util.mini.set_extmarks(bufnr, extmarks, vim.api.nvim_create_namespace 'DiagnosticError')
                    end,
                },
            }
        end,
    },
}

return M
