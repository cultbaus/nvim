return {
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    'bash',
                    'diff',
                    'gitignore',
                    'go',
                    'graphql',
                    'javascript',
                    'lua',
                    'markdown',
                    'markdown_inline',
                    'regex',
                    'sql',
                    'toml',
                    'typescript',
                    'yaml',
                    'json',
                },
                highlight = { enable = true },
                indent = { enable = false },
                autopairs = { enable = true },
            }
        end,
    },
}
