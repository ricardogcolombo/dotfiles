return {
	"dyng/ctrlsf.vim",
	config = function()
		vim.keymap.set("n", "<C-F>f", "<cmd>CtrlSF<CR>", { desc = "CtrlSF search" })
	end,
}
