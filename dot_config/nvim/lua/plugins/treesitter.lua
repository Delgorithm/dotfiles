return {
  "nvim-treesitter/nvim-treesitter",
  main = "nvim-treesitter.configs",
  opts = {
    auto_install = true,
    ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "css",
      "html",
      "elixir",
      "php",
      "jsdoc",
      "json",
      "markdown",
      "sql",
      "toml",
      "yaml",
      "tsx",
      "vue",
      "svelte",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}
