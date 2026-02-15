local M = {}

function M.setup()
	-- import mason
	local mason = require("mason")

	-- import mason-lspconfig
	local mason_lspconfig = require("mason-lspconfig")
	local mason_tool_installer = require("mason-tool-installer")

	-- enable mason and configure icons
	mason.setup({
		log_level = vim.log.levels.OFF,
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	mason_lspconfig.setup({
		-- list of servers for mason to install
		ensure_installed = {
			"awk_ls",
			"lua_ls",
			"bashls",
			"html",
			"cssls",
			"css_variables",
			"cssmodules_ls",
			-- "eslint", use eslint_d
			"jsonls",
			"yamlls", -- yaml
			"emmet_ls",
			"clangd",
			"neocmake",
			"ts_ls",
			"pyright",
			"gopls",
			"dockerls",
			"docker_compose_language_service",
			"gh_actions_ls",
			"nginx_language_server",
			"postgres_lsp",
			"prismals",
			"sqlls",
			"tailwindcss",
			"templ",
		},
	})

	mason_tool_installer.setup({
		ensure_installed = {
			"prettier", -- prettier formatter
			"black",
			"isort",
			"pylint",
			"stylua", -- lua formatter
			{ "eslint_d", version = "13.1.2" },
			"delve", --golang
		},
	})
end

return M
