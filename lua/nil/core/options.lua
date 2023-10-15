vim.g.mapleader = '\\'

-- housekeeping
vim.o.filetype = 'on'
vim.o.syntax = 'on'

-- basic
vim.opt.scrolloff = 3
vim.opt.title = true
vim.opt.titlestring = '%f'
vim.opt.clipboard = 'unnamedplus'
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.cmdheight = 1
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.mouse = ''

-- timeout stuff
vim.opt.updatetime = 300
vim.opt.timeout = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 10

-- status, tab, number, sign line
vim.opt.ruler = false
vim.opt.laststatus = 2
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.signcolumn = 'number'

-- window, buffer, tabs
vim.opt.switchbuf = 'newtab'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.hidden = true
vim.opt.list = true
vim.opt.fillchars = {
    vert = ' ',
    eob = ' ',
    diff = ' ',
    msgsep = ' ',
}
vim.opt.listchars = {
    tab = '» ',
    extends = '›',
    precedes = '‹',
    nbsp = '·',
    trail = '·',
}

-- text formatting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.whichwrap:append '<>[]hl'

-- remove intro
vim.opt.shortmess:append 'sflmTWAIq'

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- disable builtin vim plugins and providers
local built_ins = {
    '2html_plugin',
    'getscript',
    'getscriptPlugin',
    'gzip',
    'logipat',
    'matchit',
    'tar',
    'tarPlugin',
    'rrhelper',
    'spellfile_plugin',
    'vimball',
    'vimballPlugin',
    'zip',
    'zipPlugin',
}

local providers = {
    'perl',
    'node',
    'python',
    'python3',
    'ruby',
}

for _, provider in pairs(providers) do
    vim.g['loaded_' .. provider .. '_provider'] = 0
end

for _, plugin in pairs(built_ins) do
    vim.g['loaded_' .. plugin] = 1
end
