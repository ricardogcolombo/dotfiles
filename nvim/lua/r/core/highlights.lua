-- Highlight configurations converted from old.vim
local M = {}

function M.setup()
  -- Line number colors
  vim.cmd([[
    hi LineNr ctermfg=60 ctermbg=NONE cterm=NONE guifg=#6272a4 guibg=#282a36 gui=NONE
  ]])
  
  -- Normal background
  vim.cmd([[
    highlight Normal ctermbg=None
  ]])
  
  -- Color column
  vim.cmd([[
    highlight ColorColumn ctermbg=235 guibg=#2c2d27
  ]])
  
  -- Enable syntax
  vim.cmd("syntax enable")
  
  -- Enable filetype plugins
  vim.cmd("filetype plugin indent on")
end

return M

