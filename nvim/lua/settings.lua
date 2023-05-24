local utils = require('utils')

local cmd = vim.cmd
local indent = 4

--nmap  <Leader><TAB>  <Plug>(Choosewin)
--
utils.map('n', '<leader><TAB>', '<Plug>(Choosewin)') -- Clear highlights
--cmd 'syntax enable'
--cmd 'filetype plugin indent on'
--utils.opt('b', 'expandtab', true)
--utils.opt('b', 'shiftwidth', indent)
--utils.opt('b', 'smartindent', true)
--utils.opt('b', 'tabstop', indent)
--utils.opt('o', 'hidden', true)
--utils.opt('o', 'ignorecase', true)
--utils.opt('o', 'scrolloff', 4 )
--utils.opt('o', 'shiftround', true)
--utils.opt('o', 'smartcase', true)
--utils.opt('o', 'splitbelow', true)
--utils.opt('o', 'splitright', true)
--utils.opt('o', 'wildmode', 'list:longest')
--utils.opt('w', 'number', true)
--utils.opt('w', 'relativenumber', true)
--utils.opt('o', 'clipboard','unnamed,unnamedplus')
--
---- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

require('orgmode').setup_ts_grammar()

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
  -- highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    -- Required for spellcheck, some LaTex highlights and
    -- code block highlights that do not have ts grammar
    additional_vim_regex_highlighting = {'org'},
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/org/*' },
  org_default_notes_file = '~/org/refile.org',
})

