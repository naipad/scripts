local M = {}

local function setup_lsp()
  local keymap = vim.keymap -- for conciseness
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      local opts = { buffer = ev.buf, silent = true }
      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definition"
      keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definition

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
      end, opts) -- jump to previous diagnostic in buffer
      --
      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
      end, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end,
  })

  -- vim.api.nvim_create_autocmd("CursorHold", {
  --   callback = function()
  --     vim.diagnostic.open_float(nil, { focusable = false, source = "if_many" })
  --   end,
  -- })

  -- vim.lsp.inlay_hint.enable(true)

  local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
  local severity = vim.diagnostic.severity

  vim.diagnostic.config({
    signs = {
      text = {
        [severity.ERROR] = signs.Error,
        [severity.WARN] = signs.Warn,
        [severity.INFO] = signs.Info,
        [severity.HINT] = signs.Hint,
      },
    },
  })
end

function M.setup()
  local capabilities = require("blink.cmp").get_lsp_capabilities()

  vim.lsp.config("*", {
    capabilities = capabilities,
  })

  setup_lsp()

  vim.lsp.config("jsonls", {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  })

  vim.lsp.config("gopls", {
    settings = {
      gopls = {
        semanticTokens = true,
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  })
end

return M
