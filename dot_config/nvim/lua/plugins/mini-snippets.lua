return {
  "echasnovski/mini.snippets",
  version = false,
  opts = {
    mappings = {
      insert = "<C-j>",
      insert_last = "",
      jump_forward = "<Tab>",
      jump_backward = "<S-Tab>",
      expand = "",
    },
  },
  config = function(_, opts)
    require("mini.snippets").setup(opts)
  end,
}
