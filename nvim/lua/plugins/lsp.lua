return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"eslint",
				"html",
				"cssls",
				"jsonls",
				"astro",
				"tailwindcss",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"stylua",
				"prettierd",
				"prettier",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config.lua_ls = {
				capabilities = capabilities,
			}

			vim.lsp.config.ts_ls = {
				capabilities = capabilities,
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
						},
					},
				},
			}

			vim.lsp.config.eslint = { capabilities = capabilities }
			vim.lsp.config.html = {
				capabilities = capabilities,
				settings = {
					html = {
						format = {
							enable = true,
						},
					},
				},
			}
			vim.lsp.config.cssls = { capabilities = capabilities }
			vim.lsp.config.jsonls = { capabilities = capabilities }
			vim.lsp.config.astro = { capabilities = capabilities }
			vim.lsp.config.tailwindcss = { capabilities = capabilities }

			vim.lsp.enable({
				"lua_ls",
				"ts_ls",
				"eslint",
				"html",
				"cssls",
				"jsonls",
				"astro",
				"tailwindcss",
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client.name == "eslint" then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.code_action({
									context = { only = { "source.fixAll.eslint" } },
									apply = true,
								})
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				astro = { "prettier" },
			},
			formatters = {
				prettier = {
					require_cwd = true,
				},
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
}
