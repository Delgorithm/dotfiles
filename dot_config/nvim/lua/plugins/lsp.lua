return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      vim.lsp.config("lua_ls", {})
      vim.lsp.config("astro", {})
      vim.lsp.config("cssls", {})
      vim.lsp.config("docker_compose_language_service", {})
      vim.lsp.config("dockerls", {})
      vim.lsp.config("eslint", {})
      vim.lsp.config("html", {})
      vim.lsp.config("jsonls", {})
      vim.lsp.config("pyright", {})
      vim.lsp.config("yamlls", {})
      vim.lsp.config("tailwindcss", {})

      vim.lsp.enable({ "lua_ls" })
      vim.lsp.enable({ "" })
      vim.lsp.enable({ "astro" })
      vim.lsp.enable({ "cssls" })
      vim.lsp.enable({ "docker_compose_language_service" })
      vim.lsp.enable({ "dockerls" })
      vim.lsp.enable({ "eslint" })
      vim.lsp.enable({ "html" })
      vim.lsp.enable({ "jsonls" })
      vim.lsp.enable({ "pyright" })
      vim.lsp.enable({ "yamlls" })
      vim.lsp.enable({ "tailwindcss" })
    end,
  }
}
