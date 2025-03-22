return {
  "numToStr/FTerm.nvim",
  event = "VeryLazy",
  config = function()
    local fterm = require("FTerm")

    fterm.setup({
      border = "single",
      dimensions = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,
      },
      blend = 5,
    })

    vim.keymap.set("n", "<leader>tt", fterm.toggle, { desc = "Toggle terminal" })
    vim.keymap.set("t", "<Esc><Esc>", fterm.toggle, { desc = "Toggle terminal" })

    local lazygit = fterm:new({
      ft = "fterm_lazygit",
      cmd = "lazygit",
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    })

    vim.keymap.set("n", "<leader>tg", function()
      lazygit:toggle()
    end, { desc = "Toggle Lazygit" })

    vim.keymap.set("n", "<leader>tr", function()
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
