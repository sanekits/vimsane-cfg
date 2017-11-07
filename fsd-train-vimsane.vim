" fsd-train.vim
"
" Misc aids for fsd training
"

" By default, when :make runs in vim, we invoke plink on "whatever 
" makefile(s) are at hand..."
set makeprg=plink\ *.mk

function! FsdMakeLabTaskrc_f()
    
endfunction


command! FsdMakeLabTaskrc call FsdMakeLabTaskrc_f()

