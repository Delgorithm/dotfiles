require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  require("plugins.colortheme"),
  require("plugins.neotree"),
  require("plugins.bufferline"),
  require("plugins.lualine"),
  require("plugins.treesitter"),
  require("plugins.telescope"),
  require("plugins.lsp"),
  require("plugins.nvim-cmp"),
  require("plugins.none-ls"),
  require("plugins.gitsigns"),
  require("plugins.alpha"),
  require("plugins.indent-blankline"),
  require("plugins.mini-comment"),
  require("plugins.mini-completion"),
  require("plugins.mini-snippets"),
  require("plugins.mini-icons"),
  require("plugins.mini-pairs"),
  require("plugins.mini-animate"),
  require("plugins.autotag"),
  require("plugins.lazygit"),
  require("plugins.leetcode"),
})
