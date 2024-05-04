return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Find word" })
			vim.keymap.set("n", "<leader>fb", builtin.git_branches, { desc = "Switch git branches" })
			vim.keymap.set("n", "<leader>fs", builtin.git_status, { desc = "Show git status" })
			vim.keymap.set("n", "<leader>fd", builtin.lsp_document_symbols, { desc = "Find document symbols" })
			vim.keymap.set("n", "<leader>fc", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
				require("telescope").setup({
					defaults = {
						file_ignore_patterns = { "^vim_tmp/" },
					},
				})
			end, { desc = "Find config files" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
