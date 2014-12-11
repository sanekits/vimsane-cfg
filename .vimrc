" Les Matheson's .vimrc
"
set nocompatible  " Keep this as first line always

set cmdheight=2   " A bit more room for the command line

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
" To diff two directories:
"   :DirDiff   <dir1>  <dir2>    "  The DirDiff plugin
"
" Tip: the 'has' command in vim can be used to test for a feature, e.g. 'if has("python") ...'
" 

"===========  Vundle start  ======================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'


"   Powerline went Big City, and vim-airline is its recommended replacement.
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'honza/vim-snippets'

if has("python")
    Plugin 'SirVer/ultisnips' " Depends on honza/vim-snippets
        "  Note: on my vaiop cygwin, I had to symlink from
        "  bundle/vim-snippets/UltiSnips to ~/.vim/UltiSnips to get this working.
        "  If python isn't compiled into vim, UltiSnips will not work.   On Cygwin,
        "  you have to build vim manually:  http://stackoverflow.com/a/14059666/237059
endif

    "-- someday.  Requires compiled clang  component:
"Plugin 'Valloric/YouCompleteMe'  

    " Taglist plugin:
Plugin 'file:///home/lmatheson/.vim/manual-repos/taglist_46'

Plugin 'Lokaltog/vim-easymotion'    
Plugin 'regedarek/ZoomWin'   "  Use 'Ctrl+W o'  to zoom or unzoom a window
"let g:clang_use_library=1  " Test: can we get clang_complete to work on cygwin?
"Plugin 'Rip-Rip/clang_complete'

" End of vundle initialization
call vundle#end()
filetype plugin indent on  " required

"==========   Vundle end ========================


"  UltiSnips settings:
"  ------------------
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"  "  Hop from $1 to $2, etc in a snippet
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"

    " If you want :UltiSnipsEdit to split your window.
    "let g:UltiSnipsEditSplit="vertical"





" Window switching is easier if you just take over the Ctrl+Dir sequence:
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

let mapleader=','
set t_Co=256
let g:Powerline_symbols = "fancy"
set laststatus=2 



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
set expandtab
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
set wrap
set linebreak  " if you do wrap, do it nicely (caution: this conflicts with 'set list', so you have to turn the latter off if you really want linebreak to work)
set updatetime=800

set showcmd
set title
set grepprg=ack-grep

