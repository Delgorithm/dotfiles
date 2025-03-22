return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Vérifier quels linters sont disponibles
    local function is_executable(name)
      return vim.fn.executable(name) == 1
    end

    -- Configuration des linters seulement s'ils sont disponibles
    local linters_by_ft = {}

    -- JavaScript/TypeScript
    if is_executable("eslint") then
      linters_by_ft.javascript = { "eslint" }
      linters_by_ft.typescript = { "eslint" }
      linters_by_ft.javascriptreact = { "eslint" }
      linters_by_ft.typescriptreact = { "eslint" }
    end

    -- Python
    if is_executable("ruff") then
      linters_by_ft.python = { "ruff" }

      -- Configuration du linter ruff pour Python
      lint.linters.ruff.args = {
        "--format=json",
        "--select=E,F,W", -- Erreurs, bugs et avertissements
        "--ignore=E501", -- Ignorer la longueur de ligne
      }
    end

    -- Lua
    if is_executable("luacheck") then
      linters_by_ft.lua = { "luacheck" }
    end

    -- Markdown
    if is_executable("markdownlint") then
      linters_by_ft.markdown = { "markdownlint" }
    end

    -- YAML
    if is_executable("yamllint") then
      linters_by_ft.yaml = { "yamllint" }
    end

    -- JSON
    if is_executable("jsonlint") then
      linters_by_ft.json = { "jsonlint" }
    end

    -- CSS/SCSS
    if is_executable("stylelint") then
      linters_by_ft.css = { "stylelint" }
      linters_by_ft.scss = { "stylelint" }
    end

    -- Configurer les linters
    lint.linters_by_ft = linters_by_ft

    -- Définir un groupe d'autocommandes pour le linting automatique seulement si au moins un linter est disponible
    if not vim.tbl_isempty(linters_by_ft) then
      local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })

      -- Exécuter le linting au chargement et à la sauvegarde du buffer
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          -- Tenter le linting, mais ne rien faire si aucun linter n'est disponible
          pcall(lint.try_lint)
        end,
      })

      -- Commande pour linting manuel
      vim.api.nvim_create_user_command("Lint", function()
        lint.try_lint()
      end, {})

      -- Raccourcis clavier
      vim.keymap.set("n", "<leader>cl", function()
        lint.try_lint()
      end, { desc = "Lint current file" })
    end
  end,
}
