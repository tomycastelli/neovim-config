local no_remap_opt = { noremap = true }
local silent_opt = { silent = true }
local no_remap_silent_opt = { noremap = true, silent = true }
local no_remap_silent_expr_opt = { noremap = true, silent = true, expr = true }
local harpoon = require("harpoon")

local keymap_table = {
  {
    shortcut = '<S-tab>',
    cmd = ':bnext<CR>',
    opts = no_remap_opt,
    description = 'Next buffer',
    enabled = true,
    modes = { 'n', 'x', 'o' }
  },
  {
    shortcut = 's',
    cmd = function()
      require('flash').jump()
    end,
    opts = no_remap_opt,
    modes = { 'n', 'x', 'o' },
    description = 'Flash',
    enabled = true,
  },
  {
    shortcut = 'S',
    cmd = function()
      require('flash').treesitter()
    end,
    opts = no_remap_opt,
    modes = { 'n', 'x', 'o' },
    description = 'Flash Treesitter',
    enabled = true,
  },
  {
    shortcut = 'r',
    cmd = function()
      require('flash').remote()
    end,
    opts = no_remap_opt,
    modes = { 'o' },
    description = 'Flash Remote',
    enabled = true,
  },
  {
    shortcut = 'R',
    cmd = function()
      require('flash').treesitter_search()
    end,
    opts = no_remap_opt,
    modes = { 'x', 'o' },
    description = 'Flash Treesitter Search',
    enabled = true,
  },
  {
    shortcut = ']c',
    cmd = function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        require('gitsigns').next_hunk()
      end)
      return '<Ignore>'
    end,
    opts = { expr = true },
    modes = { 'n' },
    description = 'Next git hunk',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '[c',
    cmd = function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        require('gitsigns').prev_hunk()
      end)
      return '<Ignore>'
    end,
    opts = { expr = true },
    modes = { 'n' },
    description = 'Previous git hunk',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '+',
    cmd = '<C-a>',
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Increment number',
    enabled = true,
  },
  {
    shortcut = '-',
    cmd = '<C-x>',
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Decrement number',
    enabled = true,
  },
  {
    shortcut = '<M-p>',
    cmd = function()
      require('telescope.builtin').buffers()
    end,
    opts = no_remap_silent_opt,
    modes = { 'n' },
    description = 'Open buffers',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<C-p>',
    cmd = function()
      require('telescope.builtin').find_files()
    end,
    opts = no_remap_silent_opt,
    modes = { 'n' },
    description = 'Open file in workspace',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<M-r>',
    cmd = ':e!<CR>',
    opts = no_remap_silent_opt,
    modes = { 'n' },
    description = 'Refresh buffer',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<M-t>',
    cmd = ':Trouble diagnostics toggle focus=true<CR>',
    opts = no_remap_silent_opt,
    modes = { 'n' },
    description = 'Show diagnostics pane',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = 'n',
    cmd = 'nzz',
    opts = no_remap_silent_opt,
    modes = { 'n' },
    description = 'Center search navigation',
    enabled = true,
  },
  {
    shortcut = 'p',
    cmd = '<Cmd>silent! normal! "_dP<CR>',
    opts = no_remap_opt,
    modes = { 'x' },
    description = "Smarter Paste in Visual (won't yank deleted content)",
    enabled = true,
  },
  {
    shortcut = 'dd',
    cmd = function()
      if vim.api.nvim_get_current_line():match('^%s*$') then
        return '"_dd'
      else
        return 'dd'
      end
    end,
    opts = no_remap_silent_expr_opt,
    modes = { 'n' },
    description = "Smarter DD (empty lines won't be yanked)",
    enabled = true,
  },
  {
    shortcut = 'N',
    cmd = 'Nzz',
    opts = no_remap_silent_opt,
    modes = { 'n' },
    description = 'Center search navigation',
    enabled = true,
  },
  {
    shortcut = '*',
    cmd = '*zz',
    opts = no_remap_silent_opt,
    modes = { 'n' },
    description = 'Center search navigation',
    enabled = true,
  },
  {
    shortcut = '#',
    cmd = '#zz',
    opts = no_remap_silent_opt,
    modes = { 'n' },
    description = 'Center search navigation',
    enabled = true,
  },
  {
    shortcut = 'g*',
    cmd = 'g*zz',
    opts = no_remap_silent_opt,
    modes = { 'n' },
    description = 'Center search navigation',
    enabled = true,
  },
  {
    shortcut = '?',
    cmd = '?\\v',
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Improve search',
    enabled = true,
  },
  {
    shortcut = '/',
    cmd = '/\\v',
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Improve search',
    enabled = true,
  },
  {
    shortcut = '\\',
    cmd = '/@',
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Improve search',
    enabled = true,
  },
  {
    shortcut = '%s/',
    cmd = '%sm/',
    opts = no_remap_opt,
    modes = { 'c' },
    description = 'Improve search',
    enabled = true,
  },
  {
    shortcut = '<C-x>',
    cmd = ':lua MiniBufremove.delete()<CR>',
    opts = no_remap_silent_opt,
    modes = { 'n' },
    description = 'Close current buffer',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<leader>q',
    cmd = ':lua MiniBufremove.delete()<CR>',
    opts = no_remap_silent_opt,
    modes = { 'n' },
    description = 'Close current buffer',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<leader>e',
    cmd = '<CMD>Oil<CR>',
    description = 'File explorer',
    opts = no_remap_silent_opt,
    modes = { 'n' },
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<C-g>',
    cmd = ':nohlsearch<CR>',
    opts = no_remap_silent_opt,
    modes = { 'n', 'v' },
    description = 'Clear search',
    enabled = true,
  },
  {
    shortcut = 'H',
    cmd = '^',
    opts = {},
    modes = { 'n', 'v' },
    description = 'Jump to start of the line',
    enabled = true,
  },
  {
    shortcut = 'L',
    cmd = '$',
    opts = {},
    modes = { 'n', 'v' },
    description = 'Jump to end of the line',
    enabled = true,
  },
  {
    shortcut = '<C-h>',
    cmd = '<Left>',
    opts = no_remap_opt,
    modes = { 'i', 'c' },
    description = 'Move cursor left',
    enabled = true,
  },
  {
    shortcut = '<C-j>',
    cmd = '<Down>',
    opts = no_remap_opt,
    modes = { 'i', 'c' },
    description = 'Move cursor down',
    enabled = true,
  },
  {
    shortcut = '<C-k>',
    cmd = '<Up>',
    opts = no_remap_opt,
    modes = { 'i', 'c' },
    description = 'Move cursor up',
    enabled = true,
  },
  {
    shortcut = '<C-l>',
    cmd = '<Right>',
    opts = no_remap_opt,
    modes = { 'i', 'c' },
    description = 'Move cursor right',
    enabled = true,
  },
  {
    shortcut = '<C-h>',
    cmd = '<C-w><left>',
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Focus on window to the left',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<C-l>',
    cmd = '<C-w><right>',
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Focus on window to the right',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<C-k>',
    cmd = '<C-w><up>',
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Focus on window up',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<C-j>',
    cmd = '<C-w><down>',
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Focus on window down',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<right>',
    cmd = '<CMD>vertical resize +2<CR>',
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Increase window width',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<left>',
    cmd = '<CMD>vertical resize -2<CR>',
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Decrease window width',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<up>',
    cmd = '<CMD>resize -2<CR>',
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Increase window height',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<down>',
    cmd = '<CMD>resize +2<CR>',
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Decrease window height',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<C-d>',
    cmd = '<C-o>x',
    opts = no_remap_opt,
    modes = { 'i' },
    description = 'Delete char forward in insert mode',
    enabled = true,
  },
  {
    shortcut = '<C-s>',
    cmd = ':wa<CR>',
    opts = no_remap_silent_opt,
    modes = { 'n' },
    description = 'Savel all',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<C-s>',
    cmd = '<C-o>:wa<CR>',
    opts = no_remap_silent_opt,
    modes = { 'i' },
    description = 'Savel all',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '[g',
    cmd = vim.diagnostic.goto_prev,
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Go to previous diagnostic',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = ']g',
    cmd = vim.diagnostic.goto_next,
    opts = no_remap_opt,
    modes = { 'n' },
    description = 'Go to next diagnostic',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = 'gx',
    cmd = '<CMD>Browse<CR>',
    opts = silent_opt,
    modes = { 'n', 'x' },
    description = 'Open links in browser',
    enabled = true,
  },
  {
    shortcut = 'gD',
    cmd = vim.lsp.buf.declaration,
    opts = silent_opt,
    modes = { 'n' },
    description = 'Go to declaration',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = 'gt',
    cmd = vim.lsp.buf.type_definition,
    opts = silent_opt,
    modes = { 'n' },
    description = 'Go to type definition',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = 'gd',
    cmd = vim.lsp.buf.definition,
    opts = silent_opt,
    modes = { 'n' },
    description = 'Go to definition',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = 'gi',
    cmd = vim.lsp.buf.implementation,
    opts = silent_opt,
    modes = { 'n' },
    description = 'Go to implementation',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = 'gr',
    cmd = function()
      vim.lsp.buf.references({ includeDeclaration = false })
    end,
    opts = silent_opt,
    modes = { 'n' },
    description = 'Find references',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<M-s>',
    cmd = vim.lsp.buf.signature_help,
    opts = silent_opt,
    modes = { 'i' },
    description = 'Signature help',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<M-s>',
    cmd = vim.lsp.buf.signature_help,
    opts = silent_opt,
    modes = { 'n' },
    description = 'Signature help',
    enabled = not vim.g.vscode,
  },
  -- call twice make the cursor go into the float window. good for navigating big docs
  {
    shortcut = 'K',
    cmd = vim.lsp.buf.hover,
    opts = silent_opt,
    modes = { 'n' },
    description = 'Show hover popup',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<M-f>',
    cmd = function()
      vim.lsp.buf.format({ async = false })
    end,
    opts = silent_opt,
    modes = { 'n' },
    description = 'Format code',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<F4>',
    cmd = function()
      require('dap').repl.toggle()
    end,
    opts = silent_opt,
    modes = { 'n' },
    description = 'DAP Toggle repl',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<F5>',
    cmd = function()
      require('dap').continue()
    end,
    opts = silent_opt,
    modes = { 'n' },
    description = 'DAP Continue',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<S-F5>',
    cmd = function()
      require('dap').close()
    end,
    opts = silent_opt,
    modes = { 'n' },
    description = 'DAP Stop',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<C-F5>',
    cmd = function()
      require('dap').run_last()
    end,
    opts = silent_opt,
    modes = { 'n' },
    description = 'DAP Run last',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<F6>',
    cmd = function()
      require('dap').pause()
    end,
    opts = silent_opt,
    modes = { 'n' },
    description = 'DAP Pause',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<F9>',
    cmd = function()
      require('dap').toggle_breakpoint()
    end,
    opts = silent_opt,
    modes = { 'n' },
    description = 'DAP Toggle breakpoint',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<S-F9>',
    cmd = function()
      require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end,
    opts = silent_opt,
    modes = { 'n' },
    description = 'DAP Set breakpoint with condition',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<C-F9>',
    cmd = function()
      require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end,
    opts = silent_opt,
    modes = { 'n' },
    description = 'DAP Set logpoint',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<F10>',
    cmd = function()
      require('dap').step_over()
    end,
    opts = silent_opt,
    modes = { 'n' },
    description = 'DAP Step over',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<S-F10>',
    cmd = function()
      require('dap').run_to_cursor()
    end,
    opts = silent_opt,
    modes = { 'n' },
    description = 'DAP Run to cursor',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<F11>',
    cmd = function()
      require('dap').step_into()
    end,
    opts = silent_opt,
    modes = { 'n' },
    description = 'DAP Step into',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<S-F11>',
    cmd = function()
      require('dap').step_out()
    end,
    opts = silent_opt,
    modes = { 'n' },
    description = 'DAP Step out',
    enabled = not vim.g.vscode,
  },
  {
    shortcut = '<F7>',
    cmd = function()
      require('dap.ui.widgets').hover()
    end,
    opts = silent_opt,
    modes = { 'x' },
    description = 'DAP Hover',
    enabled = not vim.g.vscode,
  },
}

