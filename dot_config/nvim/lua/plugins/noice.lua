return {
  "folke/noice.nvim",
  dependencies = {
    { "MunifTanjim/nui.nvim" },
  },
  opts = {
    routes = {
      {
        filter = { event = 'msg_show', kind = '', find = 'written' },
        opts = { skip = true },
      },
      {
        filter = { event = 'msg_show', kind = '', find = 'Modified' },
        opts = { skip = true },
      },
      {
        filter = { event = 'msg_show', kind = '', find = 'lines' },
        opts = { skip = true },
      },
      {
        filter = { event = 'msg_show', kind = '', find = '--' },
        opts = { skip = true },
      },
    },
    lsp = {
      hover = {
        enabled = false,
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
  },
  config = function(opts)
    local noice = require("noice")
    noice.setup(opts)
    print("noice.setup")

    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "NoiceCmdlinePopup" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { link = "NoiceCmdlinePopup" })
  end
}
