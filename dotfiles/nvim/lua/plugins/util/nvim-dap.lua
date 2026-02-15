local M = {}

function M.setup()
  local dap = require("dap")
  local dapui = require("dapui")
  require("mason-nvim-dap").setup({
    automatic_installation = true,
    handlers = {},
    ensure_installed = {
      "python",
      "codelldb",
      -- "cppdbg", -- cpptools
    },
  })

  -- golang Debug
  dap.configurations.go = {
    {
      type = "delve",
      name = "file",
      request = "launch",
      program = "${file}",
      outputMode = "remote",
    },
  }

  dap.listeners.after.event_initialized["dapui_config"] = dapui.open
  dap.listeners.before.event_terminated["dapui_config"] = dapui.close
  dap.listeners.before.event_exited["dapui_config"] = dapui.close

  dapui.setup()

  vim.api.nvim_set_hl(0, "DapUIPlayPauseNC", { link = "WinBar" })
  vim.api.nvim_set_hl(0, "DapUIRestartNC", { link = "WinBar" })
  vim.api.nvim_set_hl(0, "DapUIStopNC", { link = "WinBar" })
  vim.api.nvim_set_hl(0, "DapUIUnavailableNC", { link = "WinBar" })
  vim.api.nvim_set_hl(0, "DapUIStepOverNC", { link = "WinBar" })
  vim.api.nvim_set_hl(0, "DapUIStepIntoNC", { link = "WinBar" })
  vim.api.nvim_set_hl(0, "DapUIStepBackNC", { link = "WinBar" })
  vim.api.nvim_set_hl(0, "DapUIStepOutNC", { link = "WinBar" })

  vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#ff869a", bg = "#212432" })
  vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#82b1ff", bg = "#212432" })
  vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#c3e88d", bg = "#212432" })

  vim.fn.sign_define(
    "DapBreakpoint",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  )
  vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  )
  vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  )
  vim.fn.sign_define(
    "DapLogPoint",
    { text = "󰛿", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
  )
  vim.fn.sign_define(
    "DapStopped",
    { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
  )

  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<F5>", dap.continue, vim.tbl_extend("force", opts, { desc = "Debug: Start/Continue" }))
  vim.keymap.set("n", "<F6>", dap.close, vim.tbl_extend("force", opts, { desc = "Debug: Close" }))
  vim.keymap.set("n", "<F1>", dap.step_into, vim.tbl_extend("force", opts, { desc = "Debug: Step Into" }))
  vim.keymap.set("n", "<F2>", dap.step_over, vim.tbl_extend("force", opts, { desc = "Debug: Step Over" }))
  vim.keymap.set("n", "<F3>", dap.step_out, vim.tbl_extend("force", opts, { desc = "Debug: Step Out" }))
  vim.keymap.set(
    "n",
    "<F7>",
    dapui.toggle,
    vim.tbl_extend("force", opts, { desc = "Debug: See last session result." })
  )

  -- Breakpoints
  vim.keymap.set(
    "n",
    "<leader>bb",
    dap.toggle_breakpoint,
    vim.tbl_extend("force", opts, { desc = "Debug: Toggle Breakpoint" })
  )
  vim.keymap.set("n", "<leader>bB", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
  end, vim.tbl_extend("force", opts, { desc = "Debug: Set Breakpoint" }))
end

return M
