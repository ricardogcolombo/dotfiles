set nocompatible
filetype off

"==================
" TAGBAR
"==================
let g:vim_tags_auto_generate = 1
set termguicolors

"==================
"AUTOFORMAT
"==================
map <Leader>2 :Prettier<cr>

"return to last edit position when opening files
autocmd BufReadPost *
            \ if line("'\'") > 0 && line("'\'") >  line("$") |
            \    exe "normal! g`\"" |
            \ endif

"==================
"Ack
"==================
let g:ackprg = 'ag --nogroup --nocolor --column'


" vim indent guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

let b:did_indent = 1

setlocal indentkeys=0{,0},!^F,o,O
setlocal nosmartindent

" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"
nmap  <Leader>ot :Lex<CR>
set background=dark

set tags=tags
"==================
"CONFIG
"==================
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set spell spelllang=en_us

" let g:rehash256 = 1
let g:used_javascript_libs = 'underscore,backbone,angularjs,react,flux,requirejs,angularuirouter,jasmine'
" set line number color
hi LineNr ctermfg=60 ctermbg=NONE cterm=NONE guifg=#6272a4 guibg=#282a36 gui=NONE

highlight Normal ctermbg=None
let base16colorspace=256  

set guifont=Menlo\ Regular:h11
set encoding=utf8
set fileencoding=utf-8
set fileencodings=utf-8
set foldmethod=indent
set nofoldenable
set bomb
set binary

syntax enable

set mouse=a
set clipboard=unnamed "clipboard issue with tmux and iterm
set nowrap " no use swp files

" search
set incsearch  "make search act like search in modern browsers
set hlsearch
set showmatch "show matching for ({[ "


"" Directories for swp files
set nobackup
set noswapfile   "noswap files

set tabstop=2   " size of a hard tabstop
set shiftwidth=2    " size of an "indent"
set softtabstop=4
set showtabline=2 " Always display the tabline, even if there is only one tab
set expandtab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changted outside vim
set matchpairs+=<:>  "HTML Editing
set viminfo^=% "open buffers on close
set cursorline
set cursorcolumn
set colorcolumn=80

"k if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" always show signcolumns
set signcolumn=yes


highlight ColorColumn ctermbg=235 guibg=#2c2d27


set relativenumber
set nu "number lines
set autochdir "Auto set dir

filetype plugin indent on
au BufNewFile,BufRead *.less set filetype=css


let g:vimrcPath = $MYVIMRC
let g:vimPath = system('realpath '.g:vimrcPath)
let g:vimDir = fnamemodify(g:vimPath, ':h')

"==================
"MAP KEYS
"==================
"
"map space to / search
nmap <Leader>s O<Esc>
nmap <CR> o<Esc>

"Copy paste to/from clipboard
vnoremap <C-c> "*y

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Move to the next buffer
nmap <leader>0 :bnext<CR>

" Delete Buffer and move to previous
nmap <leader><Bs> :bp <BAR> bd #<CR>

" Move to the previous buffer
nmap <leader>= :bprevious<CR>

let g:jsx_ext_required = 0
" esc from term in vim
tnoremap <ESC><ESC> <C-\><C-N>


"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'

let python_highlight_all = 1

set path+=**

set spelllang=en
set laststatus=2

nnoremap <S-t> :Lex<CR>

function! LightlineFilename()
    let filenameonly = expand('%:t:r')
    if filenameonly ==? "index"
        return remove(split(expand("%:h"), "/"), -1) . "/" . expand("%:t")
    else 
        return expand("%:t")
    endif
endfunction


augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup END


autocmd BufEnter * silent! lcd %:p:h

