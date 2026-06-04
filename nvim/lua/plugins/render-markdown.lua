return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	ft = { "markdown" },
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				vim.treesitter.start()
			end,
		})

		require("render-markdown").setup({
			completions = { lsp = { enabled = true } },
			render_modes = true,
			latex = { enabled = false },
			heading = { icons = { "󰼏 ", "󰎨 " } },
			code = {
				left_margin = 4,
				left_pad = 4,
				right_pad = 4,
				border = "thick",
			},
			checkbox = {
				unchecked = { icon = "✘ " },
				checked = { icon = "✔ " },
				custom = { todo = { rendered = "◯ " } },
			},
			pipe_table = { alignment_indicator = "┅", preset = "round", min_width = 12 },
		})
	end,
}
