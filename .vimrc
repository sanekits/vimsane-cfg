" Les Matheson's .vimrc
"
set nocompatible  " Keep this as first line always

" Reminders
" .........
"
" This section just provides reminders of commands that are handy but have not yet
" earned themselves a vimrc definition:
"
"    Reformat sentence:  gqis
"    "        paragraph: gqip
"
"    Change line width:  set textwidth=nnn
"
" >i{   << Shift block within {} to right
" 5>>   <  Shift 5 lines right
" >%    <  Shift within matching brace/parens
"
" In insert mode, Ctrl-T and Ctrl-D shift the current line right or left
"
" To resize a window vertically:
" 	  :resize 5  (make it 5 lines high)
" 	  :resize +5 (increase by 5 lines)
"
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Window switching is easier if you just take over the Ctrl+Dir sequence:
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

let mapleader=','
set t_Co=256
let g:Powerline_symbols = "fancy"
set laststatus=2
color blue
" Smart tabbing / autoindenting
set undolevels=100
set autoindent
set copyindent
"#set smarttab
"" Allow backspace to back over lines
set backspace=indent,eol,start
"#set exrc
set shiftwidth=4
set shiftround
set tabstop=4
" Number lines in the margin:
set number
set showmatch
" Disable case-sensitivity in searches
set ignorecase
set smartcase
" Highlight search matches:
set hlsearch
" Use incremental search:
set incsearch
"#set cino=t0
" I like it writing automatically on swapping
set autowrite
set nowrap
set updatetime=800
"set mouse=a
set showcmd
set title
set grepprg=ack-grep


filetype plugin indent on
set history=1000
set undolevels=1000

" We don't like a simple 'u' for undo, it's to easy to hit accidentally and
" make a mess. Our 'undo' is Ctrl+Z, like CUA
nnoremap <C-Z> u
inoremap <C-Z> <ESC>u
vnoremap <C-Z> u
nnoremap u <Nop>

