return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    local function is_executable(name)
      return vim.fn.executable(name) == 1
    end

    local linters_by_ft = {}

    if is_executable("eslint") then
      linters_by_ft.javascript = { "eslint" }
      linters_by_ft.typescript = { "eslint" }
      linters_by_ft.javascriptreact = { "eslint" }
      linters_by_ft.typescriptreact = { "eslint" }
    end

    if is_executable("ruff") then
      linters_by_ft.python = { "ruff" }

      lint.linters.ruff.args = {
        "--format=json",
        "--select=E,F,W",
        "--ignore=E501",
      }
    end

    if is_executable("luacheck") then
      linters_by_ft.lua = { "luacheck" }
    end

    if is_executable("markdownlint") then
      linters_by_ft.markdown = { "markdownlint" }
    end

    if is_executable("yamllint") then
      linters_by_ft.yaml = { "yamllint" }
    end

    if is_executable("jsonlint") then
      linters_by_ft.json = { "jsonlint" }
    end

    if is_executable("stylelint") then
      linters_by_ft.css = { "stylelint" }
      linters_by_ft.scss = { "stylelint" }
    end

    lint.linters_by_ft = linters_by_ft

    if not vim.tbl_isempty(linters_by_ft) then
      local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          pcall(lint.try_lint)
        end,
      })

      vim.api.nvim_create_user_command("Lint", function()
        lint.try_lint()
      end, {})

      vim.keymap.set("n", "<leader>cl", function()
        lint.try_lint()
      end, { desc = "Lint current file" })
    end
  end,
}
