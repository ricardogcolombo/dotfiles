return {
	"t9md/vim-choosewin",
	config = function()
		local indent = 4

		-- import comment plugin safely

		vim.api.nvim_set_keymap("n", "<Leader><Tab>", ":ChooseWin<CR>", { noremap = true, silent = true })
		local utils = require("utils")

		utils.opt("b", "expandtab", true)
		utils.opt("b", "shiftwidth", indent)
		utils.opt("b", "smartindent", true)
		utils.opt("b", "tabstop", indent)
		utils.opt("o", "hidden", true)
		utils.opt("o", "ignorecase", true)
		utils.opt("o", "scrolloff", 4)
		utils.opt("o", "shiftround", true)
		utils.opt("o", "smartcase", true)
		utils.opt("o", "splitbelow", true)
		utils.opt("o", "splitright", true)
		utils.opt("o", "wildmode", "list:longest")
		utils.opt("w", "number", true)
		utils.opt("w", "relativenumber", true)
		utils.opt("o", "clipboard", "unnamed,unnamedplus")
	end,
}
