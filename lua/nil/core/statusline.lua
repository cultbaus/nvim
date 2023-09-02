local modes = {
    ['n'] = 'NORMAL',
    ['no'] = 'NORMAL',
    ['v'] = 'VISUAL',
    ['V'] = 'VISUAL LINE',
    [''] = 'VISUAL BLOCK',
    ['s'] = 'SELECT',
    ['S'] = 'SELECT LINE',
    [''] = 'SELECT BLOCK',
    ['i'] = 'INSERT',
    ['ic'] = 'INSERT',
    ['R'] = 'REPLACE',
    ['Rv'] = 'VISUAL REPLACE',
    ['c'] = 'COMMAND',
    ['cv'] = 'VIM EX',
    ['ce'] = 'EX',
    ['r'] = 'PROMPT',
    ['rm'] = 'MOAR',
    ['r?'] = 'CONFIRM',
    ['!'] = 'SHELL',
    ['t'] = 'TERMINAL',
}

local colors = {
    ['n'] = '%#StatuslineAccent#',
    ['i'] = '%#StatuslineInsertAccent#',
    ['ic'] = '%#StatuslineInsertAccent#',
    ['v'] = '%#StatuslineVisualAccent#',
    ['V'] = '%#StatuslineVisualAccent#',
    [''] = '%#StatuslineVisualAccent#',
    ['R'] = '%#StatuslineReplaceAccent#',
    ['c'] = '%#StatuslineCmdLineAccent#',
    ['t'] = '%#StatuslineTerminalAccent#',
    default = '%#StatusLineAccent#',
}

local get_filepath = function()
    local fpath = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.:h')
    return (fpath == '' or fpath == '.') and ' ' or string.format(' %%<%s/', fpath)
end

local get_filename = function()
    local fname = vim.fn.expand '%:t'
    return fname == '' and '' or fname .. ' '
end

local get_lsp_diagnostics = function()
    local count = {}
    local levels = { errors = 'Error', warnings = 'Warn', info = 'Info', hints = 'Hint' }
    local symbols = { errors = ' ', warnings = ' ', info = ' ', hints = ' ' }
    local diagnostics = ''

    for k, level in pairs(levels) do
        count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
        if count[k] ~= 0 then
            diagnostics = diagnostics .. string.format(' %%#Diagnostic%s#%s%d', level, symbols[k], count[k])
        end
    end

    return diagnostics .. '%#Normal#'
end

Statusline = {
    active = function()
        local current_mode = vim.api.nvim_get_mode().mode
        local mode_color = colors[current_mode] or colors.default
        local mode_name = string.format(' %s ', modes[current_mode] or ''):upper()
        local filetype = string.format(' %s ', vim.bo.filetype):upper()
        local lineinfo = vim.bo.filetype == 'alpha' and '' or ' %P %#Normal# %l:%c '

        return table.concat {
            '%#Statusline#',
            mode_color,
            mode_name,
            '%#Normal#',
            get_filepath(),
            get_filename(),
            '%#Normal#',
            get_lsp_diagnostics(),
            '%=%#StatusLineExtra#',
            filetype,
            lineinfo,
        }
    end,
    inactive = function()
        return ' %F'
    end,
}
