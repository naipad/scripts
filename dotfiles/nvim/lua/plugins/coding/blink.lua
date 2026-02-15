local M = {}

function M.setup()
  local blink = require("blink.cmp")
  blink.setup({
    keymap = {
      preset = "enter",
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    appearance = {
      nerd_font_variant = "normal",
    },
    completion = {
      keyword = { range = "prefix" },
      menu = {
        border = "rounded",
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        draw = {
          treesitter = { "lsp" },
        },
      },
      trigger = { show_on_trigger_character = true },
      documentation = {
        window = {
          border = "rounded",
        },
        auto_show = false,
      },
    },
    signature = { enabled = true },
  })
end

return M
