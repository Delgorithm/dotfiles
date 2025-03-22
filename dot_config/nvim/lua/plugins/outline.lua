return {
  "hedyhli/outline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>-", "<cmd>Outline<CR>", desc = "Toggle code outline" },
  },
  opts = {
    outline_window = {
      width = 25,
      position = "right",
      show_cursorline = true,
      hide_cursor = false,
      focus_on_open = true,
      auto_close = false,
      auto_jump = false,
      jump_highlight_duration = 300,
    },

    symbols = {
      icon_source = "lspkind",

      filter = {
        default = { "String", "Variable", "Namespace", exclude = true },
      },

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

    outline_items = {
      show_symbol_details = true,
      show_symbol_lineno = true,
      highlight_hovered_item = true,
      auto_set_cursor = true,

      auto_update_events = {
        follow = { "CursorMoved" },
        refresh = { "BufWritePost" },
      },
    },

    symbol_folding = {
      autofold_depth = 1,
      auto_unfold = {
        hovered = true,
        only = 2,
      },
      markers = { "", "" },
    },

    preview_window = {
      auto_preview = false,
      open_hover_on_preview = false,
      winhl = "Normal:NormalFloat",
    },

    keymaps = {
      close = { "q", "<Esc>" },
      goto_location = "<CR>",
      peek_location = "o",
      goto_and_close = "<S-CR>",
      restore_location = "<C-g>",
      hover_symbol = "<C-space>",
      toggle_preview = "K",
      rename_symbol = "r",
      code_actions = "a",
      fold = "h",
      unfold = "l",
      fold_toggle = "<Tab>",
      fold_toggle_all = "<S-Tab>",
      fold_all = "W",
      unfold_all = "E",
      fold_reset = "R",
      down_and_jump = "<C-j>",
      up_and_jump = "<C-k>",
      help = "?",
    },

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
