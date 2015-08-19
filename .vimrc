call plug#begin('~/.nvim/plugged')
" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'


" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"ack
Plug 'mileszs/ack.vim'

Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'maksimr/vim-jsbeautify'
Plug 'tpope/vim-surround'
Plug 'Shutnik/jshint2.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-scriptease'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-session'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dbakker/vim-lint'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
call plug#end()

set autochdir
set mouse=a

"==================
syntax on
set background=dark
colorscheme distinguished
let g:solarized_termcolors=256

set nowrap
let mapleader = ',' 
let g:used_javascript_libs = 'underscore,backbone'
set autoindent
set runtimepath+=/.vim/bundle/jshint2.vim/
"fast saving
nmap<leader>Q :so $MYVIMRC<cr>

"make search act like search in modern browsers
set incsearch
"show matching for ({[ "
set showmatch

	"noswap files
set noswapfile

"map space to / search
map <space> /
map <c-space> ?


"return to last edit position when opening files
autocmd BufReadPost * 
\ if line("'\'") > 0 && line("'\'") >  line("$") |
\    exe "normal! g`\"" |
\ endif

"open buffers on close
set viminfo^=%

"==================
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

nmap <Leader>s O<Esc>
nmap <CR> o<Esc>
let g:airline#extensions#tabline#enabled = 1

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"==================
"NERDTREE
"==================
nnoremap <F2> :NERDTree<CR>
"Open current file directory with nerdtree
autocmd BufEnter * lcd %:p:h
"==================
" GIT 
"==================

map <Leader>gc :Gxommit -m ""<LEFT> 
map <Leader>gs :GStatus
"==================
" EASY MOTION MAP
"==================
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_smartcase = 1
"==================
" GUNDO PLUGIN
"==================
nnoremap <F5> :GundoToggle<CR>

"multiple cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

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
command! PrettyXML call DoPrettyXML()


".vimrc
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

map <F3> :Shell gruntEH<cr>

"JSHINT
set runtimepath+=~/.vim/bundle/jshint2.vim/
map <F6> :JSHint<cr>



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
cabbrev shell Shell

