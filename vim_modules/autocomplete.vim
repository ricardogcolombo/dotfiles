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
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'file', 'ultisnips']
let g:deoplete#file#enable_buffer_path = 1
imap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()


"==================
"ULTISNIPSEXPANDTRIGGER
"==================
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""

" TERNJS
" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [
            \'javascript',
            \ 'jsx',
            \ 'javascript.jsx',
            \ 'vue',
            \ '...'
            \ ]
