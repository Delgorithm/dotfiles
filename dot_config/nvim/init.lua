local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blolb:none", "--branch=stable", lazyrepo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

if vim.g.vscode then
  print("VSCode, disabling all plugins")
else
  require("lazy").setup("plugins")
end

local opts = require("core.nvim-opts")
opts.init()

local usercommand = require("core.nvim-usercmd")
usercommand.init()

local keys = require("core.nvim-keys")
keys.init()

local autocmds = require("core.nvim-autocmds")
autocmds.init()

local filetypes = require("core.nvim-filetypes")
filetypes.init()
