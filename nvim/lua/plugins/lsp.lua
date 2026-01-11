return {
	{
		"williamboman/mason.nvim",
		config = true,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"eslint",
				"html",
				"cssls",
				"jsonls",
			},
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"stylua",
				"prettierd",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config.lua_ls = {
				capabilities = capabilities,
			}

			vim.lsp.config.ts_ls = {
				capabilities = capabilities,
			}

			vim.lsp.config.eslint = {
				capabilities = capabilities,
			}

			vim.lsp.config.html = {
				capabilities = capabilities,
			}

			vim.lsp.config.cssls = {
				capabilities = capabilities,
			}

			vim.lsp.config.jsonls = {
				capabilities = capabilities,
			}

			vim.lsp.enable({
				"lua_ls",
				"ts_ls",
				"eslint",
				"html",
				"cssls",
				"jsonls",
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client.name == "eslint" then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = args.buf,
							command = "EslintFixAll",
						})
					end
				end,
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.css", "*.json", "*.lua" },
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end,
	},

	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.stylua,
				},
			})
		end,
	},
}
