" dummy.vim -- script snippet testing.
" This is junk, feel free to edit

messages clear
function! s:Dummy(...)
    let s:tmp=join(a:000,",")
    echom 'expand says: ' . expand('s:tmp')
    call DebugMsg('s:tmp=' . s:tmp)
endfunction

"command! -nargs=1 Tox call s:ToxCore(<f-args>)
command! -nargs=? Kvv call Dummy(<f-args>)
echom "Reload"

call s:Dummy('a','b')

nmap <leader>t :Kvv
