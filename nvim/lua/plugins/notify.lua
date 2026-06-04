return {
	"rcarriga/nvim-notify",
	opts = {
		stages = "slide",
		timeout = 3500,
		render = "default",
		top_down = true,
		background_colour = "#000000",
	},
	config = function(_, opts)
		local notify = require("notify")
		notify.setup(opts)

		vim.notify = function(msg, level, notify_opts)
			if msg:match("No code actions available") then
				return
			end
			notify(msg, level, notify_opts)
		end
	end,
}
