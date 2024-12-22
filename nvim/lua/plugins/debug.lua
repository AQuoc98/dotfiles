return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'mfussenegger/nvim-dap-python',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        -- 'delve',
        'debugpy',
        'dart-debug-adapter',
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>dB', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Dart CLI adapter (recommended)
    dap.adapters.dart = {
      type = 'executable',
      command = 'dart', -- if you're using fvm, you'll need to provide the full path to dart (dart.exe for windows users), or you could prepend the fvm command
      args = { 'debug_adapter' },
      -- windows users will need to set 'detached' to false
      options = {
        detached = false,
      },
    }
    dap.adapters.flutter = {
      type = 'executable',
      command = 'flutter', -- if you're using fvm, you'll need to provide the full path to flutter (flutter.bat for windows users), or you could prepend the fvm command
      args = { 'debug_adapter' },
      -- windows users will need to set 'detached' to false
      options = {
        detached = false,
      },
    }
    dap.configurations.dart = {
      {
        type = 'dart',
        request = 'launch',
        name = 'Launch dart',
        -- dartSdkPath = '/opt/flutter/bin/cache/dart-sdk/bin/dart', -- ensure this is correct
        dartSdkPath = '/Users/ken/development/flutter/bin/cache/dart-sdk/bin/dart', -- ensure this is correct
        -- flutterSdkPath = '/opt/flutter/bin/flutter', -- ensure this is correct
        flutterSdkPath = '/Users/ken/development/flutter/bin/flutter', -- ensure this is correct
        -- program = '${workspaceFolder}/lib/main.dart', -- ensure this is correct
        program = '${file}',
        cwd = '${workspaceFolder}',
      },
      {
        type = 'flutter',
        request = 'launch',
        name = 'Launch flutter',
        dartSdkPath = '/Users/ken/development/flutter/bin/cache/dart-sdk/bin/dart', -- ensure this is correct
        -- dartSdkPath = '/opt/flutter/bin/cache/dart-sdk/bin/dart', -- ensure this is correct
        -- flutterSdkPath = '/opt/flutter/bin/flutter', -- ensure this is correct
        flutterSdkPath = '/Users/ken/development/flutter/bin/flutter', -- ensure this is correct
        program = '${workspaceFolder}/lib/main.dart', -- ensure this is correct
        cwd = '${workspaceFolder}',
      },
    }
    -- Install golang specific config
    -- require('dap-go').setup()
    require('dap-python').setup()
  end,
}