return {
  keymap_table = keymap_table,
  which_key = {
    {
      mode = { "v" },
      { "<leader>c", '"*y',              desc = "Copy selection to system clipboard", remap = false },
      { "<leader>h", group = "Gitsigns", remap = false },
      {
        "<leader>hr",
        function()
          require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end,
        desc = "Reset Hunk",
        remap = false
      },
      {
        "<leader>hs",
        function()
          require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end,
        desc = "Stage Hunk",
        remap = false
      },
      { "<leader>l",  group = "LSP",                                                          remap = false },
      { "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<CR>",                         desc = "Range Code Action", remap = false },
      { "<leader>n",  group = "Refactoring",                                                  remap = false },
      { "<leader>ne", ":Refactor extract",                                                    desc = "Extract",           remap = false },
      { "<leader>nf", ":Refactor extract_to_file ",                                           desc = "Extract to file",   remap = false },
      { "<leader>ni", ":Refactor inline_var",                                                 desc = "Inline Variable",   remap = false },
      { "<leader>np", '<cmd>lua require("refactoring").debug.print_var()<CR>',                desc = "Print Variable",    remap = false },
      { "<leader>nr", '<cmd>lua require("telescope").extensions.refactoring.refactors()<CR>', desc = "Refactors",         remap = false },
      { "<leader>nv", ":Refactor extract_var ",                                               desc = "Extract Variable",  remap = false },
    },
    {
      mode = { "n" },
      { "<leader>d",  group = "Debug",                                                       remap = false },
      { "<leader>db", '<cmd>lua require("telescope").extensions.dap.list_breakpoints()<CR>', desc = "Breakpoints",    remap = false },
      { "<leader>dc", '<cmd>lua require("telescope").extensions.dap.commands()<CR>',         desc = "Commands",       remap = false },
      { "<leader>df", '<cmd>lua require("telescope").extensions.dap.configurations()<CR>',   desc = "Configurations", remap = false },
      { "<leader>dr", '<cmd>lua require("telescope").extensions.dap.frames()<CR>',           desc = "Frames",         remap = false },
      { "<leader>dv", '<cmd>lua require("telescope").extensions.dap.variables()<CR>',        desc = "Variables",      remap = false },
      { "<leader>f",  group = "File",                                                        remap = false },
      { "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<CR>',                 desc = "Buffers",        remap = false },
      {
        "<leader>fc",
        function()
          require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Neovim config files",
        remap = false
      },
      { "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<CR>',                   desc = "Files",                     remap = false },
      { "<leader>fo", '<cmd>lua require("telescope.builtin").oldfiles()<CR>',                     desc = "Prev Open Files",           remap = false },
      { "<leader>fr", '<cmd>lua require("telescope.builtin").registers()<CR>',                    desc = "Registers",                 remap = false },
      { "<leader>fw", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>', desc = "File Browser",              remap = false },
      { "<leader>g",  group = "Git",                                                              remap = false },
      { "<leader>gb", '<cmd>lua require("telescope.builtin").git_branches()<CR>',                 desc = "Branches",                  remap = false },
      { "<leader>gc", '<cmd>lua require("telescope.builtin").git_commits()<CR>',                  desc = "Commit Log",                remap = false },
      { "<leader>gd", ":DiffviewOpen<CR>",                                                        desc = "Open Diff View",            remap = false },
      { "<leader>ge", ":DiffviewFocusFiles<CR>",                                                  desc = "Diff View Focus Files",     remap = false },
      { "<leader>gf", '<cmd>lua require("telescope.builtin").git_files()<CR>',                    desc = "Files",                     remap = false },
      { "<leader>gh", ":DiffviewFileHistory<CR>",                                                 desc = "Diff View File History",    remap = false },
      { "<leader>gl", '<cmd>lua require("telescope.builtin").git_bcommits()<CR>',                 desc = "Commit Log Current Buffer", remap = false },
      { "<leader>gr", ":DiffviewRefresh<CR>",                                                     desc = "Diff View Refresh",         remap = false },
      { "<leader>gs", '<cmd>lua require("telescope.builtin").git_status()<CR>',                   desc = "Status",                    remap = false },
      { "<leader>gt", '<cmd>lua require("telescope.builtin").git_stash()<CR>',                    desc = "Stash",                     remap = false },
      { "<leader>gx", ":DiffviewClose<CR>",                                                       desc = "Close Diff View",           remap = false },
      { "<leader>h",  group = "Harpoon",                                                          remap = false },
      {
        "<leader>h1",
        function()
          harpoon:list():select(1)
        end,
        desc = "Go to 1",
        remap = false
      },
      {
        "<leader>h2",
        function()
          harpoon:list():select(2)
        end,
        desc = "Go to 2",
        remap = false
      },
      {
        "<leader>h3",
        function()
          harpoon:list():select(3)
        end,
        desc = "Go to 3",
        remap = false
      },
      {
        "<leader>h4",
        function()
          harpoon:list():select(4)
        end,
        desc = "Go to 4",
        remap = false
      },
      {
        "<leader>h5",
        function()
          harpoon:list():select(5)
        end,
        desc = "Go to 5",
        remap = false
      },
      {
        "<leader>ha",
        function()
          harpoon:list():add()
        end,
        desc = "Add to list",
        remap = false
      },
      { "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Toggle quick menu", remap = false },
      { "<leader>hj", function() harpoon:list():next() end,                        desc = "Next file",         remap = false },
      { "<leader>hk", function() harpoon:list():prev() end,                        desc = "Prev file",         remap = false },
      { "<leader>l",  group = "LSP",                                               remap = false },
      {
        "<leader>la",
        function()
          require("fastaction").code_action()
        end,
        desc = "Code Actions",
        remap = false
      },
      { "<leader>lb", function() vim.diagnostic.open_float({ focusable = false }) end,                                               desc = "Show line diagnostics",             remap = false },
      {
        "<leader>lc",
        function()
          vim.b.autoformat = not vim.b.autoformat
        end,
        desc = "Toggle autoformat",
        remap = false
      },
      { "<leader>ld", '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>',                                                 desc = "Definitions",                       remap = false },
      { "<leader>le", '<cmd>lua require("telescope.builtin").treesitter()<CR>',                                                      desc = "Treesitter",                        remap = false },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = false })<CR>",                                                          desc = "Format",                            remap = false },
      { "<leader>lg", '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<CR>',                                        desc = "Document Diagnostics",              remap = false },
      { "<leader>li", '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>',                                             desc = "Implementations",                   remap = false },
      { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<CR>",                                                                         desc = "Code Lens",                         remap = false },
      { "<leader>lm", "<cmd>lua vim.lsp.buf.rename()<CR>",                                                                           desc = "Rename symbol",                     remap = false },
      { "<leader>lo", '<cmd>lua require("telescope.builtin").diagnostics()<CR>',                                                     desc = "Workspace Diagnostics",             remap = false },
      { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",                                                               desc = "Diagnostic set loclist",            remap = false },
      { "<leader>lr", '<cmd>lua require("telescope.builtin").lsp_references()<CR>',                                                  desc = "References",                        remap = false },
      { "<leader>ls", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>',                                            desc = "Document Symbols",                  remap = false },
      { "<leader>lt", '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>',                                            desc = "Type Definitions",                  remap = false },
      { "<leader>lv", '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>',                                   desc = "Dynamic Workspace Symbols",         remap = false },
      { "<leader>lw", '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>',                                           desc = "Workspace Symbols",                 remap = false },
      { "<leader>n",  group = "Refactoring",                                                                                         remap = false },
      { "<leader>nI", ":Refactor inline_func",                                                                                       desc = "Inline Function",                   remap = false },
      { "<leader>nb", ":Refactor extract_block",                                                                                     desc = "Extract Block",                     remap = false },
      { "<leader>nc", '<cmd>lua require("refactoring").debug.cleanup({})<CR>',                                                       desc = "Cleanup",                           remap = false },
      { "<leader>nf", ":Refactor extract_block_to_file",                                                                             desc = "Extract Block to File",             remap = false },
      { "<leader>ni", ":Refactor inline_var",                                                                                        desc = "Inline Variable",                   remap = false },
      { "<leader>np", '<cmd>lua require("refactoring").debug.printf()<CR>',                                                          desc = "Printf",                            remap = false },
      { "<leader>nr", '<cmd>lua require("telescope").extensions.refactoring.refactors()<CR>',                                        desc = "Refactors",                         remap = false },
      { "<leader>nv", '<cmd>lua require("refactoring").debug.print_var()<CR>',                                                       desc = "Print Variable",                    remap = false },
      { "<leader>o",  group = "Overseer",                                                                                            remap = false },
      { "<leader>oa", ":OverseerTaskAction<CR>",                                                                                     desc = "Select a task to run an action on", remap = false },
      { "<leader>ob", ":OverseerBuild<CR>",                                                                                          desc = "Open task builder",                 remap = false },
      { "<leader>oc", ":OverseerRunCmd<CR>",                                                                                         desc = "Run shell command",                 remap = false },
      { "<leader>od", ":OverseerDeleteBundle<CR>",                                                                                   desc = "Delete",                            remap = false },
      { "<leader>ol", ":OverseerLoadBundle<CR>",                                                                                     desc = "Load",                              remap = false },
      { "<leader>oq", ":OverseerQuickAction<CR>",                                                                                    desc = "Run action on a task",              remap = false },
      { "<leader>or", ":OverseerRun<CR>",                                                                                            desc = "Run task",                          remap = false },
      { "<leader>os", ":OverseerSaveBundle<CR>",                                                                                     desc = "Save",                              remap = false },
      { "<leader>p",  group = "Grep",                                                                                                remap = false },
      { "<leader>pg", '<cmd>lua require("telescope.builtin").grep_string()<CR>',                                                     desc = "Grep String",                       remap = false },
      { "<leader>pl", '<cmd>lua require("telescope.builtin").live_grep()<CR>',                                                       desc = "Live Grep",                         remap = false },
      { "<leader>pr", '<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>',                                desc = "Live Grep Raw",                     remap = false },
      { "<leader>ps", ":Spectre<CR>",                                                                                                desc = "Spectre",                           remap = false },
      { "<leader>pw", '<cmd>lua require("spectre").open_visual({select_word = true})<CR>',                                           desc = "Spectre Current Word",              remap = false },
      { "<leader>r",  group = "Rust",                                                                                                remap = false },
      { "<leader>ra", ":RustLsp hover actions<CR>",                                                                                  desc = "Hover Actions",                     remap = false },
      { "<leader>rb", ":RustLsp moveItem down<CR>",                                                                                  desc = "Move Item Down",                    remap = false },
      { "<leader>rc", ":RustLsp openCargo<CR>",                                                                                      desc = "Open Cargo.toml",                   remap = false },
      { "<leader>rd", ":RustLsp debuggables<CR>",                                                                                    desc = "Debuggables",                       remap = false },
      { "<leader>re", ":RustLsp explainError<CR>",                                                                                   desc = "Explain Error",                     remap = false },
      { "<leader>rg", ":RustLsp crateGraph<CR>",                                                                                     desc = "View Crate Graph",                  remap = false },
      { "<leader>rh", ":RustLsp hover range<CR>",                                                                                    desc = "Range Hover Actions",               remap = false },
      { "<leader>rj", ":RustLsp joinLines<CR>",                                                                                      desc = "Join Lines",                        remap = false },
      { "<leader>rm", ":RustLsp expandMacro<CR>",                                                                                    desc = "Expand Macro",                      remap = false },
      { "<leader>rp", ":RustLsp parentModule<CR>",                                                                                   desc = "Parent Module",                     remap = false },
      { "<leader>rr", ":RustLsp runnables<CR>",                                                                                      desc = "Runnables",                         remap = false },
      { "<leader>rs", ":RustLsp syntaxTree<CR>",                                                                                     desc = "View Syntax Tree",                  remap = false },
      { "<leader>rt", '<cmd>require("setup.toggleterm").run_float("cargo test")<CR>',                                                desc = "Run tests",                         remap = false },
      { "<leader>ru", ":RustLsp moveItem up<CR>",                                                                                    desc = "Move Item Up",                      remap = false },
      { "<leader>s",  group = "Shell",                                                                                               remap = false },
      { "<leader>sa", ":ToggleTermOpenAll<CR>",                                                                                      desc = "Open All",                          remap = false },
      { "<leader>sc", ":ToggleTermCloseAll<CR>",                                                                                     desc = "Open All",                          remap = false },
      { "<leader>sf", ":ToggleTerm direction=float<CR>",                                                                             desc = "Float",                             remap = false },
      { "<leader>sh", ":ToggleTerm direction=horizontal<CR>",                                                                        desc = "Horizontal",                        remap = false },
      { "<leader>sv", ":ToggleTerm direction=vertical<CR>",                                                                          desc = "Vertical",                          remap = false },
      { "<leader>t",  group = "Telescope",                                                                                           remap = false },
      { "<leader>tc", '<cmd>lua require("telescope.builtin").builtin()<CR>',                                                         desc = "Builtin Pickers",                   remap = false },
      { "<leader>th", '<cmd>lua require("telescope.builtin").reloader()<CR>',                                                        desc = "Reload Lua Modules",                remap = false },
      { "<leader>tm", '<cmd>lua require("telescope.builtin").resume()<CR>',                                                          desc = "Resume Last Picker",                remap = false },
      { "<leader>tn", ":Noice telescope<CR>",                                                                                        desc = "Noice history",                     remap = false },
      { "<leader>tr", '<cmd>lua require("telescope.builtin").pickers()<CR>',                                                         desc = "Previous Pickers",                  remap = false },
      { "<leader>ts", '<cmd>lua require("telescope.builtin").planets()<CR>',                                                         desc = "Use Telescope...",                  remap = false },
      { "<leader>ty", '<cmd>lua require("telescope.builtin").symbols({"emoji", "kaomoji", "gitmoji", "julia", "math", "nerd"})<CR>', desc = "List Symbols",                      remap = false },
      { "<leader>v",  group = "Vim",                                                                                                 remap = false },
      { "<leader>va", '<cmd>lua require("telescope.builtin").autocommands()<CR>',                                                    desc = "Autocommands",                      remap = false },
      { "<leader>vc", '<cmd>lua require("telescope.builtin").commands()<CR>',                                                        desc = "Commands",                          remap = false },
      { "<leader>ve", '<cmd>lua require("telescope.builtin").spell_suggest()<CR>',                                                   desc = "Spell Suggestions",                 remap = false },
      { "<leader>vh", '<cmd>lua require("telescope.builtin").command_history()<CR>',                                                 desc = "Command History",                   remap = false },
      { "<leader>vj", '<cmd>lua require("telescope.builtin").jumplist()<CR>',                                                        desc = "Jump List",                         remap = false },
      { "<leader>vk", '<cmd>lua require("telescope.builtin").marks()<CR>',                                                           desc = "Marks",                             remap = false },
      { "<leader>vl", '<cmd>lua require("telescope.builtin").loclist()<CR>',                                                         desc = "Location List",                     remap = false },
      { "<leader>vm", '<cmd>lua require("telescope.builtin").man_pages()<CR>',                                                       desc = "Man Pages",                         remap = false },
      { "<leader>vo", '<cmd>lua require("telescope.builtin").colorscheme()<CR>',                                                     desc = "Colorscheme",                       remap = false },
      { "<leader>vp", '<cmd>lua require("telescope.builtin").vim_options()<CR>',                                                     desc = "Vim Options",                       remap = false },
      { "<leader>vq", '<cmd>lua require("telescope.builtin").quickfix()<CR>',                                                        desc = "Quickfix List",                     remap = false },
      { "<leader>vr", '<cmd>lua require("telescope.builtin").registers()<CR>',                                                       desc = "Registers",                         remap = false },
      { "<leader>vs", '<cmd>lua require("telescope.builtin").search_history()<CR>',                                                  desc = "Search History",                    remap = false },
      { "<leader>vy", '<cmd>lua require("telescope.builtin").keymaps()<CR>',                                                         desc = "Normal Mode Keymaps",               remap = false },
      { "<leader>z",  group = "Gitsigns",                                                                                            remap = false },
      { "<leader>zB", '<cmd>lua require("gitsigns").blame_line({full=true, ignore_whitespace = true})<CR>',                          desc = "Blame line",                        remap = false },
      { "<leader>zR", ":Gitsigns reset_buffer<CR>",                                                                                  desc = "Reset buffer",                      remap = false },
      { "<leader>zS", ":Gitsigns stage_buffer<CR>",                                                                                  desc = "Stage buffer",                      remap = false },
      { "<leader>zb", ":Gitsigns toggle_current_line_blame<CR>",                                                                     desc = "Toggle blame current line",         remap = false },
      { "<leader>zd", ":Gitsigns diffthis<CR>",                                                                                      desc = "Diff this",                         remap = false },
      { "<leader>zp", ":Gitsigns preview_hunk<CR>",                                                                                  desc = "Preview hunk",                      remap = false },
      { "<leader>zr", ":Gitsigns reset_hunk<CR>",                                                                                    desc = "Reset hunk",                        remap = false },
      { "<leader>zs", ":Gitsigns stage_hunk<CR>",                                                                                    desc = "Stage hunk",                        remap = false },
      { "<leader>zt", ":Gitsigns toggle_deleted<CR>",                                                                                desc = "Toggle deleted hunks",              remap = false },
      { "<leader>zu", ":Gitsigns undo_stage_hunk<CR>",                                                                               desc = "Undo stage hunk",                   remap = false },
    }
  },
  map_keys = function()
    for _, keymap in pairs(keymap_table) do
      if keymap.enabled then
        local opts = vim.tbl_extend('force', { desc = keymap.description }, keymap.opts)
        vim.keymap.set(keymap.modes, keymap.shortcut, keymap.cmd, opts)
      end
    end
  end,
}
