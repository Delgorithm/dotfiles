return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
	},
	version = "*",
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = "npm test --",
					jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
		})

		vim.api.nvim_set_hl(0, "NeotestPassed", { fg = "#98C379", bold = true })
		vim.api.nvim_set_hl(0, "NeotestFailed", { fg = "#9D0006", bold = true })
		vim.api.nvim_set_hl(0, "NeotestRunning", { fg = "#D65D0E", bold = true })
		vim.api.nvim_set_hl(0, "NeotestSkipped", { fg = "#8F3F71", bold = true })
		vim.api.nvim_set_hl(0, "NeotestNamespace", { fg = "#B57614", bold = true })
		vim.api.nvim_set_hl(0, "NeotestFile", { fg = "#7C6F64", bold = true })
		vim.api.nvim_set_hl(0, "NeotestDir", { fg = "#282828", bold = true })
	end,
	keys = {
		{
			"<leader>nr",
			function()
				require("neotest").run.run()
			end,
			desc = "Run nearest test",
		},
		{
			"<leader>nf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run file tests",
		},
		{
			"<leader>ns",
			function()
				require("neotest").run.stop()
			end,
			desc = "Stop test",
		},
		{
			"<leader>nS",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Toggle summary",
		},
	},
}
