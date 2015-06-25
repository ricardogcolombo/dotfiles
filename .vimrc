call pathogen#infect()
call pathogen#helptags()
set autochdir
set mouse=a

"==================
syntax on
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

set nowrap
let mapleader = ',' 
let g:used_javascript_libs = 'underscore,backbone'
set autoindent
set runtimepath+=/.vim/bundle/jshint2.vim/
"fast saving
nmap<leader>w :w!<cr>
nmap<leader>Q :so $MYVIMRC<cr>

"make search act like search in modern browsers
set incsearch
"show matching for ({[ 
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


".vimrc
  map <c-f> :call JsBeautify()<cr>
  " or
  autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
  " for html
  autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  " for css or scss
	  autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

function! CompileEH()
	:command! !grunt buildAndDeploy-debug
endfunction

map <F3> :call CompileEH()<cr>

