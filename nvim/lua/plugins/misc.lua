-- Standalone plugins with less than 10 lines of config go here
return {
  {
    -- Powerful Git integration for Vim
    'tpope/vim-fugitive',
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  {
    -- GitHub integration for vim-fugitive
    'tpope/vim-rhubarb',
  },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- high-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'kylechui/nvim-surround',
    event = { 'BufReadPre', 'BufNewFile' },
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = true,
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
  },
  {
    'barrett-ruth/live-server.nvim',
    build = 'npm add -g live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = true,
  },
  {
    'szw/vim-maximizer',
    keys = {
      { '<leader>mt', '<cmd>MaximizerToggle<CR>', desc = 'Maximize/minimize a split' },
    },
  },
  {
    'gbprod/substitute.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local substitute = require 'substitute'

      substitute.setup()

      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set('n', 's', substitute.operator, { desc = 'Substitute with motion' })
      keymap.set('n', 'ss', substitute.line, { desc = 'Substitute line' })
      keymap.set('n', 'S', substitute.eol, { desc = 'Substitute to end of line' })
      keymap.set('x', 's', substitute.visual, { desc = 'Substitute in visual mode' })
    end,
  },
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    lazy = false,
    config = function() end,
  },
}
