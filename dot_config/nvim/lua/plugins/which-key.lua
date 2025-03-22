return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      spelling = {
        enabled = true,
      },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    -- Les raccourcis s'afficheront automatiquement
  end,
}
