-- Load core configuration
require("r")

-- Load lazy.nvim plugin manager
require("lazy_config")
vim.opt.guifont = "OpenCode Nerd Font:h12" -- Use OpenCode GUI font 

-- Set colorscheme
vim.cmd("set background=dark")
vim.cmd("colorscheme catppuccin")
