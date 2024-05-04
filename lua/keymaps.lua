local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-a>")

keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Keys
vim.keymap.set("n", "<leader>bo", ":tabnew<CR>", {})
vim.keymap.set("n", "<leader>q", ":bdelete<CR>", {})
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", {})
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", {})
