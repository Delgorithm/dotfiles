return {
  "rcarriga/nvim-notify",
  lazy = false,
  priority = 1000,
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "fade",
      render = "default",
      timeout = 3000,
      top_down = true,
    })

    vim.notify = notify
  end,
}
