setlocal iskeyword=@,48-57,192-255,#,_
"setlocal grepprg=bin/grep-chapters
nnoremap <buffer> gR :grep '\b<cword>\b' <CR>

