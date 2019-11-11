"==================
"CONFIG
"==================
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let mapleader=" "
nnoremap ; :

let g:dracula_colorterm = 0
let g:rehash256 = 1
let g:used_javascript_libs = 'underscore,backbone,angularjs,react,flux,requirejs,angularuirouter,jasmine'
" set background=dark
" set line number color
hi LineNr ctermfg=60 ctermbg=NONE cterm=NONE guifg=#6272a4 guibg=#282a36 gui=NONE

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
else
    if $TERM == 'xterm'
        set term=xterm-256color
    endif
    if $TERM == 'truecolor'
        colorscheme base16-dracula
    endif
    if $TERM == 'xterm-256color'

    endif

endif 
let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None
let base16colorspace=256  
let g:solarized_termcolors=256
" set termguicolors 
set guifont=Menlo\ Regular:h11
set encoding=utf8
set fileencoding=utf-8
set fileencodings=utf-8

set bomb
set binary

syntax enable
set t_Co=256
if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

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

set tabstop=4   " size of a hard tabstop
set shiftwidth=4    " size of an "indent"
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
let g:plugDir = g:vimDir.'/plugged'

"==================
"MAP KEYS
"==================
"
"map space to / search
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
map <silent><C-v> :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <Leader>S :SyntasticCheck<CR>

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

let g:webdevicons_enable_unite = 1

let g:webdevicons_enable_airline_tabline = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:webdevicons_enable_ctrlp = 1

" Move to the next buffer
nmap <leader>0 :bnext<CR>

" Delete Buffer and move to previous
nmap <leader><Bs> :bp <BAR> bd #<CR>

" Move to the previous buffer
nmap <leader>= :bprevious<CR>

let g:jsx_ext_required = 0
" create a tmux terminal
command OpenTerminal ! tmux split-window -v -l 10 -d \;
" esc from term in vim
tnoremap <ESC><ESC> <C-\><C-N>


"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'

let python_highlight_all = 1

" Calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:vebugger_leader='<F8>'
set path+=**
