return {
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		keys = {
			{
				"<leader>rn",
				function()
					return ":IncRename " .. vim.fn.expand("<cword>")
				end,
				desc = "Incremental rename",
				mode = "n",
				noremap = true,
				expr = true,
			},
		},
		config = function()
			require("inc_rename").setup()
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			local refactoring = require("refactoring")
			refactoring.setup()
			vim.keymap.set("x", "<leader>re", function()
				refactoring.refactor("Extract Function")
			end, { desc = "Extract function" })
			vim.keymap.set("x", "<leader>rf", function()
				refactoring.refactor("Extract Function To File")
			end, { desc = "Extract function to file" })
			vim.keymap.set("x", "<leader>rv", function()
				refactoring.refactor("Extract Variable")
			end, { desc = "Extract variable" })
			vim.keymap.set("n", "<leader>rI", function()
				refactoring.refactor("Inline Function")
			end, { desc = "Inline function" })
			vim.keymap.set({ "n", "x" }, "<leader>ri", function()
				refactoring.refactor("Inline Variable")
			end, { desc = "Inline variable" })
			vim.keymap.set("n", "<leader>rb", function()
				refactoring.refactor("Extract Block")
			end, { desc = "Extract block" })
			vim.keymap.set("n", "<leader>rbf", function()
				refactoring.refactor("Extract Block To File")
			end, { desc = "Extract block to file" })
		end,
	},
}
