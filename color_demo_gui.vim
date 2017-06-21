let num = 254
while num >= 0
    exec 'hi col_'.num.' guibg='.num.' guifg=white'
    exec 'syn match col_'.num.' "guibg='.num.':...." containedIn=ALL'
    call append(0, 'guibg='.num.':....')
    let num = num - 1
endwhile

