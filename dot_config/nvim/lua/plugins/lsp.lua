return {
  "williamboman/mason.nvim",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "elixir-tools/elixir-tools.nvim" },
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

    -- Keymaps LSP via LspAttach
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
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
      end,
    })

    -- Configure tous les serveurs avec la nouvelle API
    for _, server in ipairs(servers) do
      local config = {
        capabilities = capabilities,
      }

      -- Config spécifique pour Tailwind
      if server == "tailwindcss" then
        config.filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "elixir", "heex", "eelixir" }
        config.init_options = {
          userLanguages = {
            elixir = "html-eex",
            eelixir = "html-eex",
            heex = "html-eex",
          },
        }
      end

      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end

    -- Elixir setup (garde l'ancienne méthode car plugin spécial)
    require("elixir").setup({
      elixirls = {
        enable = true,
        settings = require("elixir.elixirls").settings({
          dialyzerEnabled = false,
          enableTestLenses = false,
        }),
      },
    })

    -- CMP setup
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

    -- Diagnostics config
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
