return {
    { 'L3MON4D3/LuaSnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local snip = require 'luasnip'
            require('cmp').setup {
                snippet = {
                    expand = function(args)
                        snip.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ['<Tab>'] = require('cmp').mapping.select_next_item(),
                    ['<CR>'] = require('cmp').mapping.confirm { select = false },
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'neorg' },
                },
            }
        end,
    },
}
