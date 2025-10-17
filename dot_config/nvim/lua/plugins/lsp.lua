return {
  "williamboman/mason.nvim",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "elixir-tools/elixir-tools.nvim" },
    { "luckasRanarison/tailwind-tools.nvim" },
  },
  config = function()
    local servers = {
      "astro",
      "cssls",
      "docker_compose_language_service",
      "dockerls",
      "eslint",
      "html",
      "jsonls",
      "lua_ls",
      "pyright",
      "yamlls",
      "vtsls",
      "tailwindcss",
    }

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = servers,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local function on_attach(_, bufnr)
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map("n", "gd", vim.lsp.buf.definition, "Go to definition")
      map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
      map("n", "K", vim.lsp.buf.hover, "Hover")
      map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
      map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
      map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
      map("n", "gr", vim.lsp.buf.references, "References")
      map("n", "<leader>D", vim.lsp.buf.type_definition, "Type definition")
      map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, "List workspace folders")
    end

    local border = {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
    }

    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    require("mason-lspconfig").setup_handlers({
      function(server_name)
        if server_name == "tailwindcss" then
          require("lspconfig").tailwindcss.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            handlers = handlers,
            filetypes = { "html", "css", "javascript", "typescript", "elixir", "heex", "eelixir" },
            init_options = {
              userLanguages = {
                elixir = "html-eex",
                eelixir = "html-eex",
                heex = "html-eex",
              },
            },
          })
        else
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            handlers = handlers,
          })
        end
      end,
    })

    require("elixir").setup({
      elixirls = {
        enable = true,
        settings = require("elixir.elixirls").settings({
          dialyzerEnabled = false,
          enableTestLenses = false,
        }),
        on_attach = on_attach,
        handlers = handlers,
      },
    })

    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })

    vim.diagnostic.config({
      float = {
        border = "rounded",
        source = true,
      },
    })

    vim.keymap.set("n", "ge", vim.diagnostic.open_float, { desc = "Open diagnostics" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
  end,
}
