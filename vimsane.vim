" vimsane.vim
"
" vimsane is a pre-packaged Vim installation available to 
" those who want to learn the Vim editor.  Vim can be 
" intimdating and frustrating to new users, and the learning
" curve is long.  
"
" Vimsane exists to help you become reasonably competent 
" quickly, by bundling some popular vim plugins and 
" configuration choices to make Vim a bit more 'sane' for
" learning.
"
" While you can use vimsane as your daily editor for the 
" long term, you're encouraged to learn how to customize
" and extend Vim, and you'll probably want to leave 
" vimsane behind as you do that.  This is training wheels,
" not a racing bike.
"
" If you're brand new, you should print these instructions
" and keep them handy while working.
"

" .......................................
" Level 1:  Things you should learn early 
" .......................................
"
" (Note: this includes a few things that only work in
"  vimsane, noted with a *VS* marker)
"

" This section just provides a list of commands that are 
" handy to have in your muscle memory:
"
"   i --> Enter insert mode (so you can modify text)
"
"   <ESC> --> Return to normal mode ( OR...)
"   jk   -->  Return to normal mode *VS*
"
"   :w  --> Write current file to disk
"   :e [filename]  --> Edit/open given file
"
"   :q  --> Exit vim 
"   :qa! --> Exit without saving anything
"   
"   h,l,j,k --> Basic cursor movements
"
"   Ctrl-z  --> Undo change
"   Ctrl-r  --> Redo change
"
"   V -->   Select a block of text: V (and then move up or down to extend the   selection.)
"
"   y -->   copY selected block of text (i.e. "yank")
"   d -->   Delete selected block of text (i.e. "cut")
"   p -->   Paste text
"
"   :ls  --> Show a list of the files loaded
"
"   :b [name-fragment]  --> switch to loaded file 
"   :b [buffer-number]  --> switch to numbered buffer
"
"   :args [wildcards] --> Load all files matching wildcard
"
"   ,.  --> Open directory browser at current dir *VS*
"   ,m  --> Open MRU list for recently-edited files *VS*
"   ,n  --> Open browser of current buffers *VS*
"   
"
" .......................................
" Level 2:  A bit more advanced:
" .......................................
"
"   
"
" Zoom a window in/out:
"   Ctrl+@ o     " Thanks to ZoomWin plugin
"
" Normalize split sizes, handy when resizing a terminal:
"
"   ctrl+w = 
"
" Redraw the screen (if ^L isn't working)
" :redraw!
"
" Capture the result of a command to register:
"   : let @u=system("ls /")    
"    { put the results of the ls into the u register }
"
"
" Repeat last command:
"   @:
"   @@ { subsequently } 
"
" Open quickfix window:
"   :cw
"   :copen
"   :cold  << Go to previous quickfix contents
"   :cnew  >> Go to newer quickfix contents
"
" List all matching tags:
"   :tselect {name}
"
" 	  :resize 5  (make it 5 lines high)
" 	  :resize +5 (increase by 5 lines)

set nocompatible  " Keep this as second line always

" Capture the path of our own script for later refresh.
let g:vimsane_script_path = expand('<sfile>:p')
let $VIMHOME=expand('<sfile>:p:h')


imap jk <ESC>
set cmdheight=2

" Window switching is easier if you just take over the Ctrl+Dir sequence:
noremap <C-h> <C-w>h  
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


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


command! VsRefresh execute 'source ' . g:vimsane_script_path

" We first search the user's ~/.taskrc directory for *.vim,
" and then we search ./.taskrc.
call LoadTaskRcs("~/.taskrc")
call LoadTaskRcs(".taskrc")
"

echo "Vimsane loaded from " . g:vimsane_script_path

let g:vimsane_loaded=1

