return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter", -- Se charge uniquement quand on entre en mode insertion
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<Tab>", -- Accepter la suggestion
        clear_suggestion = "<C-]>", -- Effacer la suggestion
        accept_word = "<C-j>", -- Accepter jusqu'à la fin du mot
      },
      ignore_filetypes = {
        -- Ignorer les types de fichiers où vous ne voulez pas de suggestions
        -- Par exemple: help = true, NvimTree = true, TelescopePrompt = true
      },
      color = {
        suggestion_color = "#7c6f64", -- Couleur des suggestions (gris atténué)
        cterm = 244, -- Couleur en mode terminal
      },
      log_level = "info", -- Niveau de journalisation: "debug", "info", "warn", "error", "off"
      disable_inline_completion = false, -- Désactiver la complétion en ligne (à true si vous utilisez nvim-cmp)
      disable_keymaps = false, -- Désactiver les raccourcis par défaut
      -- Condition pour arrêter temporairement supermaven
      condition = function()
        -- Renvoie true pour désactiver supermaven dans certaines conditions
        -- Par exemple, pour désactiver dans les fichiers importants:
        -- return string.match(vim.fn.expand("%:t"), "important") ~= nil
        return false
      end,
    })
  end,
  -- Commandes recommandées à essayer après l'installation
  -- :SupermavenUseFree - Pour utiliser la version gratuite
  -- :SupermavenStart - Pour démarrer Supermaven
  -- :SupermavenStatus - Pour vérifier l'état de Supermaven
}
