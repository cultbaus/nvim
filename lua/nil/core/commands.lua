-- automatic floating diagnostic popup
vim.api.nvim_create_autocmd({ 'CursorHold' }, {
    pattern = { '<buffer>' },
    command = 'silent! lua vim.diagnostic.open_float({ focusable = false, focus = false })',
})

-- reload
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    command = 'checktime',
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
    callback = function()
        local ok, cl = pcall(vim.api.nvim_win_get_var, 0, 'auto-cursorline')
        if ok and cl then
            vim.wo.cursorline = true
            vim.api.nvim_win_del_var(0, 'auto-cursorline')
        end
    end,
})
vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
    callback = function()
        local cl = vim.wo.cursorline
        if cl then
            vim.api.nvim_win_set_var(0, 'auto-cursorline', cl)
            vim.wo.cursorline = false
        end
    end,
})

-- create directories when needed, when saving a file
vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('auto_create_dir', { clear = true }),
    callback = function(event)
        if event.match:match '^%w%w+://' then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
    end,
})

-- statusline
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
    pattern = { '*' },
    command = 'setlocal statusline=%!v:lua.Statusline.active()',
})
vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
    pattern = { '*' },
    command = 'setlocal statusline=%!v:lua.Statusline.inactive()',
})
