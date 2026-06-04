return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {},
	keys = {
		{ "<leader>lc", "<cmd>Leet<cr>", desc = "LeetCode" },
	},
	enabled = false,
}
