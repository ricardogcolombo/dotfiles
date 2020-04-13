" load Pluggins
"
call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes
" Group dependencies, vim-snippets depends on ultisnips
" search
" Plug 'xolox/vim-notes'
" Plug 'xolox/vim-misc'
" Snippets and autocomplete
" lug 'Shougo/deoplete.nvim' 
" Plug 'zchee/deoplete-jedi', {'for': 'python'}
" Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'
Plug 'ludovicchabant/vim-gutentags'
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
" Syntax
" Plug 'maksimr/vim-jsbeautify', {'for':'javascript'}
" Plug 'sheerun/vim-polyglot'
" Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
" Plug 'scrooloose/syntastic'
" Plug 'othree/yajs.vim' , {'for':'javascript'}
" Plug 'SirVer/ultisnips'
" Plug 'ricardogcolombo/vim-snippets'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle' ] } | Plug 'Xuyuanp/nerdtree-git-plugin' " file drawer
" python plugins
" Plug 'heavenshell/vim-pydocstring'
" Plug 'ambv/black'

" nodejs
" Plug 'moll/vim-node', { 'for': 'javascript' } " node support

" tmux support
" Plug 'benmills/vimux' " tmux integration for vim 
"
" Format
" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'Raimondi/delimitMate' "auto close parenthesis,quotes..
" Plug 'Chiel92/vim-autoformat'

" tools
Plug 't9md/vim-choosewin' "move between windows easily
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim' "editor Config files
" Plug 'matze/vim-move' " traslade rows with arrows

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'leafgarland/typescript-vim'

" " Others
 " Plug 'ryanoasis/vim-webdevicons'

Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'neovim/node-client'
" plug 'ricardogcolombo/mdn_nvim', {'do':'npm install'}

" Plug 'vimwiki/vimwiki'
" Plug 'ricardogcolombo/mdn_nvim', { 'do': 'npm --prefix ./rplugin/node/mdn_nvim/ install ' }

Plug 'Shougo/vimproc.vim',{'do' : 'make'}

" Plug 'idanarye/vim-vebugger'

Plug 'nvie/vim-flake8'
Plug 'python-mode/python-mode',  { 'branch': 'develop' }

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
" Plug 'HerringtonDarkholme/yats.vim'
  " Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" Or latest tag
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" Or build from source code by use yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()
