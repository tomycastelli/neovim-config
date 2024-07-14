return {
  setup = function(wk_table)
    local which_key = require('which-key')
    ---@class wk.Opts
    which_key.setup({
      preset = "modern",
      win = {
        title = false,
      },
      icons = {
        breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
        separator = '󰔰', -- symbol used between a key and it's label
        group = '󰊳 ', -- symbol
      },
    })
    which_key.add(wk_table)
  end,
}
