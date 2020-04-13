" load Pluggins
"
call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes
" Group dependencies, vim-snippets depends on ultisnips
" search
Plug 'ludovicchabant/vim-gutentags'
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" tools
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle' ] } | Plug 'Xuyuanp/nerdtree-git-plugin' " file drawer
Plug 'tpope/vim-commentary'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'Raimondi/delimitMate' "auto close parenthesis,quotes..
Plug 't9md/vim-choosewin' "move between windows easily
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim' "editor Config files

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'leafgarland/typescript-vim'

" " Others
Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'neovim/node-client'

Plug 'nvie/vim-flake8'
Plug 'python-mode/python-mode',  { 'branch': 'develop' }

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
" Or latest tag
" Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'ycm-core/YouCompleteMe'
" Or build from source code by use yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()
