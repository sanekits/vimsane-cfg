" Vim syntax file for jrnl files.  Lifted/modified from diff.vim in the 7.3
"    vim distribution.
"
" Language:	Journal
" Maintainer:	Les Matheson <les.matheson@gmail.com>
" Last Change:	2014 Dec 10
" Filenames: *jrnl

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif
scriptencoding utf-8


syn match diffComment	"^#.*"

" TODOs:
syn match jrnlTodoOther         "\[.\].*$"
syn match jrnlTodoActive        "\[\.\].*$"
syn match jrnlTodoActive        "?.*$"
syn match jrnlTodoOpen          "\[\ \].*$"


" riddle tokens:

syn match symName       ".*" contained display
syn match ridDefines    "## defines/" nextgroup=symName
syn match ridDepends    "## depends/" nextgroup=symName
syn match ridPromises   "## promises/" nextgroup=symName

" syn match ridDefines    "## defines/"
" syn match ridDepends    "## depends/"
" syn match ridPromises   "## promises/"



syn match diffRemoved	"^ *-.*"
syn match diffRemoved	"^ *<.*"
syn match diffAdded	"^ *+.*"
syn match diffAdded	"^ *>.*"
syn match diffChanged	"^ *! .*"

syn match diffSubname	" @@..*"ms=s+3 contained
syn match diffLine	"^@.*" contains=diffSubname
syn match diffLine	"^\<\d\+\>.*"
syn match diffLine	"^\*\*\*\*.*"
syn match diffLine	"^---$"



"Some versions of diff have lines like "#c#" and "#d#" (where # is a number)
syn match diffLine	"^\d\+\(,\d\+\)\=[cda]\d\+\>.*"

syn match diffFile	"^diff.*"
syn match diffFile	"^+++ .*"
syn match diffFile	"^Index: .*$"
syn match diffFile	"^==== .*$"
syn match diffOldFile	"^\*\*\* .*"
syn match diffNewFile	"^--- .*"


" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link jrnlTodoOpen        Identifier
hi def link jrnlTodoOther	Comment
hi def link jrnlTodoActive	Statement

hi def link ridDefines          Statement
hi def link ridDepends          Constant
hi def link ridPromises         PreProc



hi def link diffOldFile		diffFile
hi def link diffNewFile		diffFile
hi def link diffFile		Statement
hi def link diffOnly		Constant
hi def link diffIdentical	Constant
hi def link diffDiffer		Constant
hi def link diffBDiffer		Constant
hi def link diffIsA		Constant
hi def link diffNoEOL		Constant
hi def link diffCommon		Constant
hi def link diffRemoved		Special
hi def link diffChanged		PreProc
hi def link diffAdded		Identifier
hi def link diffLine		Type
hi def link diffSubname		PreProc
hi def link diffComment		Comment

let b:current_syntax = "jrnl"

" vim: ts=8 sw=2
