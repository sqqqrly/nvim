

-- External deps:
--   curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb && sudo dpkg -i ripgrep_14.1.0-1_amd64.deb

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",  -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

-- See nvim/lua/plugins/.
-- Any lua file in nvim/lua/plugins/ that returns a lua table
-- will be contcatenated by Lazy into one large lua table automagically.
-- Auto-loads on changes.

require("vim-options")
require("lazy").setup("plugins")




