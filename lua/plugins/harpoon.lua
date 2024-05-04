return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>ha", function()
			require("harpoon.mark").add_file()
		end, { desc = "Add mark" })
		local ui = require("harpoon.ui")
		vim.keymap.set("n", "<leader>hh", function()
			ui.toggle_quick_menu()
		end, { desc = "Open menu" })
		vim.keymap.set("n", "<leader>hn", function()
			ui.nav_next()
		end, { desc = "Open menu" })
		vim.keymap.set("n", "<leader>hp", function()
			ui.nav_prev()
		end, { desc = "Open menu" })

		for i = 1, 5 do
			vim.keymap.set("n", "<leader>h" .. i, function()
				ui.nav_file(i)
			end, { desc = "Go to mark " .. i })
		end
	end,
}
