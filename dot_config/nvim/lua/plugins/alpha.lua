return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "                                                                          ",
      "████████╗██╗  ██╗███████╗                                                 ",
      "╚══██╔══╝██║  ██║██╔════╝                                                 ",
      "   ██║   ███████║█████╗                                                    ",
      "   ██║   ██╔══██║██╔══╝                                                    ",
      "   ██║   ██║  ██║███████╗                                                 ",
      "   ╚═╝   ╚═╝  ╚═╝╚══════╝                                                 ",
      "                                                                          ",
      " ██████╗ ██╗      ██████╗ ██████╗ ██╗ ██████╗ ██╗   ██╗███████╗           ",
      "██╔════╝ ██║     ██╔═══██╗██╔══██╗██║██╔═══██╗██║   ██║██╔════╝           ",
      "██║  ███╗██║     ██║   ██║██████╔╝██║██║   ██║██║   ██║███████╗           ",
      "██║   ██║██║     ██║   ██║██╔══██╗██║██║   ██║██║   ██║╚════██║           ",
      "╚██████╔╝███████╗╚██████╔╝██║  ██║██║╚██████╔╝╚██████╔╝███████║           ",
      " ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝ ╚═════╝  ╚═════╝ ╚══════╝           ",
      "                                                                          ",
      "███████╗██╗   ██╗ ██████╗ ██╗     ██╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗",
      "██╔════╝██║   ██║██╔═══██╗██║     ██║   ██║╚══██╔══╝██║██╔═══██╗████╗  ██║",
      "█████╗  ██║   ██║██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║",
      "██╔══╝  ╚██╗ ██╔╝██║   ██║██║     ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║",
      "███████╗ ╚████╔╝ ╚██████╔╝███████╗╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║",
      "╚══════╝  ╚═══╝   ╚═════╝ ╚══════╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝",
      "                                                                          ",
    }

    -- Icônes avec des caractères Nerd Font explicites
    dashboard.section.buttons.val = {
      dashboard.button("e", "📝 New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "🔎 Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "🕟 Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("l", "🧮 LeetCode", ":Leet<CR>"),
      dashboard.button("s", "⚙️  Settings", ":e $MYVIMRC<CR>"),
      dashboard.button("q", "🚫 Quit", ":qa<CR>"),
    }

    -- Centrer les boutons dans l'interface
    dashboard.section.buttons.opts = {
      spacing = 1,
      hl = "String",
    }

    -- Essayer un centrage visuel avec un padding adéquat
    dashboard.config.layout = {
      { type = "padding", val = 4 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
    }

    -- Centrer davantage le contenu
    dashboard.config.opts = {
      margin = 5,
      noautocmd = true,
    }

    -- Configurer alpha avec notre dashboard personnalisé
    alpha.setup(dashboard.config)

    -- Désactiver le folding sur la page alpha
    vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])
  end,
}
