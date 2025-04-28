return {
    "nvimtools/none-ls.nvim",

    config = function()
        local null_ls = require("null-ls")

        -- Soft links used when Mason cannot find a version that matches its required version
        local line_length = "120"
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua, -- Lua:    Install using Mason
                null_ls.builtins.formatting.black.with({  -- Python: Install using Mason
                    extra_args = { "--line-length", line_length },
                }),
                null_ls.builtins.diagnostics.pylint.with({  -- Python: Install using soft link to ~/.local/share/nvim/mason/bin.  Use :Telescope diagnosics.
                    extra_args = { "--max-line-length=" .. line_length },
                }),
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})
    end,
}
