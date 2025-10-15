return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "/Users/delgorithm/Documents/Culture/Obsidian/Vault/delgo",
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    templates = {
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
  },
}
