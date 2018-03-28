" dummy.vim -- script snippet testing

function! Dummy(...)
    let s:tmp=join(a:000,",")
    DebugMsg('s:tmp=' . s:tmp)
endfunction

command! -nargs=1 Tox call s:ToxCore(<f-args>)
command! -nargs=? Kvv call Dummy(<f-args>)

nmap = :so %<CR>

