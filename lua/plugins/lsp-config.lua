return {
    {
        -- Easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface.
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        -- Closes some gaps that exist between mason.nvim and lspconfig
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright" }
            })
        end
    },
    {
        -- nvim-lspconfig is a "data only" repo, providing basic, default Nvim LSP client configurations for various LSP servers.
        -- :help vim.lsp.buf
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.pyright.setup({})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.definition, {})
        end
    }
}

