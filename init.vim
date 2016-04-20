set nocompatible
filetype off

" Load Plugins
source ~/dotfiles/vimrcmodules/pluggins.vim
" set general vim customization
source ~/dotfiles/vimrcmodules/general.vim
" easy motion related config
source ~/dotfiles/vimrcmodules/easymotion.vim
" ctrlp related config
source ~/dotfiles/vimrcmodules/ctrlp.vim
" ctrlsf related config
source ~/dotfiles/vimrcmodules/ctrlsf.vim
" neosnippets related config
source ~/dotfiles/vimrcmodules/neosnippets.vim
" git fugitive and gundo related config
source ~/dotfiles/vimrcmodules/git.vim
" deoplete config
source ~/dotfiles/vimrcmodules/autocomplete.vim
" syntastic config
source ~/dotfiles/vimrcmodules/syntastic.vim
" multicursor  
source ~/dotfiles/vimrcmodules/multicursor.vim

" custom functions
source ~/dotfiles/vimrcmodules/functions.vim



" JSX
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']

" Override eslint with local version where necessary.
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
    let g:syntastic_javascript_eslint_exec = local_eslint
endif


"==================
" prosession
"==================
let g:loaded_prosession = 0

"==================
"VIM MOVE
"==================
let g:move_key_modifier = 'C' "Use this to change Alt function to Ctrl

"==================
" AIRLINE
"==================
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'

"==================
" TAGBAR
"==================
let g:vim_tags_auto_generate = 1

"==================
"NERDTREEE
"==================
nnoremap <S-t> :NERDTree<CR>

"==================
"AUTOFORMAT
"==================
map <S-f> :Autoformat<cr>

"==================
"JSDOC
"==================
nmap <silent> <Leader>jd <Plug>(jsdoc)

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

" vim indent guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

let b:did_indent = 1

setlocal indentexpr=GetCSSIndent()
setlocal indentkeys=0{,0},!^F,o,O
setlocal nosmartindent

if exists("*GetCSSIndent")
    finish
endif


au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"