return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require 'auto-session'
    local keymap = vim.keymap

    auto_session.setup {
      -- auto_restore_enabled = false,
      auto_session_suppress_dirs = { '~/', '~/Dev/', '~/Downloads', '~/Documents', '~/Desktop/' },
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true, -- Initialize on startup (requires Telescope)
        theme_conf = { -- Pass through for Telescope theme options
          border = true,
        },
        previewer = false, -- File preview for session picker
      },
    }

    keymap.set('n', '<leader>sl', '<cmd>SessionRestore<CR>', { desc = 'Restore session for cwd' }) -- restore last workspace session for current directory
    keymap.set('n', '<leader>ss', '<cmd>SessionSave<CR>', { desc = 'Save session for auto session root dir' }) -- save workspace session for current working directory
    keymap.set('n', '<leader>ls', '<cmd>SessionSearch<CR>', { noremap = true })
  end,
}
