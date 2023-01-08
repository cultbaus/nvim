local global = vim.g
local opt = vim.opt

global.mapleader = '\\'

-- Completion
opt.completeopt = 'menu,menuone,noselect'
opt.shortmess = 'flmTWAIq'

-- Search
opt.hlsearch = true

-- Indents
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.expandtab = true

-- Status line
opt.ruler = true
opt.showmode = false
opt.laststatus = 2

-- Better display
opt.signcolumn = 'number'
opt.cmdheight = 1
opt.pumheight = 10
opt.splitbelow = true
opt.hidden = true

-- File types
opt.encoding = 'utf8'
opt.ffs = 'unix,dos,mac'

-- Hover update debouncer
opt.updatetime = 300

-- File changes
opt.autowrite = true
opt.autowriteall = true
opt.autoread = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Memory
opt.maxmempattern = 2000000

-- List characters
opt.list = true
opt.listchars = string.format 'tab:» ,extends:›,precedes:‹,nbsp:·,trail:·'
opt.fillchars = vim.o.fillchars .. string.format 'vert: ,eob: '

-- System clipboard
opt.clipboard = vim.o.clipboard .. 'unnamedplus'

-- Misc
opt.wrap = true
opt.number = true

-- Disable providers
global.loaded_perl_provider = 0
global.loaded_node_provider = 0
global.loaded_python_provider = 0
global.loaded_python3_provider = 0
global.loaded_ruby_provider = 0

-- Colors
opt.termguicolors = true
