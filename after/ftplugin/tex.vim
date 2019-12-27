setlocal iskeyword=@,48-57,192-255,#,_
nnoremap <buffer> gR :grep '\b<cword>\b' <CR>

setlocal formatoptions+=o
setlocal formatoptions+=r

