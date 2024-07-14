-- selene: allow(mixed_table)
return {
  {
    'williamboman/mason.nvim', -- lsp server installer
    enabled = not vim.g.vscode,
    event = 'VeryLazy',
    config = function()
      require('mason').setup()
    end,
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
  },
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    enabled = not vim.g.vscode,
    config = function()
      local lspconfig = require('setup.lsp')
      local conf = lspconfig.setup()
      lspconfig.config_defaults()
      require('setup.lsp.lua').setup(conf, lspconfig.capabilities(), lspconfig.on_attach)
    end,
  }, -- collection of LSP configurations for nvim
  {
    'nvimtools/none-ls.nvim',
    event = 'VeryLazy',
    enabled = not vim.g.vscode,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'ThePrimeagen/refactoring.nvim', -- provide refactoring actions
    },
    config = function()
      local lspconfig = require('setup.lsp')
      require('setup.lsp.none-ls').setup(lspconfig.on_attach)
    end,
  }, -- can be useful to integrate with non LSP sources like eslint
  {
    'mrcjkb/rustaceanvim',
    enabled = not vim.g.vscode,
    ft = { 'rust' },
    config = function() -- check https://github.com/vxpm/ferris.nvim
      local lspconfig = require('setup.lsp')
      local settings = require('setup.lsp.rust').setup(lspconfig.capabilities(), lspconfig.on_attach)
      vim.g.rustaceanvim = settings
    end,
  }, -- rust enhancements
  {
    'pmizio/typescript-tools.nvim',
    enabled = not vim.g.vscode,
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    config = function()
      local lspconfig = require('setup.lsp')
      require('setup.lsp.typescript').setup(lspconfig.capabilities(), lspconfig.on_attach)
    end, -- typescript enhancements
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = { path = "luvit-meta/library", words = { "vim%.uv" } },
    },
    dependencies = {
      { 'Bilal2453/luvit-meta', lazy = true },
    },
  }, -- utility to make neovim config better
}
