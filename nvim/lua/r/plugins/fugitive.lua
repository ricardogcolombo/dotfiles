return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<Leader>gc", ':Git commit -m ""<LEFT>')
		vim.keymap.set("n", "<Leader>gs", ":Git<CR>")
		vim.keymap.set("n", "<Leader>gpp", ":Git push<CR>")
		vim.keymap.set("n", "<Leader>gP", ":Git push -u origin HEAD<CR>")
	end,
}
