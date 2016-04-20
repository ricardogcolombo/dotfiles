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
