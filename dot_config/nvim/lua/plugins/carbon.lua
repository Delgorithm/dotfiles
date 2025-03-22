return {
  "ellisonleao/carbon-now.nvim",
  cmd = { "CarbonNow" },
  opts = {
    -- Options par défaut pour Carbon
    options = {
      theme = "material", -- Thème à utiliser
      font_family = "Hack", -- Police à utiliser
      font_size = "14px", -- Taille de la police
      background = "#4C566A", -- Couleur d'arrière-plan
      drop_shadow = true, -- Ajouter une ombre
      drop_shadow_blur = "68px", -- Flou de l'ombre
      drop_shadow_offset_y = "20px", -- Décalage vertical de l'ombre
      window_theme = "none", -- Thème de fenêtre
      line_numbers = true, -- Afficher les numéros de ligne
      line_height = "143%", -- Hauteur de ligne
      width = "680", -- Largeur de l'image
      watermark = false, -- Pas de filigrane
      show_window_controls = true, -- Afficher les contrôles de fenêtre
      auto_adjust_width = false, -- Ne pas ajuster automatiquement la largeur
    },

    -- Ouvrir l'URL dans le navigateur après génération
    open_browser = true,

    -- Chemin de sauvegarde (~ est remplacé par le répertoire utilisateur)
    save_path = "~/Downloads/",

    -- Ne pas configurer de raccourci clavier par défaut
    keymaps = {
      -- Raccourci pour ouvrir Carbon avec la sélection visuelle
      visual = "<leader>cc",
    },
  },

  config = function(_, opts)
    require("carbon-now").setup(opts)

    -- Commande pour ouvrir Carbon avec le buffer entier
    vim.api.nvim_create_user_command("CarbonFile", function()
      vim.cmd("normal! ggVG")
      vim.cmd("CarbonNow")
    end, {})

    -- Raccourci pour ouvrir Carbon avec le buffer entier
    vim.keymap.set("n", "<leader>cf", ":CarbonFile<CR>", { desc = "Carbon: Export file" })
  end,
}
