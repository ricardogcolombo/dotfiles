
"======================
"Syntastic
""=====================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint', 'jshint']

let g:syntastic_always_populate_loc_list =1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
    let g:syntastic_javascript_eslint_exec = local_eslint
    let g:syntastic_vue_eslint_exec = local_eslint
endif
" let g:neomake_warning_sign = {
" \ 'text': 'W',
" \ 'texthl': 'WarningMsg',
" \ }
" let g:neomake_error_sign = {
" \ 'text': 'E',
" \ 'texthl': 'ErrorMsg',
" \ }


" let g:neomake_verbose = 3
" let g:neomake_logfile='~/neomake.log'


" let g:neomake_javascript_enabled_makers = ['eslint']
" autocmd! BufWritePost,BufEnter * Neomake
" let g:neomake_open_list = 1
" let g:neomake_javascript_eslint_maker = {
" \ 'args': ['--no-color', '--format', 'compact', '--config', '~/.eslintrc.json'],
" \ 'errorformat': '%f: line %l\, col %c\, %m'
" \ }
"
let g:syntastic_vue_checkers = ['eslint']

