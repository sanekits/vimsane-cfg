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
"   :ls  --> Show a list of the files loaded.  The numbers
"            on the left are buffer numbers that can be used
"            with :b to change files.
"
"   :b [name-fragment]  --> switch to loaded file by number
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

set nocompatible  " Keep this at the top of the file. We don't do vi compatibility

" Capture the path of our own script for later refresh.
let g:vimsane_script_path = expand('<sfile>:p')
let $VIMHOME=expand('<sfile>:p:h')

"  BASICS
"  ------
" You can use 'jk' to leave insert mode, without reaching up to hit ESC:
imap jk <ESC>


" The 'leader' is a single comma.  We use this as a prefix for various command
" extensions to avoid "polluting the namespace" of key maps.
let mapleader=','

" Window pane-switching with Alt-[arrow] or Ctrl[h,j,k,l]:
" ===================================================
    noremap <C-h> <C-w>h  
    noremap <M-Left> <C-w>h

    noremap <C-j> <C-w>j
    noremap <M-Down> <C-w>j

    noremap <C-k> <C-w>k
    noremap <M-Up> <C-w>k

    noremap <C-l> <C-w>l
    noremap <M-Right> <C-w>l

" Word-right and Word-left are 'w' and 'b' respectively, but vimsane 
" also offers <Ctrl+Left> and <Ctrl+Right>:
" ===================================================
    noremap <C-Left> b
    noremap <C-Right> w


source $VIMHOME/load-plugins.vim





command! VsRefresh execute 'source ' . g:vimsane_script_path

source $VIMHOME/load-task-rcs.vim

" We first search the user's ~/.taskrc directory for *.vim,
" and then we search ./.taskrc.
call LoadTaskRcs("~/.taskrc")
call LoadTaskRcs(".taskrc")

" The command window needs at least 2 lines so echo messages don't 
" disappear suddenly:
set cmdheight=2

"  echo "Vimsane loaded from " . g:vimsane_script_path
" Height of the command window in lines:

let g:vimsane_loaded=1

