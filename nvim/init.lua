require('settings')
require('keymappings')

vim.cmd('source $HOME/.config/nvim/lua/old.vim')
vim.cmd('set background=dark')
local custom_onedark= require'lualine.themes.onedark'

-- Change the background of lualine_c section for normal mode
custom_onedark.normal.c.bg = '#112233'

require('lualine').setup({
 options = { theme  = custom_onedark }
 })

