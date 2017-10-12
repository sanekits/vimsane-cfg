" vimsane.vim
" lmatheson4@bloomberg.net
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
inoremap jk <ESC>
inoremap JK <ESC>

set t_Co=256  " Don't even claim you can't do 256 colors.

" The 'leader' is a single comma.  We use this as a prefix for various command
" extensions to avoid "polluting the namespace" of key maps.
let mapleader=','

" Window pane-switching with Alt-[arrow] or Ctrl[h,j,k,l]:
" ===================================================
    nnoremap <C-h> <C-w>h  
    nnoremap <M-Left> <C-w>h

    nnoremap <C-j> <C-w>j
    nnoremap <M-Down> <C-w>j

    nnoremap <C-k> <C-w>k
    nnoremap <M-Up> <C-w>k

    nnoremap <C-l> <C-w>l
    nnoremap <M-Right> <C-w>l

" Word-right and Word-left are 'w' and 'b' respectively, but vimsane 
" also offers <Ctrl+Left> and <Ctrl+Right>:
" ===================================================
    nnoremap <C-Left> b
    nnoremap <C-Right> w

" We always want a status line:
set laststatus=2   

" Ctrl+z is the CUA 'undo'.  If you find vim's standard 'u' to
" be a bit dangerous, you can uncomment the line below to nullify 
" that.  Then just use Ctrl+z all the time.
nnoremap <C-Z> u
inoremap <C-Z> <ESC>u
vnoremap <C-Z> u
" nnoremap u <Nop>  " Un-comment this to eliminate 'u' as undo

" Smart tabbing / autoindenting
set autoindent
set copyindent

"" Allow backspace to back over lines
set backspace=indent,eol,start

set shiftwidth=4
set shiftround
set tabstop=4
set expandtab
set textwidth=0

" Number lines in the margin:
set number
set showmatch

" Disable case-sensitivity in searches
set ignorecase
set smartcase

" Highlight search matches:
set hlsearch

" How to turn off the search highlights and the annoying 'cursorline' option:
nnoremap <leader><space> :nohlsearch<CR>:set nocursorline<CR>

" Use incremental search:
set incsearch

" You probably want it to write current file when jumping to another:
set autowrite

" Yes, wrap long lines (use :set nowrap) to disable this
set wrap


" Plugins are extension scripts produced by 3rd parties that add
" features to vim.  Vimsane includes a few of the most popular
" plugins pre-configured, you can see what they 
" are in ~/.vim/manual-repos/plugin-list.vim
source $VIMHOME/load-plugins.vim

set linebreak  " if you do wrap, do it nicely (caution: this conflicts with 'set list', so you have to turn the latter off if you really want linebreak to work)

set updatetime=800
set title
set showcmd

set breakindent
set breakindentopt=shift:1
set history=1000
set undolevels=1000

set wildignore=*.swp,*.bak,*.o,*.d


command! VsRefresh execute 'source ' . g:vimsane_script_path

source $VIMHOME/load-task-rcs.vim

" If you create a ~/.taskrc directory (or ./.taskrc within your
" working dir), we'll load any scripts that have a .vim extension.
" This is handy for your project-specific or directory-specific
" settings.  You could, for example, have a script that loads
" all of the .cpp/.h/.mk files, but ignores those generated by
" bas_codegen.py

call LoadTaskRcs("~/.taskrc")
call LoadTaskRcs(".taskrc")

" The command window needs at least 2 lines so echo messages don't 
" disappear suddenly:
set cmdheight=2

"# Display a menu of buffers with F10:
nnoremap <F10> :buffers<CR>:buffer<Space>


" From https://stackoverflow.com/a/6271254/237059
" Grab the current visual selection and return it
function! Get_visual_selection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

" Execute (with shell) the command text currently selected:
vnoremap <leader>e :<C-U>exec '!'.expand(Get_visual_selection())<CR>

" <leader>. -> open file browser in current dir:
nnoremap <leader>. :e .<CR>

" Fix the markdown mapping for 'md' extension:
au BufRead,BufNewFile *.md set filetype=markdown

source $VIMHOME/toggle-comment.vim


"  Use <leader>1 (the number 1, not lower-case L) to toggle  comments.  
nnoremap <leader>1 :call ToggleComment()<cr>
vnoremap <leader>1 :call ToggleComment()<cr>

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h16
    elseif has("gui_win32")
        set guifont=Consolas:h10:cANSI
    endif
	" Make font larger (gvim only on Linux)
	" See plugin/gtk2fontsize.vim
	"source ~/.vim/plugin/gtk2fontsize.vim
	nnoremap <leader>+ :LargerFont<CR> 
	nnoremap <leader>= :LargerFont<CR> 
	nnoremap <leader>- :SmallerFont<CR> 
endif

" Change to directory containing current file, for current window only:
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>

syntax on " Turn on syntax higlighting.

"  Don't ever, ever, ever beep or flash at me:
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

let g:vimsane_loaded=1



