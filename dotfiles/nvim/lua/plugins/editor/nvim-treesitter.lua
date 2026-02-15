local M = {
	ensure_installed = {
		"vim",
		"lua",
		"regex",
		"markdown",
		"markdown_inline",
		"bash",
		"typescript",
		"javascript",
		"tsx",
		"html",
		"css",
		"json",
		"yaml",
		"c",
		"cpp",
		"go",
		"templ",
		"python",
		"dockerfile",
		"diff",
		"git_rebase",
		"gitcommit",
		"gitattributes",
		"gitignore",
	}
}

function M.setup()
	-- import nvim-treesitter plugin
	local treesitter = require("nvim-treesitter")

	-- configure treesitter
	treesitter.setup({
		prefer_git = true,
		auto_install = true,
		sync_install = false,
		indent = { enable = true },
		highlight = { enable = true },
		-- ensure these language parsers are installed
		ensure_installed = M.ensure_installed,
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	})
end

return M
