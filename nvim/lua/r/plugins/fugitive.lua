return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<Leader>gc", ':Git commit -m ""<LEFT>')
		vim.keymap.set("n", "<Leader>gs", ":Git<CR>")
	end,
}
