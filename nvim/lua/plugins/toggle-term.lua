return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		direction = "float",
		float_opts = {
			border = "curved",
		},
	},
	keys = {
		{ "`", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal", mode = { "n", "t" } },
	},
}
