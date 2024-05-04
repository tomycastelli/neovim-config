return { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {
    style = "night",
    terminal_colors = true,
  } ,
  config = function ()
    vim.cmd.colorscheme("tokyonight")
  end
}
