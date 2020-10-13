" load Pluggins
"
call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes
" Group dependencies, vim-snippets depends on ultisnips
" search
Plug 'ludovicchabant/vim-gutentags', { 'commit': '31c0ead' }
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" tools
Plug 'tpope/vim-commentary'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'Raimondi/delimitMate' "auto close parenthesis,quotes..
Plug 't9md/vim-choosewin' "move between windows easily
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim' "editor Config files

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" " Others
Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'neovim/node-client'
Plug 'python-mode/python-mode',  { 'branch': 'develop' }
" Plug 'ycm-core/YouCompleteMe'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'idanarye/vim-merginal'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
call plug#end()
