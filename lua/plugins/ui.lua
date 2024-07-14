-- selene: allow(mixed_table)
return {
  { 'MunifTanjim/nui.nvim',   enabled = not vim.g.vscode }, -- base ui components for nvim
  { 'stevearc/dressing.nvim', enabled = not vim.g.vscode }, -- overrides the default vim input to provide better visuals
  {
    'nvim-lualine/lualine.nvim',
    event = 'UIEnter',
    enabled = not vim.g.vscode,
    config = function()
      require('setup.lualine').setup(
        require('setup.nvim-navic').winbar,
        require('setup.noice').command_status()
      )
    end,
  }, -- status line
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    enabled = not vim.g.vscode,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('setup.noice').setup()
    end,
  }, -- adds various ui enhancements such as a popup for the cmd line, lsp progress
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_better_performance = 1
      vim.cmd.colorscheme('gruvbox-material')
    end
  },
  {
    'nanozuki/tabby.nvim',
    enabled = not vim.g.vscode,
    -- requires = { -- tabline
    --     'tiagovla/scope.nvim', -- creates scopes for splitting buffers per tabs
    -- },
    config = require('setup.tabline').setup,
  },
  {
    'lewis6991/gitsigns.nvim',
    enabled = not vim.g.vscode,
    config = require('setup.gitsigns').setup,
  }, -- show git indicators next to the line numbers (lines changed, added, etc.)
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    enabled = not vim.g.vscode,
    config = require('setup.blankline').setup,
  }, -- Adds a | to show indentation levels
  {
    'folke/todo-comments.nvim',
    enabled = not vim.g.vscode,
    config = require('setup.todo-comments').setup,
  }, -- todo comments helper
}
