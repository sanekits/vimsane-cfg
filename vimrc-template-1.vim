" ~/.vim/vimrc
" vim: textwidth=75 :
"
" This is your vim configuration file.  It was created by vimsane, but now
" it's yours and vimsane will never overwrite it.
"
" You should leave this reference to vimsane.vim alone, though, if you plan
" to keep taking updates from vimsane:


set nocompatible

let g:debug_enable=1

function! DebugMsg(msg)
    if exists("g:debug_enable")
        if g:debug_enable
            echom( "DebugMsg: [" . a:msg . "]")
        endif
    endif
endfunction

call DebugMsg("Loading " . expand("<sfile>"))

" Capture the path of our own script for later refresh.
let g:vimrc_script_path = expand('<sfile>:p')
let $VIMHOME=expand('<sfile>:p:h')

let g:load_taskrcs=1

" Now we're ready to process vimsane.vim, which contains most of the meat
" of vimsane.  It's worth reading if you're learning vim.
" 
" You can load it into the editor by putting the cursor anywhere on the
" filename below and typing 'gf' in normal mode ("go file").
source $VIMHOME/vimsane.vim

