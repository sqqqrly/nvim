return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ts_configs = require("nvim-treesitter.configs")
      ts_configs.setup({
        ensure_installed = { "python", "lua" },
        auto_install = true,
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
        fold = { enable = true },
      })

      -- Log initial fold module state
      local ts_configs = require("nvim-treesitter.configs")
      local fold_module = ts_configs.get_module("fold")
      local fold_enabled = fold_module and fold_module.enable or false
      -- vim.api.nvim_echo({
      --   { "Treesitter: Initial fold module state: " .. vim.inspect(fold_module), "Normal" },
      --   { "\nTreesitter: Initial fold module enabled: " .. (fold_enabled and "true" or "false"), "Normal" },
      -- }, true, {})

      -- Set up Treesitter folding for Python files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
          -- vim.api.nvim_echo({{ "Treesitter: Autocommand triggered", "Normal" }}, true, {})

          local parser = vim.treesitter.get_parser(0, "python")
          local parser_status = parser and "Parser loaded" or "Parser failed to load"
          -- vim.api.nvim_echo({{ "Treesitter: " .. parser_status, "Normal" }}, true, {})

          local fold_module = ts_configs.get_module("fold")
          local fold_enabled = fold_module and fold_module.enable or false
          -- vim.api.nvim_echo({
          --   { "Treesitter: Fold module state: " .. vim.inspect(fold_module), "Normal" },
          --   { "\nTreesitter: Fold module enabled: " .. (fold_enabled and "true" or "false"), "Normal" },
          -- }, true, {})

          vim.opt_local.foldmethod = "expr"
          -- vim.opt_local.foldexpr = "v:lua.require'nvim-treesitter.fold'.foldexpr()"
          vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.opt_local.foldenable = true
          vim.opt_local.foldlevel = 99
          vim.opt_local.foldminlines = 2
          vim.opt_local.foldcolumn = "1"

          local ok, err = pcall(vim.treesitter.start)
          -- vim.api.nvim_echo({
          --   { "Treesitter: vim.treesitter.start " .. (ok and "succeeded" or "failed"), "Normal" },
          --   { err and "\nTreesitter: Error: " .. err or "", "Error" },
          -- }, true, {})

          vim.defer_fn(function()
            -- vim.api.nvim_echo({{ "Treesitter: Fold refresh started", "Normal" }}, true, {})
            vim.cmd("normal! zx")
            vim.cmd("normal! zR")
            -- vim.api.nvim_echo({{ "Treesitter: Fold refresh executed", "Normal" }}, true, {})
          end, 1000)
        end,
        desc = "Start Treesitter and refresh folds for Python files",
      })
    end,
  },
}
