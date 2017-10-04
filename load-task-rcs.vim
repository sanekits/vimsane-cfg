" load-task-rcs.vim
"
" Loop through our taskrc's if they exist. These
" are small scripts which establish commands or
" options that are local to a particular directory
" or user.
function! LoadTaskRcs(baseDir)
    let l:rcdir= expand(a:baseDir)
    let l:myRcs=split( globpath( l:rcdir,'*.vim'),'\n')
    if len(l:myRcs) == 0
        return 0
    endif
    for rcs in myRcs
        execute "source " . rcs
    endfor
    return 0
endfunction

