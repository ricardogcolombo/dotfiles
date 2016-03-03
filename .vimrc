set nocompatible
call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes
" Group dependencies, vim-snippets depends on ultisnips
" search
Plug 'dyng/ctrlsf.vim'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'

" Syntax
Plug 'Shougo/deoplete.nvim' "autocomplete
Plug 'Shougo/neosnippet.vim'
Plug 'vim-scripts/SyntaxComplete'
Plug 'jelera/vim-javascript-syntax'
Plug 'scrooloose/syntastic'
Plug 'genoma/vim-less'
Plug 'othree/yajs.vim'
Plug 'mattn/emmet-vim'
Plug 'JulesWang/css.vim'
Plug 'SirVer/ultisnips' 
Plug 'ricardogcolombo/vim-snippets'
Plug 'pangloss/vim-javascript'

" Jsdoc
Plug 'heavenshell/vim-jsdoc'
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin' "Show modified files in nerdtree
Plug 'gregsexton/gitv'
Plug 'mhinz/vim-grepper' "git grep


"Javascript Specific
Plug 'mxw/vim-jsx' " React
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
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'sjl/gundo.vim' "tree of changes in buffer
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors' "edit multiple lines
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'editorconfig/editorconfig-vim' "editor Config files
Plug 'kshenoy/vim-signature' "show marks
Plug 'matze/vim-move' " traslade rows with arrows
Plug 'ternjs/tern_for_vim'

"vim 
Plug 'tpope/vim-scriptease'
Plug 'dbakker/vim-lint'


call plug#end()

let g:vimrcPath = $MYVIMRC
let g:vimPath = system('realpath '.g:vimrcPath)
let g:vimDir = fnamemodify(g:vimPath, ':h')
let g:plugDir = g:vimDir.'/plugged'

colorscheme molokai
set background=dark
if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
set nu
set autochdir

set mouse=a
set history=200
set clipboard=unnamed "clipboard issue with tmux and iterm
"set background =light
set nowrap
set autoindent
set incsearch  "make search act like search in modern browsers
set showmatch "show matching for ({[ "
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
set t_Co=256
set cursorline

filetype plugin indent on
au BufNewFile,BufRead *.less set filetype=css

"==================
"MAP KEYS
"==================
"fast saving
nmap<leader>Q :so $MYVIMRC<cr>
"map space to / search
" map <space> /
map <c-space> ?
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
map <silent><C-v> :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <Leader>S :SyntasticCheck<CR>

nmap <Leader>s O<Esc>
nmap <CR> o<Esc>

"Copy paste to/from clipboard
vnoremap <C-c> "*y
"save 
nnoremap <Leader>w :w<CR>

nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

"==================
"CONFIG
"==================

let g:molokai_original = 1
let g:rehash256 = 1
let mapleader = ',' 
let g:used_javascript_libs = 'underscore,backbone'
"==================
"PLUGINS
"==================
" EASY MOTION MAP
"==================
nmap t <Plug>(easymotion-t2)
nmap s <Plug>(easymotion-s2)
omap / <Plug>(easymotion-tn)
map  / <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
"Open current file directory with nerdtree
let g:EasyMotion_smartcase = 1

"==================
" GIT 
"==================
map <Leader>gc :GCommit -m ""<LEFT>
map <Leader>gs :GStatus

"==================
"VIM MOVE
"==================
let g:move_key_modifier = 'C' "Use this to change Alt function to Ctrl

"==================
" AIRLINE
"==================
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

"==================
" Deoplete 
"==================
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_auto_close_preview = 1
let g:deoplete#data_directory = $HOME.'.vim/cache/deoplete'
let g:deoplete#force_omni_input_patterns = get(g:, 'deoplete#force_omni_input_patterns', {})
let g:deoplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets'
"==================
"NERDTREEE
"==================
nnoremap <S-t> :NERDTree<CR>

"==================
"AUTOFORMAT
"==================
map <S-f> :Autoformat<cr>

"==================
"GUNDO
"==================
nnoremap <F5> :GundoToggle<CR>

"==================
"JSDOC
"==================
nmap <silent> <Leader>jd <Plug>(jsdoc)

"==================
"CTRLSF
"==================
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

"==================
"Choose Win
"==================
nmap  <Leader>-  <Plug>(choosewin)

"NERD COMMENTER SPACE AFTER COMMENT 
let NERDSpaceDelims=1
"==================
"AUTOCOMMAND
"==================
"autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType javascript setlocal omnifunc=tern#CompleteJS
"return to last edit position when opening files
autocmd BufReadPost * 
            \ if line("'\'") > 0 && line("'\'") >  line("$") |
            \    exe "normal! g`\"" |
            \ endif

