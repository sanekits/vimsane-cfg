" vimsane.vim
" lmatheson4@bloomberg.net
"
" vimsane is a pre-packaged Vim installation available to 
" those who want to learn the Vim editor.  Vim can be 
" intimdating and frustrating to new users, and the learning
" curve is long.  
"
" Vimsane exists to help you become reasonably competent 
" quickly, by bundling some help, a few popular vim plugins,  and 
" sane configuration choices to make Vim a bit easier for
" newbies.
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
inoremap jj <Nop>

set t_Co=256  " Assume we have 256 colors.   We're not in the 80's.


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

" In vim, the normal-mode 's' is mapped to 'substitute chars'.
" I would have mapped it to 'save', which is a much more
" common action.  If you agree, uncomment the following 2 lines.  Then
" you can use '-' for substitute-chars, and 's' for save-file:
" nnoremap - s
" nnoremap s :w<CR>


" Ctrl-S will save the current file:
nnoremap <C-S> :w<CR>

" Ctrl-a will select-all in the current file:
nnoremap <C-A> ggVG

" ,f switches to the previous ("alternate") file.  This 
" is useful for toggling back and forth between two files
" repeatedly:
nnoremap <leader>f <C-^>


" ,x switches between the .h and .cpp if they're in the same dir:
nnoremap <leader>x  :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>


" In normal mode, when wrap is ON, the per-line (instead of 
" per-display) vertical movement is disorienting.   
" This is cured by remapping j and k to gj and gk:
nnoremap j gj
nnoremap k gk

" wildmenu turns on the fancy visual display of <TAB> matches when doing
" command-line completion:
set wildmenu


" We do, in general, want formatoptions += c, o, r (see help 
" fo-table).  This ensures that the comment leader is inserted in 
" unsurprising ways when writing or editing comment blocks:
set formatoptions += "c" 
set formatoptions += "o"
set formatoptions += "r"


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


" In file-completions with TAB or Ctrl-X Ctrl-F, ignore
" files like these:
set wildignore=*.swp,*.bak,*.o,*.d,*.tsk



" ,. -> open file browser in current dir:
nnoremap <leader>. :e .<CR>



command! VsRefresh execute 'source ' . g:vimsane_script_path

" If you create a ~/.taskrc directory (or ./.taskrc within your
" working dir), we'll load any scripts that have a .vim extension.
" This is handy for your project-specific or directory-specific
" settings.  You could, for example, have a script that loads
" all of the .cpp/.h/.mk files, but ignores those generated by
" bas_codegen.py:
source $VIMHOME/load-task-rcs.vim
call LoadTaskRcs("~/.taskrc")
call LoadTaskRcs(".taskrc")



" The command window needs at least 2 lines so echo messages don't 
" disappear suddenly:
set cmdheight=2


"# Display a menu of buffers with F10:
nnoremap <F10> :buffers<CR>:buffer<Space>



" Grab the current visual selection and return it
" (See  https://stackoverflow.com/a/6271254/237059)
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



" Execute (with unix shell) the command text currently selected:
vnoremap <leader>e :<C-U>exec '!'.expand(Get_visual_selection())<CR>



" <leader>. -> open file browser in current dir:
nnoremap <leader>. :e .<CR>

" Enable filetype detection and type-specific indenting:
filetype plugin indent on


" Fix the markdown mapping for 'md' extension:
au BufRead,BufNewFile *.md set filetype=markdown


" This script provides the ToggleComment function used below.
source $VIMHOME/toggle-comment.vim


" ,F copies the current buffer's filename to the w register:
nnoremap <leader>F :let @w=expand("%:p:t")<CR>

" ,w copies the current word to the w register:  
nnoremap <leader>w :let @w=expand("<cword>")<CR>
nnoremap <leader>W :let @w=expand("<cWORD>")<CR>

" ,r replaces the current word with contents of the w register
nnoremap <leader>r viw"wp

" ,p will reformat the current paragraph:
nnoremap <leader>p gqip


" :Gvim will start gvim with the current file:
command! Gvim !gvim %


" ,q will quit without saving, losing all unsaved changes:
nnoremap <leader>q :qa!<CR>


" ,1 toggles a comment-block (select it first):
nnoremap <leader>1 :call ToggleComment()<cr>
vnoremap <leader>1 :call ToggleComment()<cr>


" ,> resizes the current window horizontally +20:
nnoremap <leader>> <C-W>20>
" ,<  resizes the current window horizontally -20:
nnoremap <leader>< <C-W>20<



" You'll want to create a ~/.vimtmp directory if vim complains
" about not being able to save file backups:
set backupdir=~/.vimtmp
set directory=~/.vimtmp,.



"  If we're running gvim, use a decent font:
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h16
    elseif has("gui_win32")
        set guifont=Consolas:h10:cANSI
    endif
	" Make font larger (gvim only on Linux):
	nnoremap <leader>+ :LargerFont<CR> 
	nnoremap <leader>= :LargerFont<CR> 
	nnoremap <leader>- :SmallerFont<CR> 
endif



" Every window has its own current directory.  If you load a file
" from another directory, you can ':lcd' to that dir, changing the
" current-dir for the current window to match the loaded file.
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>

syntax on " Turn on syntax higlighting.


"  Don't ever, ever, ever beep or flash at me.  If you disable
"  this, I pity you:
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Load tags on startup.
set tags=tags;/


" Compile with F3:
set makeprg=plink\ *.mk
nnoremap <F3> :wall<CR>:make!<CR><CR>:cn<CR>:cw<CR>
" Goto next error with F4:
nnoremap <F4> :cn<CR>
" Goto prev error with Shift-F4:
nnoremap <S-F4> :cp<CR>



" bufexplorer gets quick access with ',n'
nnoremap <silent> <leader>n :BufExplorer<CR>


let g:vimsane_loaded=1



