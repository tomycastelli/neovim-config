-- selene: allow(mixed_table)
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'VeryLazy',
    config = require('setup.treesitter').setup,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',     -- adds treesitter based text objects
      { 'nvim-treesitter/playground', enabled = false }, -- TS PLayground for creating queries
    },
  },                                                     -- enhancements in highlighting and virtual text
}

