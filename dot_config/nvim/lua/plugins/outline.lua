return {
  "hedyhli/outline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>-", "<cmd>Outline<CR>", desc = "Toggle code outline" },
  },
  opts = {
    -- Général
    outline_window = {
      width = 25, -- Largeur de la fenêtre d'outline
      position = "right", -- Position de la fenêtre (left, right)
      show_cursorline = true, -- Afficher la cursorline dans la fenêtre d'outline
      hide_cursor = false, -- Cacher le curseur dans la fenêtre d'outline
      focus_on_open = true, -- Focus sur la fenêtre d'outline après l'ouverture
      auto_close = false, -- Fermer automatiquement si c'est la dernière fenêtre
      auto_jump = false, -- Auto-sauter au code lors du déplacement dans l'outline
      jump_highlight_duration = 300, -- Durée de highlight en millisecondes quand on saute
    },

    -- Configuration des symboles
    symbols = {
      -- Utiliser lspkind pour les icônes
      icon_source = "lspkind",

      -- Filtrer certains symboles par défaut (par type de fichier)
      filter = {
        default = { "String", "Variable", "Namespace", exclude = true }, -- Exclure certains types de symboles
      },

      -- Afficher les icônes pour chaque type de symbole
      icons = {
        File = { icon = "󰈙" },
        Module = { icon = "󰆧" },
        Namespace = { icon = "󰅪" },
        Package = { icon = "󰏗" },
        Class = { icon = "󰠱" },
        Method = { icon = "󰆧" },
        Property = { icon = "" },
        Field = { icon = "󰽐" },
        Constructor = { icon = "" },
        Enum = { icon = "ℰ" },
        Interface = { icon = "󰜰" },
        Function = { icon = "󰊕" },
        Variable = { icon = "󰀫" },
        Constant = { icon = "󰏿" },
        String = { icon = "󰀬" },
        Number = { icon = "󰎠" },
        Boolean = { icon = "◩" },
        Array = { icon = "󰅪" },
        Object = { icon = "󰅩" },
        Key = { icon = "󰌋" },
        Null = { icon = "󰟢" },
        EnumMember = { icon = "" },
        Struct = { icon = "󰙅" },
        Event = { icon = "" },
        Operator = { icon = "󰆕" },
        TypeParameter = { icon = "󰊄" },
      },
    },

    -- Configuration des éléments d'outline
    outline_items = {
      show_symbol_details = true, -- Afficher les détails des symboles
      show_symbol_lineno = true, -- Afficher les numéros de ligne
      highlight_hovered_item = true, -- Highlight l'élément survolé
      auto_set_cursor = true, -- Définir automatiquement le curseur à la position du symbole actuel

      -- Événements pour la mise à jour automatique
      auto_update_events = {
        follow = { "CursorMoved" }, -- Événements pour suivre la position du curseur
        refresh = { "BufWritePost" }, -- Événements pour rafraîchir les symboles
      },
    },

    -- Configuration du repliement des symboles
    symbol_folding = {
      autofold_depth = 1, -- Profondeur de pliage automatique (false pour désactiver)
      auto_unfold = {
        hovered = true, -- Déplier automatiquement l'élément survolé
        only = 2, -- Déplier automatiquement s'il n'y a que n éléments
      },
      markers = { "", "" }, -- Marqueurs de pliage (fermé, ouvert)
    },

    -- Configuration de la fenêtre d'aperçu
    preview_window = {
      auto_preview = false, -- Prévisualisation automatique lors de la navigation
      open_hover_on_preview = false, -- Ouvrir le hover sur la prévisualisation
      winhl = "Normal:NormalFloat", -- Highlight pour la fenêtre de prévisualisation
    },

    -- Keymaps pour la fenêtre d'outline
    keymaps = {
      close = { "q", "<Esc>" }, -- Fermer la fenêtre d'outline
      goto_location = "<CR>", -- Aller à l'emplacement du symbole
      peek_location = "o", -- Prévisualiser l'emplacement sans perdre le focus
      goto_and_close = "<S-CR>", -- Aller à l'emplacement et fermer la fenêtre
      restore_location = "<C-g>", -- Restaurer l'emplacement d'outline basé sur le code
      hover_symbol = "<C-space>", -- Afficher le hover pour le symbole
      toggle_preview = "K", -- Basculer la prévisualisation
      rename_symbol = "r", -- Renommer le symbole
      code_actions = "a", -- Actions du code
      fold = "h", -- Plier le symbole
      unfold = "l", -- Déplier le symbole
      fold_toggle = "<Tab>", -- Basculer le pliage
      fold_toggle_all = "<S-Tab>", -- Basculer tout le pliage
      fold_all = "W", -- Plier tout
      unfold_all = "E", -- Déplier tout
      fold_reset = "R", -- Réinitialiser le pliage
      down_and_jump = "<C-j>", -- Descendre et prévisualiser
      up_and_jump = "<C-k>", -- Monter et prévisualiser
      help = "?", -- Afficher l'aide
    },

    -- Configuration des fournisseurs
    providers = {
      lsp = {
        enabled = true,
      },
      markdown = {
        enabled = true,
      },
      norg = {
        enabled = true,
      },
      man = {
        enabled = true,
      },
    },
  },
}
