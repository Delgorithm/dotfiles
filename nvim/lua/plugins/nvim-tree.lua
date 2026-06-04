return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	opts = {
		popup_border_style = "",
		filesystem = {
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
		},
	},
	keys = {
		{ "<leader>e", "<Cmd>Neotree reveal float<CR>", desc = "Reveal file in Neotree" },
	},
}
