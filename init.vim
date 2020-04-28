set nocompatible
filetype off
" Load Plugins
source ~/dotfiles/vim_modules/pluggins.vim
" set general vim customization
source ~/dotfiles/vim_modules/general.vim
" nerd tree related config 
" easy motion related config
source ~/dotfiles/vim_modules/easymotion.vim
" fzf related config
source ~/dotfiles/vim_modules/fzf.vim
" ctrlsf related config
source ~/dotfiles/vim_modules/ctrlsf.vim
" git fugitive and gundo related config
source ~/dotfiles/vim_modules/git.vim
" deoplete config
source ~/dotfiles/vim_modules/autocomplete.vim
" relative numbers
source ~/dotfiles/vim_modules/numbers.vim
" custom functions
"startify configs
source ~/dotfiles/vim_modules/prettier.vim

" JSX
let g:jsx_ext_required = 0

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
" TAGBAR
"==================
" let g:vim_tags_auto_generate = 1

"==================
"AUTOFORMAT
"==================
map <Leader>2 :Prettier<cr>

"==================
"Choose Win
"==================
nmap  <Leader><TAB>  <Plug>(choosewin)

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

setlocal indentexpr=GetCSSIndent()
setlocal indentkeys=0{,0},!^F,o,O
setlocal nosmartindent

" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


