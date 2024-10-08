-- selene: allow(mixed_table)
return {
  {
    'bennypowers/nvim-regexplainer',
    enabled = not vim.g.vscode,
    cmd = { 'RegexplainerShowSplit', 'RegexplainerShowPopup', 'RegexplainerToggle', 'RegexplainerYank' },
  }, -- shows popup explaining regex under cursor
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = require('setup.nvim-tree').setup,
  }, -- file browser. eventually should replace neo-tree
  {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    enabled = not vim.g.vscode,
    config = require('setup.toggleterm').setup,
  }, -- better terminal
  {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    enabled = not vim.g.vscode,
    config = require('setup.oil').setup,
  }, -- file browser. eventually should replace neo-tree
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    enabled = not vim.g.vscode,
    dependencies = { -- pickers
      'gbrlsnchs/telescope-lsp-handlers.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'nvim-telescope/telescope-live-grep-raw.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-symbols.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = require('setup.telescope').setup,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('harpoon').setup()
    end
  },
  {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    config = function()
      require('crates').setup()
    end,
  }
}
