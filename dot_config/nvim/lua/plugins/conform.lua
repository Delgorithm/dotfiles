return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    -- Définir les formateurs par type de fichier
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      scss = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },
      yaml = { { "prettierd", "prettier" } },
      sh = { "shfmt" },
    },

    -- Options formatters
    formatters = {
      stylua = {
        prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
      prettier = {
        prepend_args = { "--print-width", "100", "--tab-width", "2" },
      },
      black = {
        prepend_args = { "--line-length", "88" },
      },
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },

    -- Formater à la sauvegarde
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
      quiet = true, -- ne pas afficher de message si le formateur échoue
    },

    -- Formater avec des instructions plus détaillées
    format_after_save = {
      lsp_fallback = true,
    },

    -- Ne pas réformater si le fichier a été modifié après l'ouverture
    notify_on_error = true,
  },
}
