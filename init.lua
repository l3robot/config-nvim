-- Loader keys early so plugins see them
vim.g.mapleader = " "
vim.g.maplocalleader = ","
require("config.options")
require("config.keymaps")

-- Bootstrap lazy.vim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "plugins" })
