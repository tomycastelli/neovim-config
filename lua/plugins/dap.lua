return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
			vim.keymap.set("n", "<leader>ds", function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end, { desc = "Open debugging sidebar" })
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("dap-go").setup()
			vim.keymap.set("n", "<leader>dgt", function()
				require("dap-go").debug_test()
			end, { desc = "Debug go test" })
			vim.keymap.set("n", "<leader>dgl", function()
				require("dap-go").debug_last()
			end, { desc = "Debug go test last" })
		end,
	},
	{
		"olexsmir/gopher.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
		ft = "go",
		config = function()
			require("gopher").setup()
			require("gopher.dap").setup()
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
}
