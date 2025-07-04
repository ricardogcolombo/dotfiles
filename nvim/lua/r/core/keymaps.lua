-- Key mappings converted from old.vim
local keymap = vim.keymap.set

-- Set leader key (assuming space as leader)
vim.g.mapleader = " "

-- Line manipulation
keymap("n", "<Leader>s", "O<Esc>", { desc = "Insert line above" })
keymap("n", "<CR>", "o<Esc>", { desc = "Insert line below" })

-- Copy to clipboard
keymap("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })

-- Disable arrow keys in insert and normal mode
keymap("i", "<Up>", "<NOP>", { desc = "Disable up arrow" })
keymap("i", "<Down>", "<NOP>", { desc = "Disable down arrow" })
keymap("i", "<Left>", "<NOP>", { desc = "Disable left arrow" })
keymap("i", "<Right>", "<NOP>", { desc = "Disable right arrow" })
keymap("n", "<Up>", "<NOP>", { desc = "Disable up arrow" })
keymap("n", "<Down>", "<NOP>", { desc = "Disable down arrow" })
keymap("n", "<Left>", "<NOP>", { desc = "Disable left arrow" })
keymap("n", "<Right>", "<NOP>", { desc = "Disable right arrow" })

-- Buffer navigation
keymap("n", "<leader>0", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<leader>=", ":bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<leader><BS>", ":bp <BAR> bd #<CR>", { desc = "Delete buffer and move to previous" })

-- Terminal escape
keymap("t", "<ESC><ESC>", "<C-\\><C-N>", { desc = "Escape from terminal" })

-- Completion mapping for Enter key
keymap("i", "<CR>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-y>"
	else
		return "<C-g>u<CR>"
	end
end, { expr = true, desc = "Smart enter for completion" })
