return {
	"dyng/ctrlsf.vim",
	config = function()
		vim.keymap.set("n", "<C-F>f", ":CtrlSFVwordExec")
	end,
}
