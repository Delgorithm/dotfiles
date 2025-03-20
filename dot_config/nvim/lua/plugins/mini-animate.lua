return {
  "echasnovski/mini.animate",
  version = false,
  event = "VeryLazy",
  opts = {
    cursor = {
      enable = true,

      timing = nil,
      path = nil,
    },

    scroll = {
      enable = true,

      timing = nil,
      subscroll = nil,
    },

    resize = {
      enable = true,

      timing = nil,
      subresize = nil,
    },

    open = {
      enable = true,

      timing = nil,
      winconfig = nil,
      winblend = nil,
    },

    close = {
      enable = true,

      timing = nil,
      winconfig = nil,
      winblend = nil,
    },
  },
  config = function(_, opts)
    require("mini.animate").setup(opts)
  end,
}
