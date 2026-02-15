local M = {}

function M.init()
  vim.o.timeout = true
  vim.o.timeoutlen = 500
end

function M.setup()
  require("which-key").setup({
    delay = 200,
  })
end

return M
