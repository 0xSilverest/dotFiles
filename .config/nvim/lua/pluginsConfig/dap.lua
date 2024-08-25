local dap = require('dap')

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Run Main",
    metals = {
      runType = "run",
    },
  },
  {
    type = "scala",
    request = "attach",
    name = "Attach",
    hostName = "localhost",
    port = 5005,
  },
}

dap.configurations.java = {
  {
    type = "scala",
    request = "launch",
    name = "Run or Test",
    metals = {
      runType = "runOrTestFile",
    },
  },
}

dap.configurations.sbt = {
  {
    type = "scala",
    request = "launch",
    name = "sbt Task",
    metals = {
      runType = "sbtTask",
    },
  },
}

-- C configuration
dap.adapters.lldb = {
  type = 'executable',
  command = 'lldb',
  name = 'lldb'
}

dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb',
  args = {"-i", "dap"}
}

dap.configurations.c = {
  {
    name = "Launch file (LLDB)",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
  {
    name = "Launch file (GDB)",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
  {
    name = 'Attach to process (LLDB)',
    type = 'lldb',
    request = 'attach',
    pid = require('dap.utils').pick_process,
    args = {},
  },
  {
    name = 'Attach to process (GDB)',
    type = 'gdb',
    request = 'attach',
    processId = require('dap.utils').pick_process,
    args = {},
  },
}

-- Optional: Add a custom command to start debugging
vim.api.nvim_create_user_command("DebugStart", function()
  dap.continue()
end, {})

vim.keymap.set('n', '<F5>', dap.continue, { desc = "Debug: Start/Continue" })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set('n', '<F12>', dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set('n', '<leader>B', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = "Debug: Set Breakpoint" })
