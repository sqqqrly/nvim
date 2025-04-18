return {
    "nvimtools/none-ls.nvim",

    config = function()
        local null_ls = require("null-ls")

        -- Soft links used when Mason cannot find a version that matches its required version
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua, -- Lua:    Install using Mason
                null_ls.builtins.formatting.black, -- Python: Install using Mason
                null_ls.builtins.diagnostics.pylint, -- Python: Install using soft link to ~/.local/share/nvim/mason/bin.  Use :Telescope diagnosics.
                -- null_ls.builtins.formatting.isort, -- Python: Install using soft link to ~/.local/share/nvim/mason/bin
                -- null_ls.builtins.completion.spell,
                -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})
    end,
}
