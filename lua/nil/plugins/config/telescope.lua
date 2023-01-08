return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        keys = {
            {
                '<C-p>',
                function()
                    if os.execute 'git rev-parse --is-inside-work-tree >> /dev/null 2>&1' == 0 then
                        require('telescope.builtin').git_files {}
                    else
                        require('telescope.builtin').find_files { previewer = false }
                    end
                end,
            },
            {
                '<C-g>',
                function()
                    require('telescope.builtin').live_grep { previwer = false }
                end,
            },
            {
                'fae',
                function()
                    require('telescope.builtin').diagnostics()
                end,
            },
        },
        config = function()
            local t = require 'telescope'
            local a = require 'telescope.actions'
            t.setup {
                layout_strategy = 'horizontal',
                use_less = false,
                file_ignore_patterns = {
                    '%.jpg',
                    '%.jpeg',
                    '%.png',
                    '%.otf',
                    '%.ttf',
                    '%.sum',
                    'node_modules',
                    '.git',
                },
                mappings = {
                    i = {
                        ['<Esc>'] = a.close,
                        ['<C-k>'] = a.move_selection_previous,
                        ['<C-j>'] = a.move_selection_next,
                    },
                },
            }
        end,
    },
}
