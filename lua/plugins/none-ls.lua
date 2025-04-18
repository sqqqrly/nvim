return {
	"nvimtools/none-ls.nvim",

	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- Install using Mason
				-- null_ls.builtins.completion.spell,
				-- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}

-- Failed to run `config` for none-ls.nvim
--
-- /home/dohlemacher/.config/nvim/lua/plugins/none-ls.lua:13: module 'none-ls.diagnostics.eslint' not found:
--         no field package.preload['none-ls.diagnostics.eslint']
--         cache_loader: module 'none-ls.diagnostics.eslint' not found
--         cache_loader_lib: module 'none-ls.diagnostics.eslint' not found
--         no file './none-ls/diagnostics/eslint.lua'
--         no file '/home/dohlemacher/workspace/neovim/.deps/usr/share/luajit-2.1/none-ls/diagnostics/eslint.lua'
--         no file '/usr/local/share/lua/5.1/none-ls/diagnostics/eslint.lua'
--         no file '/usr/local/share/lua/5.1/none-ls/diagnostics/eslint/init.lua'
--         no file '/home/dohlemacher/workspace/neovim/.deps/usr/share/lua/5.1/none-ls/diagnostics/eslint.lua'
--         no file '/home/dohlemacher/workspace/neovim/.deps/usr/share/lua/5.1/none-ls/diagnostics/eslint/init.lua'
--         no file '/home/dohlemacher/.local/share/nvim/lazy-rocks/telescope.nvim/share/lua/5.1/none-ls/diagnostics/eslint.lua'
--         no file '/home/dohlemacher/.local/share/nvim/lazy-rocks/telescope.nvim/share/lua/5.1/none-ls/diagnostics/eslint/init.lua'
--         no file './none-ls/diagnostics/eslint.so'
--         no file '/usr/local/lib/lua/5.1/none-ls/diagnostics/eslint.so'
--         no file '/home/dohlemacher/workspace/neovim/.deps/usr/lib/lua/5.1/none-ls/diagnostics/eslint.so'
--         no file '/usr/local/lib/lua/5.1/loadall.so'
--         no file '/home/dohlemacher/.local/share/nvim/lazy-rocks/telescope.nvim/lib/lua/5.1/none-ls/diagnostics/eslint.so'
--         no file '/home/dohlemacher/.local/share/nvim/lazy-rocks/telescope.nvim/lib64/lua/5.1/none-ls/diagnostics/eslint.so'
--         no file './none-ls.so'
--         no file '/usr/local/lib/lua/5.1/none-ls.so'
--         no file '/home/dohlemacher/workspace/neovim/.deps/usr/lib/lua/5.1/none-ls.so'
--         no file '/usr/local/lib/lua/5.1/loadall.so'
--         no file '/home/dohlemacher/.local/share/nvim/lazy-rocks/telescope.nvim/lib/lua/5.1/none-ls.so'
--         no file '/home/dohlemacher/.local/share/nvim/lazy-rocks/telescope.nvim/lib64/lua/5.1/none-ls.so'
--
-- # stacktrace:
--   - lua/plugins/none-ls.lua:13 _in_ **config**
--   - init.lua:27
