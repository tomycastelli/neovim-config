return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local trouble = require("trouble")
		vim.keymap.set("n", "<leader>xx", function()
			trouble.toggle()
		end, { desc = "Open list" })
		vim.keymap.set("n", "<leader>xw", function()
			trouble.toggle("workspace_diagnostics")
		end, { desc = "Workspace diagnostics" })
		vim.keymap.set("n", "<leader>xd", function()
			trouble.toggle("document_diagnostics")
		end, { desc = "Document diagnostics" })
		vim.keymap.set("n", "<leader>xq", function()
			trouble.toggle("quickfix")
		end, { desc = "Quickfix" })
		vim.keymap.set("n", "<leader>xl", function()
			trouble.toggle("loclist")
		end, { desc = "Loclist" })
		vim.keymap.set("n", "gR", function()
			trouble.toggle("lsp_references")
		end, { desc = "LSP references" })
	end,
}
