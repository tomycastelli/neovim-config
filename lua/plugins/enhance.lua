-- selene: allow(mixed_table)
return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    dependencies = { 'echasnovski/mini.nvim', version = false },
    config = function()
      local keymaps = require('setup.keymaps')
      keymaps.map_keys()
      require('setup.which-key').setup(keymaps.which_key)
    end,
  },                                                                      -- shows the keybindings in a floating window.
  { 'numToStr/Comment.nvim',  config = require('setup.comment').setup },  -- gcc to comment/uncomment line
  { 'kylechui/nvim-surround', config = require('setup.surround').setup }, -- add surround commands
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    config = require('setup.flash').setup,
  }, -- hop to different parts of the buffer with s + character
  {
    'Chaitanyabsprip/fastaction.nvim',
    event = "VeryLazy",
    config = function()
      require('fastaction').setup({
        dismiss_keys = { "j", "k", "<c-c>", "q", "<Esc>" },
      })
    end,
  }, -- sleek code actions
  {
    'booperlv/nvim-gomove',
    event = 'VeryLazy',
    config = function()
      require('gomove').setup()
    end,
  }, -- makes better line moving
  {
    'nvim-pack/nvim-spectre',
    enabled = not vim.g.vscode,
    cmd = 'Spectre',
    config = function()
      require('spectre').setup()
    end,
  }, -- special search and replace buffer
  {
    'echasnovski/mini.bufremove',
    enabled = not vim.g.vscode,
    version = false,
    config = function()
      require('mini.bufremove').setup()
    end,
  }, -- delete buffer and keep window layout
  {
    'echasnovski/mini.ai',
    version = false,
    config = function()
      require('mini.ai').setup()
    end,
  },                                                                 -- improves a and i motions
  { 'samjwill/nvim-unception', enabled = not vim.g.vscode },         -- prevents an instance of neovim to be openend within neovim
  { 'chrishrb/gx.nvim',        config = require('setup.gx').setup }, -- gx opens urls, github issues etc in the browser
}
