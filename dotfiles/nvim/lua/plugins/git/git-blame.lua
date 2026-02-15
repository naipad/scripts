local M = {}

function M.setup()
  require('gitblame').setup({
    enabled = true,
    gitblame_delay = 500,
  })
end

return M
