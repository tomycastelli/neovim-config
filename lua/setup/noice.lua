return {
  setup = function()
    require('notify').setup({
      fps = 60,
      render = 'wrapped-compact',
      stages = 'slide',
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.30)
      end,
    })
    require('noice').setup({
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true,            -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
        signature = {
          enabled = false,
        },
      },
      cmdline = {
        enabled = true,
        format = {
          search_down = { icon = ' ' },
          search_up = { icon = ' ' },
        },
      },
      commands = {
        nots = {
          view = 'split',
          opts = { enter = true, format = 'details' },
          filter = {
            any = {
              { event = 'notify' },
            },
          },
        },
      },
      routes = {
        {
          view = 'notify',
          filter = { event = 'msg_showmode' },
        },
        -- supress annoying messages
        {
          filter = {
            event = 'msg_show',
            find = '".*".*L,.*B',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = 'msg_show',
            find = 'second.? ago',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = 'msg_show',
            find = 'fewer lines',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = 'msg_show',
            find = 'written',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = 'msg_show',
            find = 'more lines',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = 'msg_show',
            find = 'yanked',
          },
          opts = { skip = true },
        },
      },
      views = {
        cmdline_popup = {
          border = {
            style = 'none',
            padding = { 1, 2 },
          },
          filter_options = {},
        },
      },
    })
  end,
  command_status = function(color)
    return {
      function()
        return require('noice').api.status.command.get()
      end,
      cond = function()
        return require('noice').api.status.command.has()
      end,
      color = { fg = color },
    }
  end,
}
