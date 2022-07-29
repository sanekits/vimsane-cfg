" basic-vimrc.vim
set nocompatible

inoremap jk <ESC>
inoremap JK <ESC>
inoremap jj <Nop>

set t_Co=256  " Assume we have 256 colors.   We're not in the 80's.
let mapleader=','

    nnoremap <C-h> <C-w>h  
    nnoremap <M-Left> <C-w>h

    nnoremap <C-j> <C-w>j
    nnoremap <M-Down> <C-w>j

    nnoremap <C-k> <C-w>k
    nnoremap <M-Up> <C-w>k

    nnoremap <C-l> <C-w>l
    nnoremap <M-Right> <C-w>l

    nnoremap <C-Left> b
    nnoremap <C-Right> w
" We always want a status line:
set laststatus=2   
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

" Use egrep -n for :grep
set grepprg=egrep\ -n

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

" In vim's defaults, the normal-mode 's' is mapped to 'substitute chars'.
" I would have mapped it to 'save', which is a much more
" common action.  If you agree, uncomment the following 2 lines.  Then
" you can use '-' for substitute-chars, and 's' for save-file:
nnoremap - s
nnoremap s :w<CR>


" Ctrl-S will save the current file:
nnoremap <C-S> :w<CR>

" Ctrl-a will select-all in the current file:
"nnoremap <C-A> ggVG

" ,f switches to the previous ("alternate") file.  This 
" is useful for toggling back and forth between two files
" repeatedly:
nnoremap <leader>f <C-^>


" ,x switches between the .h and .cpp if they're in the same dir:
nnoremap <leader>x  :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" In normal and visual mode, when wrap is ON, the per-line (instead of 
" per-display) vertical movement is disorienting.   
" This is cured by remapping j and k to gj and gk:
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" wildmenu turns on the fancy visual display of <TAB> matches when doing
" command-line completion:
set wildmenu



" The default colorscheme for vimsane.  Try :colorscheme <tab> to
" cycle through the available choices.
colorscheme delek

" SaveSession saves the current window/file layout into .taskrc/session.vim,
" so if you restart vim in this same directory it all gets restored
command! SaveSession mksession .taskrc/session.vim


set linebreak  " if you do wrap, do it nicely (caution: this conflicts with 'set list', so you have to turn the latter off if you really want linebreak to work)



set updatetime=800
set notitle
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



" The command window needs at least 2 lines so echo messages don't 
" disappear suddenly:
set cmdheight=2


"# Display a menu of buffers with F10:
nnoremap <F10> :buffers<CR>:buffer<Space>

" 'set list' enables the display of whitespace, and 'set listchars' refines
" the behavior of that.  Use 'set nolist' to turn this off.
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set nolist

" Toggle paste mode with F2:
set pastetoggle=<F2>
" In normal mode, we get similar effects:
nnoremap <F2> i<F2>

" Do syntax highlighting please:
syntax on

if exists('&selection')
	set selection=exclusive
endif

set background=dark

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

" Fix the markdown mapping for 'md' extension:
au BufRead,BufNewFile *.md set filetype=markdown


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
set makeprg=make
nmap <F3> :wall<CR>:make!<CR><CR>:cw<CR>
" I like the normal-mode '=' key to rebuild.  A weird personal preference, so it's
" disabled here.  Uncomment if you agree.
" nnoremap = :wall<CR>:make!<CR><CR>:cn<CR>:cw<CR>




" Goto next error with F4:
nnoremap <F4> :cnext<CR>
" Goto prev error with ,F4:
nnoremap <leader><F4> :cprev<CR>

" SaveSession saves the current window/file layout into .taskrc/session.vim,
" so if you restart vim in this same directory it all gets restored
command! SaveSession mksession .taskrc/session.vim

" Without plugins, we can mimic a bit:
nnoremap <leader>n :buffers<CR>:buffer<Space>

" ,q will quit without saving, losing all unsaved changes:
nnoremap <leader>q :qa!<CR>

