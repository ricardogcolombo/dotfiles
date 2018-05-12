" load Pluggins
call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes
" Group dependencies, vim-snippets depends on ultisnips
" search
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'

" Snippets and autocomplete
Plug 'Shougo/deoplete.nvim' 
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'
Plug 'vim-scripts/SyntaxComplete'
"" latex
" Plug 'vim-latex/vim-latex' | Plug 'lervag/vimtex'
" Syntax
"
" Plug 'isRuslan/vim-es6', {'for': 'javascript'}
Plug 'sheerun/vim-polyglot'
" Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
" Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'scrooloose/syntastic'
" Plug 'genoma/vim-less'
Plug 'othree/yajs.vim'
" Plug 'JulesWang/css.vim'
" Plug 'Konfekt/FastFold'
Plug 'SirVer/ultisnips'
Plug 'ricardogcolombo/vim-snippets'
" Plug 'pangloss/vim-javascript'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'

" Jsdoc
" Plug 'heavenshell/vim-jsdoc', {'for': 'javascript'}
" git
" Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle' ] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
" Plug 'gregsexton/gitv'
" Plug 'mhinz/vim-grepper' "git grep

" nodejs
Plug 'moll/vim-node', { 'for': 'javascript' } " node support

" tmux support
" Plug 'benmills/vimux' " tmux integration for vim 
"Javascript Specific
" Plug 'mxw/vim-jsx' , {'for': 'jsx'}
" Plug 'yannickcr/eslint-plugin-react', {'for': 'jsx'}
" Plug 'jbgutierrez/vim-babel'
" Plug 'ternjs/tern_for_vim'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Format
Plug 'scrooloose/nerdcommenter'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'crusoexia/vim-javascript-lib'
Plug 'Raimondi/delimitMate' "auto close parenthesis,quotes..
Plug 'Chiel92/vim-autoformat'

" themes
" Plug 'ricardogcolombo/rtheme'
Plug 'vim-airline/vim-airline-themes'
" Plug 'tomasr/molokai'
" Plug 'crusoexia/vim-monokai'

" tools
Plug 'vim-airline/vim-airline'
" Plug 'mileszs/ack.vim'
Plug 't9md/vim-choosewin' "move between windows easily
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'sjl/gundo.vim' "tree of changes in buffer
Plug 'tpope/vim-surround'
" Plug 'terryma/vim-multiple-cursors' "edit multiple lines
" " Plug 'majutsushi/tagbar'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'editorconfig/editorconfig-vim' "editor Config files
" Plug 'kshenoy/vim-signature' "show marks
Plug 'matze/vim-move' " traslade rows with arrows

" " manage sessions 
" Plug 'tpope/vim-obsession'
" Plug 'dhruvasagar/vim-prosession'


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'
"vim
" Plug 'tpope/vim-scriptease'
" Plug 'dbakker/vim-lint'

" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" " Haskell
Plug 'lukerandall/haskellmode-vim', { 'for': 'haskell' }

" " Others
 Plug 'ryanoasis/vim-webdevicons'
" Plug 'ryanoasis/nerd-fonts'


" Plug 'mhinz/vim-startify'

Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'neovim/node-client'

" Plug 'ricardogcolombo/mdn_nvim', { 'do': './install.sh' }

Plug 'nvie/vim-flake8'
Plug 'python-mode/python-mode'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Plug 'ricardogcolombo/mdn',{ 'do': function('DoRemote') }
Plug 'rizzatti/dash.vim'
" Plug 'HendrikPetertje/vimify'
call plug#end()
