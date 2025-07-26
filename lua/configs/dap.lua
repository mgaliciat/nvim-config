local dap = require("dap")
local dapui = require("dapui")

-- Setup DAP UI
dapui.setup({
  icons = { expanded = "", collapsed = "", current_frame = "" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Use this to override mappings for specific elements
  element_mappings = {
    -- Example:
    -- stacks = {
    --   open = "<CR>",
    --   expand = "o",
    -- }
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    -- In the controls element you can configure different controls.
    -- The controls shown depend on the element.
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "",
      terminate = "",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})

-- Auto open/close DAP UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Load VSCode launch.json configurations
require('dap.ext.vscode').load_launchjs(nil, {
  -- Map VSCode type to nvim-dap name
  ['node'] = {'javascript', 'typescript'},
  ['pwa-node'] = {'javascript', 'typescript'},
  ['chrome'] = {'javascript', 'typescript'},
  ['pwa-chrome'] = {'javascript', 'typescript'},
  ['go'] = {'go'},
  ['python'] = {'python'},
  ['cpp'] = {'cpp', 'c'},
  ['cppdbg'] = {'cpp', 'c'},
})

-- DAP signs
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='🟡', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='🔵', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='▶️', texthl='', linehl='DapStoppedLine', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🚫', texthl='', linehl='', numhl=''})

-- Go debugger configuration (delve)
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  }
}

-- Key mappings
local opts = { noremap = true, silent = true }

-- Basic debugging
vim.keymap.set("n", "<F5>", dap.continue, opts)
vim.keymap.set("n", "<F10>", dap.step_over, opts)
vim.keymap.set("n", "<F11>", dap.step_into, opts)
vim.keymap.set("n", "<F12>", dap.step_out, opts)

-- Breakpoints
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, opts)
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, opts)
vim.keymap.set("n", "<leader>dp", function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end, opts)

-- DAP UI
vim.keymap.set("n", "<leader>du", dapui.toggle, opts)
vim.keymap.set("n", "<leader>dr", dap.repl.open, opts)
vim.keymap.set("n", "<leader>dl", dap.run_last, opts)

-- Variables and evaluation
vim.keymap.set({"n", "v"}, "<leader>dh", function()
  require("dap.ui.widgets").hover()
end, opts)
vim.keymap.set({"n", "v"}, "<leader>dp", function()
  require("dap.ui.widgets").preview()
end, opts)
vim.keymap.set("n", "<leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end, opts)
vim.keymap.set("n", "<leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end, opts)

return dap