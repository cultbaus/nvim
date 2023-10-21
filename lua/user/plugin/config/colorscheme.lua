local M = {}

M.colorscheme = function()
    vim.o.termguicolors = false
    vim.cmd.colorscheme 'noctu'

    vim.api.nvim_set_hl(0, 'StatuslineAccent', { ctermbg = 'white', ctermfg = 'black' })
    vim.api.nvim_set_hl(0, 'StatuslineInsertAccent', { ctermbg = 'red', ctermfg = 'black' })
    vim.api.nvim_set_hl(0, 'StatuslineVisualAccent', { ctermbg = 'green', ctermfg = 'black' })
    vim.api.nvim_set_hl(0, 'StatuslineReplaceAccent', { ctermbg = 'yellow', ctermfg = 'black' })
    vim.api.nvim_set_hl(0, 'StatuslineCmdLineAccent', { ctermbg = 'cyan', ctermfg = 'black' })
    vim.api.nvim_set_hl(0, 'StatuslineTerminalAccent', { ctermbg = 'magenta', ctermfg = 'black' })

    vim.api.nvim_set_hl(0, 'FloatBorder', { ctermbg = 'black', ctermfg = 'white' })
    vim.api.nvim_set_hl(0, 'FloatNormal', { ctermbg = 'black', ctermfg = 'cyan' })

    vim.api.nvim_set_hl(0, 'MiniPickMatchCurrent', { ctermbg = 'white', ctermfg = 'black' })
    vim.api.nvim_set_hl(0, 'MiniPickMatchRanges', { ctermbg = 'black', ctermfg = 'cyan' })

    vim.api.nvim_set_hl(0, 'LineNr', { ctermbg = 'black', ctermfg = 'white' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { ctermbg = 'black', ctermfg = 'cyan' })
end

return M
