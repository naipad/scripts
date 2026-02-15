local M = {
  colors = {
    blue = "#65D1FF",
    green = "#3EFFDC",
    violet = "#FF61EF",
    yellow = "#FFDA7B",
    red = "#FF4A4A",
    fg = "#c3ccdc",
    bg = "#112638",
    inactive_bg = "#2c3043",
    inactive_fg = "#9da5b4",
  }
}

function M.setup()
  local lualine = require("lualine")
  local lazy_status = require("lazy.status")

  local theme = {
    normal = {
      a = { bg = M.colors.blue, fg = M.colors.bg, gui = "bold" },
      b = { bg = M.colors.bg, fg = M.colors.fg },
      c = { bg = M.colors.bg, fg = M.colors.fg },
    },
    insert = {
      a = { bg = M.colors.green, fg = M.colors.bg, gui = "bold" },
      b = { bg = M.colors.bg, fg = M.colors.fg },
      c = { bg = M.colors.bg, fg = M.colors.fg },
    },
    visual = {
      a = { bg = M.colors.violet, fg = M.colors.bg, gui = "bold" },
      b = { bg = M.colors.bg, fg = M.colors.fg },
      c = { bg = M.colors.bg, fg = M.colors.fg },
    },
    command = {
      a = { bg = M.colors.yellow, fg = M.colors.bg, gui = "bold" },
      b = { bg = M.colors.bg, fg = M.colors.fg },
      c = { bg = M.colors.bg, fg = M.colors.fg },
    },
    replace = {
      a = { bg = M.colors.red, fg = M.colors.bg, gui = "bold" },
      b = { bg = M.colors.bg, fg = M.colors.fg },
      c = { bg = M.colors.bg, fg = M.colors.fg },
    },
    inactive = {
      a = { bg = M.colors.inactive_bg, fg = M.colors.inactive_fg, gui = "bold" },
      b = { bg = M.colors.inactive_bg, fg = M.colors.inactive_fg },
      c = { bg = M.colors.inactive_bg, fg = M.colors.inactive_fg },
    },
  }
  -- configure lualine with modified theme
  lualine.setup({
    options = {
      theme = theme,
      disabled_filetypes = { "NvimTree", "neo-tree", "dashboard", "alpha" },
    },
    sections = {
      lualine_x = {
        {
          lazy_status.updates,
          cond = lazy_status.has_updates,
          color = { fg = "#ff9e64" },
        },
        { "encoding" },
        { "fileformat" },
        { "filetype" },
      },
    },
  })
end

return M
