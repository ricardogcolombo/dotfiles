"
call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes
" Group dependencies, vim-snippets depends on ultisnips
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
Plug 'christoomey/vim-tmux-navigator'
" search
Plug 'ludovicchabant/vim-gutentags', { 'commit': '31c0ead' }
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'idanarye/vim-merginal'
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
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

Plug 'williamboman/nvim-lsp-installer'


Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" others
Plug 'neovim/node-client'
Plug 'python-mode/python-mode',  { 'branch': 'develop' }
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mileszs/ack.vim'
Plug 'vim-test/vim-test'
Plug 'skanehira/docker-compose.vim'
Plug 'tpope/vim-markdown'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
call plug#end()