"==================
"TERN
"==================
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

"==================
"AG
"==================
let g:ackprg = 'ag --nogroup --nocolor --column'

"==================
"ULTISNIPSEXPANDTRIGGER
"==================
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""

"==================
"SNIPMATE
"==================
let g:snips_trigger_key = '<C-\>'
let g:UltiSnipsSnippetsDir=plugDir.'/vim-snippets/UltiSnips'

" Snippets


"==================
"multiple cursor
"==================
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

"======================
"Syntastic
""=====================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list =1 
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


function! DoPrettyXML()
    " save the filetype so we can restore it later
    let l:origft = &ft
    set ft=
    " delete the xml header if it exists. This will
    " permit us to surround the document with fake tags
    " without creating invalid xml.
    1s/<?xml .*?>//e
    " insert fake tags around the entire document.
    " This will permit us to pretty-format excerpts of
    " XML that may contain multiple top-level elements.
    0put ='<PrettyXML>'
    $put ='</PrettyXML>'
    silent %!xmllint --format -
    " xmllint will insert an <?xml?> header. it's easy enough to delete
    " if you don't want it.
    " delete the fake tags
    2d
    $d
    " restore the 'normal' indentation, which is one extra level
    " too deep due to the extra tags we wrapped around the document.
    silent %<
    " back to home
    1
    " restore the filetype
    exe "set ft=" . l:origft
endfunction

command! PrettyXML call DoPrettyXML()
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=GetCSSIndent()
setlocal indentkeys=0{,0},!^F,o,O
setlocal nosmartindent

if exists("*GetCSSIndent")
    finish
endif

function s:prevnonblanknoncomment(lnum)
    let lnum = a:lnum
    while lnum > 1
        let lnum = prevnonblank(lnum)
        let line = getline(lnum)
        if line =~ '\*/'
            while lnum > 1 && line !~ '/\*'
                let lnum -= 1
            endwhile
            if line =~ '^\s*/\*'
                let lnum -= 1
            else
                break
            endif
        else
            break
        endif
    endwhile
    return lnum
endfunction

function s:count_braces(lnum, count_open)
    let n_open = 0
    let n_close = 0
    let line = getline(a:lnum)
    let pattern = '[{}]'
    let i = match(line, pattern)
    while i != -1
        if synIDattr(synID(a:lnum, i + 1, 0), 'name') !~ 'css\%(Comment\|StringQ\{1,2}\)'
            if line[i] == '{'
                let n_open += 1
            elseif line[i] == '}'
                if n_open > 0
                    let n_open -= 1
                else
                    let n_close += 1
                endif
            endif
        endif
        let i = match(line, pattern, i + 1)
    endwhile
    return a:count_open ? n_open : n_close
endfunction

function GetCSSIndent()
    let line = getline(v:lnum)
    if line =~ '^\s*\*'
        return cindent(v:lnum)
    endif

    let pnum = s:prevnonblanknoncomment(v:lnum - 1)
    if pnum == 0
        return 0
    endif

    return indent(pnum) + s:count_braces(pnum, 1) * &sw
                \ - s:count_braces(v:lnum, 0) * &sw
endfunction


function! s:ExecuteInShell(command, bang)
    let _ = a:bang != '' ? s:_ : a:command == '' ? '' : join(map(split(a:command), 'expand(v:val)'))
    if (_ != '')
        let s:_ = _
        let bufnr = bufnr('%')
        let winnr = bufwinnr('^expand' . _ . '$')
        silent! execute  winnr < 0 ? 'belowright new ' . fnameescape(_) : winnr . 'wincmd w'
        setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile wrap number
        silent! : %d
        let message = 'Execute ' . _ . '...'
        call append(0, message)
        echo message
        silent! 2d | resize 1 | redraw
        silent! execute 'silent! %!'. _
        silent! execute 'resize ' . line('$')
        silent! execute 'syntax on'
        silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
        silent! execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
        silent! execute 'nnoremap <silent> <buffer> <CR> :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteecuteInShell(''' . _ . ''', '''')<CR>'
        silent! execute 'nnoremap <silhouetteent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<CR>'
        nnoremap <silent> <buffer> <C-W>_ :execute 'resize ' . line('$')<CR>
        silent! syntax on
    endif
endfunction

command! -complete=shellcmd -nargs=* -bang Shell call s:ExecuteInShell(<q-args>, '<bang>')
cabbrev shell Shel





function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
                return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" function! g:allVarsOnTop()
    " "contains all the var to define at the top of the function;
    " let s:varsNames = []
    " echo a:0
    " echo a:1

    " echo "testing"

" endfunction
" command! allVarsOnTop call allVarsOnTop()