" in vimdiff, the <leader>c goes to "next change", and
" <leader>v is "previous change"
map <leader>c ]c
map <leader>v [c

set wildignore=*.swp,*.bak,*.o,*.d
" Use jk in insert mode to get back to normal mode:
inoremap jk <ESC>
inoremap JK <ESC>

inoremap jj <Nop>
inoremap JK <ESC>
"# Display a menu of buffers with F5:
noremap <F5> :buffers<CR>:buffer<Space>
noremap <S-F5> :buffers<CR>:bd<Space>

" ,t starts insert mode and enters # TODO:
inoremap <leader>t <ESC>A<space>#<space>TODO:<space>
nmap <leader>t A<space>#<space>TODO:<space> 

" bufexplorer gets quick access with ',,'
nnoremap <silent> <leader>, :BufExplorer<CR>

" Load tags on startup.
set tags=./tags;/

"  Don't ever, ever, ever beep or flash at me:
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Insert mode, make preceding word uppercase:
imap <leader>U <Esc>mvviwU`va
" Normal mode, make preceding word uppercase:
nmap <leader>u viwue
nmap <leader>U viwUe

" Use <F9> repeatedly to double-width a text block.  (i.e. d o u b l e - w i d t h )
nmap <F9> a<space><ESC>l

" Compile and find next error:
nmap <F3> :make<CR><CR>:cn<CR>
imap <F3> <ESC>:w<CR>:make<CR><CR>:cn<CR>
nmap <F4> :cn<CR>


" In normal mode, hitting Esc turns off search highlights:
"  BAD MAPPING:  nmap <ESC> :nohl<CR>

noremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Fix C# triple-slash comment headers:
let g:load_doxygen_syntax=1

" SVN commands:
command! Svnadd !svn add %
command! Svnup !svn update
command! SvnCommitNomsg !svn commit -m "" %
command! Svnstat !svn status
command! Svndiff !svndiff %

" GIT commands:
command! Gitadd cd %:p:h | ! git add %

"# Cd to the directory of current buffer 
command! Cd cd %:p:h | pwd
command! Dirhere e %:p:h 
command! Ddd w | nohup dddbash % &
command! Run ! %
command! Chmodx ! chmod +x %
command! Mdownview w | ! firefox  %
command! Foxview w | ! firefox  %
command! Term w | !terminator &
command! La w | ! ls -a %:p:h
command! Multimarkdown w | ! multimarkdown % > /tmp/%:p:t.html && firefox /tmp/%:p:t.html &
command! Lirt w | ! ls -lirt %:p:h
"# Write a root-owned file:
command! Sudowrite w !sudo tee %
"# Reload .vimrc
command! Revimrc source ~/.vimrc
" Fix the dang keyboard mapping:
command! Kbfix !source /home/lmatheson/.Xmodmap

"# Session-opening commands:
command! Main OpenSession main
command! MyBackup OpenSession myBackup

"  ,q is quit without saving:
noremap <leader>q :qa!<CR>
"  ,d is delete-buffer:
noremap <leader>d :bd<CR>

" Don't allow automatic session saving.
:let g:session_autosave = 'no'


" Lifted from mswin.vim: -----------
" Use CTRL-Q to do what CTRL-V used to do (block select start)
noremap <C-Q>		<C-V>

" How could someone use 's' for anything except "save"??
nnoremap s :w<CR>

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste system clipboard:
map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

" In insert mode, pasting the 0 register is clunky (Ctrl+R, 0).  Shorten that
" to Ctrl-P
imap <C-P> <C-R>0


set backupdir=~/.vimtmp
set directory=~/.vimtmp,.


" Ctrl-S to save the file:
noremap <C-S> :w<CR>

" Next and prev buffer with F12, F11:
noremap <F12> :bnext<CR>
noremap <F11> :bprev<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-t> :TlistToggle<CR>
" Insert newlines from normal mode with Ctrl+Enter:
map <C-Enter> O<Esc>
" ctrl-a should select-all:
nnoremap <C-A> ggVG

" <leader>f goes to the alternate file
nnoremap <leader>f <C-^>

" shift-ctrl-m runs the most-recent-files menu
noremap <leader>m :MRU<CR>
let MRU_Window_Height = 25

" <leader>hh switches from C module to header (FSwitch plugin)
nmap <leader>hh  :FSHere<CR>

" <leader>w writes the file even if you forgot rootness:
nmap <leader>w :w !sudo tee %<CR>


"folding settings
set foldmethod=syntax   "fold based on syntax
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1
"set list
" Display whitespace:
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" syntax settings for shell syntax
let is_bash = 1 " our 'sh' Bourne shell is alias to bash
let sh_fold_enabled= 7 " enable all kinds of syntax folding

" Toggle paste mode:
set pastetoggle=<F2>
" In normal mode, we get similar effect:
nmap <F2> i<F2>

if exists('&selection')
	set selection=exclusive
endif

" From this link: http://superuser.com/questions/385553/making-the-active-window-in-vim-more-obvious, 
" supposed to make active window + line more obvious
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
if &t_Co > 2 || has("gui_running")
	syntax on
	colorscheme hemisu
else
  colorscheme evening
endif

if has("gui_running")
	" Make font larger (gvim only on Linux)
	" See plugin/gtk2fontsize.vim
	"source ~/.vim/plugin/gtk2fontsize.vim
	nmap <leader>+ :LargerFont<CR> 
	nmap <leader>= :LargerFont<CR> 
	nmap <leader>- :SmallerFont<CR> 
endif

set background=dark
syntax on

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " According to http://stackoverflow.com/a/8748154/237059, there's a bug in a
  " plugin which makes 'set formatoptions += {x}' malfunction.  Here's our
  " workaround:
  autocmd BufNewFile,BufRead * setlocal formatoptions+=cor
endif

" We do, in general, want formatoptions += c, o, r (see help fo-table).  This
" ensures that the comment leader is inserted in unsurprising ways when
" writing or editing comment blocks.
"set formatoptions += "c"  Disabled in favor of the autocmd hack above.
"set formatoptions += "o"
"set formatoptions += "r"
