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
  require("plugins.none-ls"),
  require("plugins.gitsigns"),
  require("plugins.alpha"),
  require("plugins.indent-blankline"),
  require("plugins.mini-comment"),
  require("plugins.mini-snippets"),
  require("plugins.mini-icons"),
  require("plugins.mini-pairs"),
  require("plugins.autotag"),
  require("plugins.lazygit"),
  require("plugins.leetcode"),
  require("plugins.blink-cmp"),
  require("plugins.wakatime"),
  -- require("plugins.supermaven"),
  require("plugins.nvim-lint"),
  require("plugins.mini-cursoword"),
  require("plugins.fterm"),
  require("plugins.carbon"),
  require("plugins.which-key"),
  require("plugins.render-markdown"),
})
