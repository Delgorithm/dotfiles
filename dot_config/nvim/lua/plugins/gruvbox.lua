return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  enabled = true,
  lazy = false,
  config = function()
    local gruvbox = require("gruvbox")
    gruvbox.setup({})

    vim.o.background = "light"
    vim.cmd("colorscheme gruvbox")

    function ToggleTheme()
      if vim.o.background == "dark" then
        vim.o.background = "light"
      else
        vim.o.background = "dark"
      end
      vim.cmd.colorscheme("gruvbox")
      print("Theme switched to " .. vim.o.background)
    end

    vim.keymap.set("n", "<leader>st", ToggleTheme, { desc = "Toggle Gruvbox Theme" })
  end,
}
