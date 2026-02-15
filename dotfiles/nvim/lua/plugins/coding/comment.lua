local M = {}

function M.setup()
  -- import comment plugin safely
  local comment = require("Comment")
  local commentstring = require("ts_context_commentstring.integrations.comment_nvim")
  -- enable comment
  comment.setup({
    -- for commenting tsx, jsx, svelte, html files
    pre_hook = commentstring.create_pre_hook(),
  })
end

return M
