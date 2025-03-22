return {
  "ellisonleao/carbon-now.nvim",
  cmd = { "CarbonNow" },
  opts = {
    options = {
      theme = "material",
      font_family = "Hack",
      font_size = "14px",
      background = "#4C566A",
      drop_shadow = true,
      drop_shadow_blur = "68px",
      drop_shadow_offset_y = "20px",
      window_theme = "none",
      line_numbers = true,
      line_height = "143%",
      width = "680",
      watermark = false,
      show_window_controls = true,
      auto_adjust_width = false,
    },

    open_browser = true,

    save_path = "~/Downloads/",

    keymaps = {
      visual = "<leader>cc",
    },
  },

  config = function(_, opts)
    require("carbon-now").setup(opts)

    vim.api.nvim_create_user_command("CarbonFile", function()
      vim.cmd("normal! ggVG")
      vim.cmd("CarbonNow")
    end, {})

    vim.keymap.set("n", "<leader>cf", ":CarbonFile<CR>", { desc = "Carbon: Export file" })
  end,
}
