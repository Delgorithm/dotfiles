return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require("telescope")
    
    telescope.setup({
      defaults = {
        layout_config = {
          vertical = { width = 0.5}
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
        }
      },
    })
    telescope.load_extension("fzf")
  end,
  keys = {
    { "<leader>fg", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
  }
}
