local M = {}

function M.setup()
  require("illuminate").configure({
    providers = { "lsp", "treesitter", "regex" },
    delay = 200,
    under_cursor = true,
    large_file_cutoff = 10000,
    case_insensitive_regex = false,
    disable_keymaps = true,
    filetypes_denylist = {
      "NvimTree",
      "codecompanion",
      "lazy"
    }
  })
end

return M
