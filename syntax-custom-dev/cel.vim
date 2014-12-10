" Vim syntax file
" Language: Celestia Star Catalogs
" Maintainer: Joe Blow
" Filenames: *stc
" Latest Revision: 10 December 2014

if exists("b:current_syntax")
    finish
endif

syn keyword celTodo contained TODO FIXME XXX NOTE
syn match celComment "#.*$" contains=celTodo

"----------------------------------------------------------------
" Celestia Star Catalog Numbers
"----------------------------------------------------------------

" Regular int like number with - + or nothing in front
syn match celNumber '\d\+' contained display
syn match celNumber '[-+]\d\+' contained display

" Floating point number with decimal no E or e (+,-)
syn match celNumber '\d\+\.\d*' contained display
syn match celNumber '[-+]\d\+\.\d*' contained display

" Floating point like number with E and no decimal point (+,-)
syn match celNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+' contained display
syn match celNumber '\d[[:digit:]]*[eE][\-+]\=\d\+' contained display

" Floating point like number with E and decimal point (+,-)
syn match celNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display
syn match celNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display

syn region celString start='"' end='"' contained
syn region celDesc start='"' end='"'

syn match celHip '\d\{1,6}' nextgroup=celString
syn region celDescBlock start="{" end="}" fold transparent contains=ALLBUT,celHip,celString

syn keyword celBlockCmd RA Dec Distance Mass AbsMag nextgroup=celNumber
syn keyword celBlockCmd SpectralType nextgroup=celDesc

let b:current_syntax = "cel"

hi def link celTodo        Todo
hi def link celComment     Comment
hi def link celBlockCmd    Statement
hi def link celHip         Type
hi def link celString      Constant
hi def link celDesc        PreProc
hi def link celNumber      Constant


