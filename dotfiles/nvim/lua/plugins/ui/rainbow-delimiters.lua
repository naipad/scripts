local M = {
	highlights = {
		RainbowDelimiterRed = "#E06C75",
		RainbowDelimiterYellow = "#E5C07B",
		RainbowDelimiterBlue = "#61AFEF",
		RainbowDelimiterOrange = "#D19A66",
		RainbowDelimiterGreen = "#98C379",
		RainbowDelimiterViolet = "#C678DD",
		RainbowDelimiterCyan = "#56B6C2",
	},
}

function M.setup()
	require("rainbow-delimiters.setup").setup({
		highlight = {
			"RainbowDelimiterRed",
			"RainbowDelimiterYellow",
			"RainbowDelimiterBlue",
			"RainbowDelimiterOrange",
			"RainbowDelimiterGreen",
			"RainbowDelimiterViolet",
			"RainbowDelimiterCyan",
		},
	})

	for group, color in pairs(M.highlights) do
		vim.api.nvim_set_hl(0, group, { fg = color })
	end
end

return M
