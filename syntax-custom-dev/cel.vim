" Vim syntax file
" Language: Celestia Start Catalogs
" Maintainer: Joe Blow
" Latest Revision: 10 December 2014

if exists("b:current_syntax")
    finish
endif


syn match celNumber '\d\+'
syn match celNumber '[-+]\d\+'

" Floating point number with decimal no E or e (+,-)
syn match celNumber '\d\+\.\d*'
syn match celNumber '[-+]\d\+\.\d*'

" Floating point like number with E and no decimal point (+,-)
syn match celNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match celNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'

" Floating point like number with E and decimal point (+,-)
syn match celNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match celNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

syn keyword celBlockCmd RA Dec Mass Distance AbsMag nextgroup=celNumber skipwhite

syn keyword celTodo contained TODO FIXME XXX NOTE
syn match celComment "#.*$" contains=celTodo

syn region celDescBlock start="{" end="}" fold transparent contains=celNumber,celBlockCmd