nnoremap <leader><space> :set nocursorline<CR>

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
nnoremap <leader>c ]c
nnoremap <leader>v [c

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
nnoremap <leader>t A<space>#<space>TODO:<space> 

" bufexplorer gets quick access with ',n'
nnoremap <silent> <leader>n :BufExplorer<CR>

" Load tags on startup.
set tags=./tags;/

"  Don't ever, ever, ever beep or flash at me:
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" <leader>. -> open file browser in current dir
nnoremap <leader>. :e.<CR>

" Insert mode, make preceding word uppercase:
inoremap <leader>U <Esc>mvviwU`va
" Normal mode, make preceding word uppercase:
nnoremap <leader>u viwue
nnoremap <leader>U viwUe

" Use <F9> repeatedly to double-width a text block.  (i.e. d o u b l e - w i d t h )
nnoremap <F9> a<space><ESC>l

" Compile and find next error:
nnoremap <F3> :make<CR><CR>:cn<CR>
inoremap <F3> <ESC>:w<CR>:make<CR><CR>:cn<CR>
nnoremap <F4> :cn<CR>



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

" Purge local .pyc files
command! Pyclean !rm *.pyc

" GIT commands:
command! Gitadd cd %:p:h | ! git add %
" Gitsync adds the current file to git and commits+pushes, all in one step:
command! Gitsync ! cd %:p:h ; git add % ; git commit % -m "Gitsync from vim" ;  git push origin

"# Cd to the directory of current buffer 
command! Cd cd %:p:h | pwd
command! Dirhere e %:p:h 
command! Ddd w | ! nohup dddbash % &
command! Run ! %
command! Chmodx ! chmod +x %

" Copy a URL to the clipboard:
function! HandleURL()
  let s:uri = matchstr(getline("."), 'http:\/\/[^ >,;]*')

  if s:uri != ""
    let @+=s:uri 
    echo "URL " . @+ . "  has been copied to the clipboard register +"
  else
    echo "No URI found in line."
  endif
endfunction

map gx :call HandleURL()<cr>

" Gopen opens the active document with shell handler.   This is also
" mapped to <leader>g
command! Gopen ! gopen "%"
noremap <leader>g :!gopen "%" <CR><CR>

" To launch a mark URL, first capture the URL text , then pass
" it to gopen:
"nnoremap <leader>x yiW:!gopen <c-r>" &<cr>

" Find/Highlight text in braces[]:
nnoremap <leader>] /\[[^\]]*\]<cr>


" Sometimes you just need a pastebin in a browser, and you need
" it now:
command! Pastebin ! xdg-open http://pastebin.com
"noremap <leader>p :! xdg-open http://pastebin.com <CR><CR>

" Reformat paragraph:
nnoremap <leader>p gqip

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

" Riddlesnap takes a quick git snapshot of the state of riddle dir
command! Riddlesnap !$RIDDLE_HOME/bin/riddle-git-snapshot

"  ,q is quit without saving:
noremap <leader>q :qa!<CR>
"  ,d is close-window:
noremap <leader>d :close<CR>


" Use CTRL-Q to do what CTRL-V used to do (block select start)
noremap <C-Q>		<C-V>

" How could someone use 's' for anything except "save"??
nnoremap s :w<CR>


" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste system clipboard:
noremap <C-V>		"+gP
noremap <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

inoremap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>


set backupdir=~/.vimtmp
set directory=~/.vimtmp,.


" Ctrl-S to save the file:
noremap <C-S> :w<CR>

noremap <C-n> :NERDTreeToggle<CR>
noremap <C-t> :TlistToggle<CR>
" Insert newlines from normal mode with Ctrl+Enter:
"noremap <C-Enter> O<Esc>
" ctrl-a should select-all:
nnoremap <C-A> ggVG

" <leader>f goes to the alternate file
nnoremap <leader>f <C-^>

" shift-ctrl-m runs the most-recent-files menu
let MRU_Window_Height = 25

" <leader>hh switches from C module to header (FSwitch plugin)
nnoremap <leader>hh  :FSHere<CR>

" <leader>w writes the file even if you forgot rootness:
nnoremap <leader>w :w !sudo tee %<CR>


"folding settings
set foldmethod=syntax   "fold based on syntax
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

" 'set list' enables the display of whitespace, and 'set listchars' refines
" the behavior of that.  Use 'set nolist' to turn this off.
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set nolist

" syntax settings for shell syntax
let is_bash = 1 " our 'sh' Bourne shell is alias to bash
let sh_fold_enabled= 7 " enable all kinds of syntax folding

" Toggle paste mode:
set pastetoggle=<F2>
" In normal mode, we get similar effect:
nnoremap <F2> i<F2>

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


syntax on
" Note on MoboXterm, I had to symlink from ~/.vim/colors to /usr/share/vim/vim74/colors 
" to get  any colorscheme to work.  This symlink is masked by .gitignore in .vim
colorscheme desert



if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Consolas:h10:cANSI
    endif
	" Make font larger (gvim only on Linux)
	" See plugin/gtk2fontsize.vim
	"source ~/.vim/plugin/gtk2fontsize.vim
	nmap <leader>+ :LargerFont<CR> 
	nmap <leader>= :LargerFont<CR> 
	nmap <leader>- :SmallerFont<CR> 
   

	set guioptions-=T  " Remove the toolbar
endif

set background=dark
syntax on

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    " According to http://stackoverflow.com/a/8748154/237059, there's a bug in a
    " plugin which makes 'set formatoptions += {x}' malfunction.  Here's our
    " workaround:
    autocmd BufNewFile,BufRead * setlocal formatoptions+=cor

    "let g:syntastic_cpp_compiler = 'g++'
    let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
    "au BufNewFile,BufRead *.cpp set syntax=cpp11

endif

" We do, in general, want formatoptions += c, o, r (see help fo-table).  This
" ensures that the comment leader is inserted in unsurprising ways when
" writing or editing comment blocks.
"set formatoptions += "c"  Disabled in favor of the autocmd hack above.
"set formatoptions += "o"
"set formatoptions += "r"

" When we're  in wrap mode, the per-line (instead of per-display) vertical
" movement is disorienting.   This is cured by remapping j and k to gj and gk:
noremap j gj
noremap k gk

" wildmenu turns on the fancy visual display of <TAB> matches when doing
" command-line completion:
set wildmenu
noremap <leader>m :MRU<CR>


" Turn off highlighting after a search:
nnoremap <leader><space> :nohlsearch<CR>:set nocursorline<CR>
"
" I don't know who keeps turning on the cursorline option, but its annoying:
nnoremap <F12> :set nocursorline<CR>

" For html notes, 'lmx' is "my comments" and lmz is "highlighting the text"
" The styles can be inserted with UltiSnips ( lmx_styles<ctrl-j> )
inoremap <F8> <span class='lmx'>lmx:  </span><esc>7hi
nnoremap <F8> i<span class='lmx'>lmx:  </span><esc>7hi
inoremap <F9> <span class='lmz'>
nnoremap <F9> i<span class='lmz'><ESC>
inoremap <F10> </span>
nnoremap <F10> i</span><ESC>

"  Calibre-exported text support:
" Delete the line-level wrapper applied by Calibre:
nnoremap <C-I> 0xxxxxxxxxxxxxxxxxxxx/<\/p><cr>xxxxj0<ESC>:nohlsearch<CR>
" Same thing, but for start-of-paragraph, insert a <p/> above
nmap     <F12> <C-I>kO<p/><ESC>jj
"  Find a start-of-paragraph:
nmap   <C-P> /[0-9]\+<\/p<CR>





