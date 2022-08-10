require('settings')
require('plugins')



require'lspconfig'.tsserver.setup{}

require('keymappings')
require('telescope')
require('lsp_lua')
require('choosewin')

vim.api.nvim_set_keymap('n', '<Leader><Tab>', ':ChooseWin<CR>', { noremap = true, silent = true })
require("mason").setup()



require("lang")
vim.cmd('source $HOME/.config/nvim/lua/old.vim')

vim.cmd('source $HOME/.config/nvim/lua/vim_modules/easymotion.vim')

vim.cmd('source $HOME/.config/nvim/lua/vim_modules/fzf.vim')

vim.cmd('source $HOME/.config/nvim/lua/vim_modules/ctrlsf.vim')

vim.cmd('source $HOME/.config/nvim/lua/vim_modules/git.vim')

vim.cmd('source $HOME/.config/nvim/lua/vim_modules/autocomplete.vim')

vim.cmd('source $HOME/.config/nvim/lua/vim_modules/numbers.vim')

vim.cmd('set background=dark')
