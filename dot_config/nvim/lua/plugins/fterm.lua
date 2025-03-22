return {
  "numToStr/FTerm.nvim",
  event = "VeryLazy",
  config = function()
    local fterm = require("FTerm")

    -- Configuration par défaut
    fterm.setup({
      border = "single",
      dimensions = {
        height = 0.8, -- 80% de la hauteur de la fenêtre
        width = 0.8, -- 80% de la largeur de la fenêtre
        x = 0.5, -- Centré horizontalement
        y = 0.5, -- Centré verticalement
      },
      blend = 5, -- Transparence légère (0-100)
    })

    -- Raccourcis clavier pour ouvrir/fermer le terminal
    vim.keymap.set("n", "<leader>tt", fterm.toggle, { desc = "Toggle terminal" })
    vim.keymap.set("t", "<Esc><Esc>", fterm.toggle, { desc = "Toggle terminal" })

    -- Lazygit dans un terminal flottant
    local lazygit = fterm:new({
      ft = "fterm_lazygit",
      cmd = "lazygit",
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    })

    -- Ajout d'un raccourci pour lazygit
    vim.keymap.set("n", "<leader>tg", function()
      lazygit:toggle()
    end, { desc = "Toggle Lazygit" })

    -- Raccourci pour ouvrir un terminal avec une commande spécifique
    vim.keymap.set("n", "<leader>tr", function()
      -- Demander une commande à exécuter
      vim.ui.input({ prompt = "Command: " }, function(cmd)
        if cmd and cmd ~= "" then
          fterm
            :new({
              cmd = cmd,
              ft = "fterm_custom",
            })
            :toggle()
        end
      end)
    end, { desc = "Run command in terminal" })
  end,
}
