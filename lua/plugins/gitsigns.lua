return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
        },
        signcolumn = true, -- Show signs in sign column
        numhl = false, -- Disable number column highlights
        sign_priority = 6, -- Default priority (below LSP diagnostics)
        current_line_blame = false, -- Optional: Disable blame by default
      })
      -- Define highlights for signs
      vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#00ff00", bg = "NONE" }) -- Green for add
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ffff00", bg = "NONE" }) -- Yellow for change
      vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#ff0000", bg = "NONE" }) -- Red for delete
      vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#888888", bg = "NONE" }) -- Gray for untracked

    end,
    keys = {
      { "]c", "<cmd>Gitsigns next_hunk<CR>", desc = "Next git hunk" },
      { "[c", "<cmd>Gitsigns prev_hunk<CR>", desc = "Previous git hunk" },
      { "<leader>gt", "<cmd>Gitsigns toggle_signs<CR>", desc = "Toggle git signs" },
      { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Git blame line" },
    },
  },
}
