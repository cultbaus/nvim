return {
    {
        'noahfrederick/vim-noctu',
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.termguicolors = false
            vim.cmd.colorscheme 'noctu'

            -- Statusline overrides
            vim.api.nvim_set_hl(0, 'StatuslineAccent', { ctermbg = 'white', ctermfg = 'black' })
            vim.api.nvim_set_hl(0, 'StatuslineInsertAccent', { ctermbg = 'red', ctermfg = 'black' })
            vim.api.nvim_set_hl(0, 'StatuslineVisualAccent', { ctermbg = 'green', ctermfg = 'black' })
            vim.api.nvim_set_hl(0, 'StatuslineReplaceAccent', { ctermbg = 'yellow', ctermfg = 'black' })
            vim.api.nvim_set_hl(0, 'StatuslineCmdLineAccent', { ctermbg = 'cyan', ctermfg = 'black' })
            vim.api.nvim_set_hl(0, 'StatuslineTerminalAccent', { ctermbg = 'magenta', ctermfg = 'black' })

            -- Underline for diagnostics nice orange color
            vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { underline = true, sp = '#f4511e' })

            -- Float overrides
            vim.api.nvim_set_hl(0, 'FloatBorder', { ctermbg = 'black', ctermfg = 'white' })
        end,
    },
}
