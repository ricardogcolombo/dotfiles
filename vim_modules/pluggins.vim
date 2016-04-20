" load Pluggins
call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes
" Group dependencies, vim-snippets depends on ultisnips
" search
Plug 'dyng/ctrlsf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'

" Snippets and autocomplete
Plug 'Shougo/deoplete.nvim' "autocomplete
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/SyntaxComplete'
Plug 'ryanoasis/nerd-fonts'

"" latex
Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'
" Syntax
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'jelera/vim-javascript-syntax'
Plug 'scrooloose/syntastic'
Plug 'genoma/vim-less'
Plug 'othree/yajs.vim'
Plug 'JulesWang/css.vim'
Plug 'Konfekt/FastFold'
Plug 'SirVer/ultisnips'
Plug 'ricardogcolombo/vim-snippets'
Plug 'pangloss/vim-javascript'
Plug 'altercation/vim-colors-solarized'

" Jsdoc
Plug 'heavenshell/vim-jsdoc'
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle' ] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'gregsexton/gitv'
Plug 'mhinz/vim-grepper' "git grep

" nodejs
Plug 'moll/vim-node', { 'for': 'javascript' } " node support

" tmux support
Plug 'benmills/vimux' " tmux integration for vim

"Javascript Specific
Plug 'mxw/vim-jsx' " React
Plug 'yannickcr/eslint-plugin-react'
Plug 'jbgutierrez/vim-babel'
Plug 'carlitux/deoplete-ternjs'

" Format
Plug 'scrooloose/nerdcommenter' "Comment Code multiple languages support
Plug 'maksimr/vim-jsbeautify' "Javascript Format
Plug 'Raimondi/delimitMate' "auto close parenthesis,quotes..
Plug 'Chiel92/vim-autoformat'

" themes
Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline-themes'

" tools
Plug 'vim-airline/vim-airline'
Plug 'junegunn/vim-easy-align'
Plug 'mileszs/ack.vim'
Plug 't9md/vim-choosewin' "move between windows easily
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'sjl/gundo.vim' "tree of changes in buffer
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors' "edit multiple lines
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'editorconfig/editorconfig-vim' "editor Config files
Plug 'kshenoy/vim-signature' "show marks
Plug 'matze/vim-move' " traslade rows with arrows
Plug 'blindFS/vim-taskwarrior'

Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'Shougo/unite.vim'

" "vim
Plug 'tpope/vim-scriptease'
Plug 'dbakker/vim-lint'

Plug 'mattn/webapi-vim'


Plug 'szw/vim-tags'


Plug 'ryanoasis/vim-webdevicons'

call plug#end()
