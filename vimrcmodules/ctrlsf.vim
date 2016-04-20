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
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>let g:ctrlsf_ackprg = 'ack'
let g:ctrlsf_ignore_dir = ['bower_components', 'npm_modules']
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_auto_close = 0

