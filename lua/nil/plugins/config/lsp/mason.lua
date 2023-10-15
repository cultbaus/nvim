local M = {}

M.mason_config = function()
    require('mason').setup {}
end

M.mason_tool_installer_config = function(ensure_installed)
    return function()
        require('mason-tool-installer').setup {
            ensure_installed = ensure_installed,
            auto_update = true,
            run_on_start = true,
        }
    end
end

M.mason_lsp_config = function(ensure_installed)
    return function()
        require('mason-lspconfig').setup {
            ensure_installed = ensure_installed,
        }
    end
end

return M
