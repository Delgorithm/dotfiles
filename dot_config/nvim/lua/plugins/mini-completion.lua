return {
  "echasnovski/mini.completion",
  version = false,
  event = "InsertEnter",
  dependencies = {
    "echasnovski/mini.snippets",
    "echasnovski/mini.icons",
  },
  opts = {
    delay = {
      completion = 100,
      info = 100,
      signature = 50,
    },

    window = {
      info = { height = 25, width = 80, border = "single" },
      signature = { height = 25, width = 80, border = "single" },
    },

    lsp_completion = {
      source_func = "completefunc",
      auto_setup = true,
    },

    fallback_action = "<C-n>",

    mappings = {
      force_twostep = "<C-Space>",
      force_fallback = "<A-Space>",
      scroll_down = "<C-f>",
      scroll_up = "<C-b>",
    },

    set_vim_settings = true,
  },
  config = function(_, opts)
    require("mini.completion").setup(opts)
  end,
}
