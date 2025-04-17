-- Highlighting and indenting code
return
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {"bash", "javascript", "lua", "make", "python", "terraform", "yaml"},
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
