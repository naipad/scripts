local M = {}

function M.setup()
	require("snacks").setup({
		bigfile = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		toggle = { enabled = true },
		terminal = { enabled = true },
		image = { enabled = false },
		words = { enabled = false },
		explorer = { enabled = false },
		dashboard = { enabled = false },
	})
end

return M
