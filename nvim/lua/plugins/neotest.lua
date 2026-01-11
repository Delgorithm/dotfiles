return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h"))
						.. " --watch",
					jestArguments = function(defaultArguments, context)
						return defaultArguments
					end,
					jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
					isTestFile = require("neotest-jest.jest-util").defaultIsTestFile,
				}),
			},
		})
	end,
}
