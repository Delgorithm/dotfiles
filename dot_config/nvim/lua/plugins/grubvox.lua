return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  enabled = true,
  lazy = false,
  config = function()
    require("gruvbox").setup({
      terminal_colors = true,
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true,
      contrast = "soft",
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    })

    -- Fonction pour basculer entre thème clair et sombre
    local toggle_theme = function()
      if vim.o.background == "dark" then
        vim.o.background = "light"
      else
        vim.o.background = "dark"
      end
      vim.cmd("colorscheme gruvbox")
    end

    -- Fonction pour activer/désactiver la transparence
    local toggle_transparency = function()
      local gruvbox_config = require("gruvbox").config
      local current_mode = gruvbox_config.transparent_mode
      require("gruvbox").setup({ transparent_mode = not current_mode })
      vim.cmd("colorscheme gruvbox")
    end

    -- Définir le thème initial
    vim.o.background = "light" -- Commence en mode clair
    vim.cmd("colorscheme gruvbox")

    -- Raccourcis clavier pour basculer les thèmes
    vim.keymap.set("n", "<leader>bg", toggle_theme, { noremap = true, silent = true, desc = "Toggle light/dark theme" })
    vim.keymap.set("n", "<leader>bgs", toggle_transparency,
      { noremap = true, silent = true, desc = "Toggle transparency" })
  end,
}
