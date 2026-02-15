local M = {}

function M.setup()
  require("bufferline").setup({
    options = {
      mode = "tabs",
    },
  })
end

return M
