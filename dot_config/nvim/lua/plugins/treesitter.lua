return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "vimdoc",
      "vim",
      "regex",
      "toml",
      "json",
      "gitignore",
      "yaml",
      "markdown",
      "markdown_inline",
      "bash",
      "tsx",
      "css",
      "html",
    },
    auto_install = true,
    highlight = {
      enable = true,
      disable = { "json", "markdown" },
      additional_vim_regex_highlighting = { "ruby" },
    },
    indent = { enable = true, disable = { "ruby", "json", "markdown" } },
  },
  init = function()
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    vim.o.foldenable = true
    vim.o.foldlevel = 99
  end,
}
