return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lang = "cpp",
    storage = {
      home = vim.fn.stdpath("data") .. "/leetcode",
      cache = vim.fn.stdpath("cache") .. "/leetcode",
    },
    console = {
      open_on_runcode = true,
      size = {
        width = "90%",
        height = "75%",
      },
    },
    description = {
      position = "left",
      width = "40%",
      show_stats = true,
    },
    injector = {
      ["cpp"] = {
        before = { "#include <bits/stdc++.h>", "using namespace std;" },
      },
      ["python3"] = {
        before = true,
      },
    },
    arg = "leetcode.nvim",
  },
  cmd = "Leet",
}
