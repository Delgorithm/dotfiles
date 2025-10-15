return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.icons",
  },
  opts = {
    render_modes = true,
    heading = {
      width = "block",
      left_pad = 1,
      right_pad = 1,
      enabled = true,
      border = true,
      border_virtual = true,
      icons = { '󱂈 ', '󱂉 ', '󱂊 ', '󱂋 ', '󱂌 ', '󱂍 ' },
    },
    code = {
      width = "block",
      left_pad = 2,
      right_pad = 4,
      language_pad = 2,
      min_width = 45,
      enabled = true,
    },
    pipe_table = { preset = "heavy", cell = "padded" },
    callout = { note = { quote_icon = "█" } },
    link = {
      custom = {
        python = {
          pattern = "%.py$",
          icon = "󰌠 ",
        },
      },
    },
    sign = {
      enabled = true,
      highlight = "RenderMarkdownSign",
    },
    indent = {
      enabled = true,
      skip_heading = true,
    },
    latex = {
      enabled = false,
    },
  },
}
