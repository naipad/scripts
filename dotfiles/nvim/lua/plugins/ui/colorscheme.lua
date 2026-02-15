local M = {
  transparent = false,
  bg = "#011628",
  bg_dark = "#011423",
  bg_highlight = "#143652",
  bg_search = "#0A64AC",
  bg_visual = "#275378",
  fg = "#CBE0F0",
  fg_dark = "#B4D0E9",
  fg_gutter = "#627E97",
  border = "#547998",
}

function M.setup()
  require("tokyonight").setup({
    style = "night",
    transparent = M.transparent,
    styles = {
      sidebars = M.transparent and "transparent" or "dark",
      floats = M.transparent and "transparent" or "dark",
    },
    on_colors = function(colors)
      colors.bg = M.bg
      colors.bg_dark = M.transparent and colors.none or M.bg_dark
      colors.bg_float = M.transparent and colors.none or M.bg_dark
      colors.bg_highlight = M.bg_highlight
      colors.bg_popup = M.bg_dark
      colors.bg_search = M.bg_search
      colors.bg_sidebar = M.transparent and colors.none or M.bg_dark
      colors.bg_statusline = M.transparent and colors.none or M.bg_dark
      colors.bg_visual = M.bg_visual
      colors.border = M.border
      colors.fg = M.fg
      colors.fg_dark = M.fg_dark
      colors.fg_float = M.fg
      colors.fg_gutter = M.fg_gutter
      colors.fg_sidebar = M.fg_dark
    end,
  })
  vim.cmd.colorscheme("tokyonight")
end

return M
