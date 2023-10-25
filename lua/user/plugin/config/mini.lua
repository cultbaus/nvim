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

M.base16 = function()
    local base16 = require 'mini.base16'
    local diagnostic = {
        error = '#FF5900',
        warn = '#FFD400',
        info = '#00FF64',
        hint = '#00FFE5',
    }
    local light = {
        base00 = '#F5F5F5',
        base01 = '#D0D0D0',
        base02 = '#A9A9A9',
        base03 = '#8C8C8C',
        base04 = '#6E6E6E',
        base05 = '#595959',
        base06 = '#404040',
        base07 = '#1A1A1A',
        base08 = '#696969',
        base09 = '#757575',
        base0A = '#828282',
        base0B = '#8E8E8E',
        base0C = '#9A9A9A',
        base0D = '#A7A7A7',
        base0E = '#B3B3B3',
        base0F = '#C0C0C0',
    }
    local dark = {
        base00 = '#181818',
        base01 = '#282828',
        base02 = '#383838',
        base03 = '#585858',
        base04 = '#787878',
        base05 = '#989898',
        base06 = '#B8B8B8',
        base07 = '#E0E0E0',
        base08 = '#C8C8C8',
        base09 = '#D0D0D0',
        base0A = '#D8D8D8',
        base0B = '#E0E0E0',
        base0C = '#E8E8E8',
        base0D = '#F0F0F0',
        base0E = '#F8F8F8',
        base0F = '#FFFFFF',
    }

    local palette = C.dark_mode and dark or light

    base16.setup {
        palette = palette,
        use_cterm = false,
        plugins = {
            default = false,
            ['williamboman/mason.nvim'] = true,
        },
    }

    -- base ui
    vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE', fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'NONE', fg = palette.base07, bold = true })
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'MatchParen', { bg = palette.base01, fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE', fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'TabLine', { bg = 'NONE', fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'TabLineSel', { bg = 'NONE', fg = palette.base04, bold = true })
    vim.api.nvim_set_hl(0, 'TabLineFill', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'Comment', { fg = palette.base02 })

    -- spell
    vim.api.nvim_set_hl(0, 'SpellBad', { fg = diagnostic.error, underline = true })
    vim.api.nvim_set_hl(0, 'SpellRare', { fg = diagnostic.warn, underline = true })

    -- mini.pick
    vim.api.nvim_set_hl(0, 'MiniPickMatchCurrent', { bg = palette.base01 })
    vim.api.nvim_set_hl(0, 'MiniPickMatchRanges', { fg = palette.base06, bold = true })
    vim.api.nvim_set_hl(0, 'MiniPickNormal', { bg = palette.base00, fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'MiniPickBorder', { bg = palette.base00, fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'MiniPickBorderBusy', { bg = palette.base00, fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'MiniPickBorderText', { bg = palette.base00, fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'MiniPickPrompt', { bg = palette.base00, fg = palette.base04 })

    -- diagnostic
    vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = diagnostic.error, bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = diagnostic.warn, bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = diagnostic.info, bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = diagnostic.hint, bg = 'NONE' })

    vim.api.nvim_set_hl(0, 'DiagnosticFloatingError', { fg = diagnostic.error, bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingWarn', { fg = diagnostic.warn, bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingInfo', { fg = diagnostic.info, bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingHint', { fg = diagnostic.hint, bg = 'NONE' })

    -- nvim-cmp
    vim.api.nvim_set_hl(0, 'CmpItemMenu', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = palette.base06, bg = 'NONE', bold = true })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = palette.base06, bg = 'NONE', bold = true })
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
