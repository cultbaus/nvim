return {
    {
        'leoluz/nvim-dap-go',
        config = function()
            require('dap-go').setup {}
        end,
    },
    {
        'mfussenegger/nvim-dap',
        config = function()
            print 'hello'
        end,
    },
}
