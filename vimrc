" Les Matheson's .vimrc
"
set nocompatible  " Keep this as first line always
set cmdheight=2   " A bit more room for the command line
let mapleader=','

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
" 	  :res 5  (make it 5 lines high)
" 	  :res +5 (increase by 5 lines)
"
" Change width of a window:
"   Ctrl+W {count} >
"   Ctrl+W {count} <
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
"
" List all matching tags:
"   :tselect {name}
"
" Diff 2 directories:
"   :DirDiff <dir1> <dir2>
"
"

"===========  Vundle start  ======================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'


"   Powerline went Big City, and vim-airline is its recommended replacement.
Plugin 'file:///home/lmatheson4/.vim/manual-repos/vim-airline'
Plugin 'file:///home/lmatheson4/.vim/manual-repos/syntastic'
Plugin 'file:///home/lmatheson4/.vim/manual-repos/nerdtree'
Plugin 'file:///home/lmatheson4/.vim/manual-repos/bufexplorer'
  let g:bufExplorerShowRelativePath=1  " Show relative paths.
  let g:bufExplorerSortBy='mru'        " Sort by most recently used.

Plugin 'file:///home/lmatheson4/.vim/manual-repos/vim-snippets'
Plugin 'file:///home/lmatheson4/.vim/manual-repos/ultisnips' " Depends on honza/vim-snippets
    "  Note: on my vaiop cygwin, I had to symlink from
    "  bundle/vim-snippets/UltiSnips to ~/.vim/UltiSnips to get this working.
    "
    "  Use :UltiSnipsEdit to see the snippets available
    "  Use <c-j> to trigger expansion of a snippet key, e.g.:
    "       1. Insert 'map' in the code
    "       2. Press Ctrl+J to expand it as shown in the snippet definition.
    "       3. Use Ctrl+J again to go to the next param field in the snippet,
    "       if any.
    "       4. Use <Ctrl+K> to go backward in param field

    "-- someday.  Requires compiled clang  component:
"Plugin 'file:///home/lmatheson4/.vim/manual-repos/YouCompleteMe'  

    " Taglist plugin:
Plugin 'file:///home/lmatheson4/.vim/manual-repos/taglist_46'

  " Easy motion uses <leader><leader>{object} as its basic input model.
  " So ",,j" will highlight lines and ",,w" will do the same for words.
Plugin 'file:///home/lmatheson4/.vim/manual-repos/vim-easymotion'
Plugin 'file:///home/lmatheson4/.vim/manual-repos/ZoomWin'

" Use :Bdelete to close a buffer without closing the window too:
Plugin 'file:///home/lmatheson4/.vim/manual-repos/vim-bbye'

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




" Commenting blocks of code.
" --------------------------
    let s:comment_map = {
    \   "c": '// ',
    \   "cpp": '// ',
    \   "go": '// ',
    \   "java": '// ',
    \   "javascript": '// ',
    \   "php": '// ',
    \   "python": '# ',
    \   "ruby": '# ',
    \   "vim": '" ',
    \   "sh": '# ',
    \ }

    function! ToggleComment()
        if has_key(s:comment_map, &filetype)
            let comment_leader = s:comment_map[&filetype]
            if getline('.') =~ "^" . comment_leader
                " Uncomment the line
                execute "silent s/^" . comment_leader . "//"
            else
                " Comment the line
                execute "silent s/^/" . comment_leader . "/"
            endif
        else
            echo "No comment leader found for filetype"
        end
    endfunction

    "  Use <leader>1 (the number 1, not lower-case L) to toggle  comments.  Add
    "  new file types above as needed.
    nnoremap <leader>1 :call ToggleComment()<cr>
    vnoremap <leader>1 :call ToggleComment()<cr>


set t_Co=256

" We frequently want to show the contents of the current dir:
nnoremap <leader>. :e .<CR>

" Window switching is easier if you just take over the Ctrl+Dir sequence:
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" <leader>a/z are used for faster up/down:
nnoremap <leader>a 10k
nnoremap <leader>z 10j
vnoremap <leader>a 10k
vnoremap <leader>z 10j



"let g:Powerline_symbols = "fancy"

" We always want a status line:
set laststatus=2   
color blue

" Smart tabbing / autoindenting
set undolevels=100
set autoindent
set copyindent

"" Allow backspace to back over lines
set backspace=indent,eol,start

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

" How to turn off the search highlights and the annoying 'cursorline' option:
nnoremap <leader><space> :nohlsearch<CR>:set nocursorline<CR>

" Use incremental search:
set incsearch

" I like it writing automatically on swapping
set autowrite
set wrap
set linebreak  " if you do wrap, do it nicely (caution: this conflicts with 'set list', so you have to turn the latter off if you really want linebreak to work)
set updatetime=800
"set mouse=a
set showcmd
set title
set grepprg=ack-grep\ <cword>\ *.cpp\ *.h


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

" Insert mode, make preceding word uppercase:
inoremap <leader>U <Esc>mvviwU`va
" Normal mode, make preceding word uppercase:
nnoremap <leader>u viwue
nnoremap <leader>U viwUe

" Use <F9> repeatedly to double-width a text block.  (i.e. d o u b l e - w i d t h )
nnoremap <F9> a<space><ESC>l

" Compile and find next error:
nnoremap <F3> :wall<CR>:make!<CR><CR>:cn<CR>:cw<CR>
inoremap <F3> <ESC>:w<CR>:make!<CR><CR>:cn<CR>:cw<CR>
nnoremap <F4> :cn<CR>

nnoremap <leader>] /\[ \]<cr>



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


command! Astyle w | !astyle %; rm %.orig
" Copy the current buffer's filename to the w register:
nnoremap <leader>F :let @w=expand("%:p:t")<CR>

" Replace the current word with contents of the w register:
nnoremap <leader>r viw"wp
inoremap <leader>r <C-R>w


" Run Conque bash in split
command! Term ConqueTermVSplit bash
noremap <leader><F8> :ConqueTermSplit bash<CR>
noremap <leader><F9> :ConqueTermVSplit bash<CR>

" Gopen opens the active document with shell handler.   This is also
" mapped to <leader>g
command! Gopen ! xdg-open %
noremap <leader>g :!xdg-open % <CR><CR>

" To launch a mark URL, first capture the text in parens, the pass
" it to xdg-open:
"nnoremap <leader>x yi):!xdg-open <c-r>" &<cr>
" Same thing for stuff that isn't wrapped in parens:
"nnoremap <leader>X yiW:!xdg-open <c-r>" &<cr>

" Sometimes you just need a pastebin in a browser, and you need
" it now:
command! Pastebin ! xdg-open http://pastebin.com

" <leader>p to reformat paragraph:
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

"# Session-opening commands:
command! Main OpenSession main
command! MyBackup OpenSession myBackup

"  ,q is quit without saving:
noremap <leader>q :qa!<CR>
"  ,d to close window:
noremap <leader>d :close<CR>

" Don't allow automatic session saving.
:let g:session_autosave = 'no'


" Lifted from mswin.vim: -----------
" Use CTRL-Q to mimic CTRL-V -- because that's what we're used to 
noremap <C-Q>		<C-V>

" How could someone use 's' for anything except "save"??  To substitute
" chars, we prefer '-' (think "strikeout")
nnoremap - s
nnoremap s :w<CR>


" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" -V and SHIFT-Insert are Paste system clipboard:
"noremap <C-V>		"+gP
noremap <S-Insert>		"+gP

"cnoremap <C-V>		<C-R>+
cnoremap <S-Insert>		<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

"exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
"exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" Something we really don't like: pasting replaces the contents of the unnamed
" buffer '*', which is almost always the wrong behavior.  So we're going out
" on a limb here with the draconian policy of "always paste from 0 register
" from normal mode". 
"nnoremap p "0p
"vnoremap p "0p

"inoremap <S-Insert>		<C-V>
"vnoremap <S-Insert>		<C-V>

" In insert mode, pasting the 0 register is clunky (Ctrl+R, 0).  Shorten that
" to Ctrl-P
inoremap <C-P> <C-R>0


set backupdir=~/.vimtmp
set directory=~/.vimtmp,.


" Ctrl-S to save the file:
noremap <C-S> :w<CR>

" Next and prev buffer with F12, F11:
noremap <F12> :bnext<CR>
noremap <F11> :bprev<CR>
noremap <C-n> :NERDTreeToggle<CR>
noremap <C-t> :TlistToggle<CR>
" Insert newlines from normal mode with Ctrl+Enter:
noremap <C-Enter> O<Esc>
" ctrl-a should select-all:
nnoremap <C-A> ggVG

" <leader>f goes to the alternate file
nnoremap <leader>f <C-^>

" shift-ctrl-m runs the most-recent-files menu
noremap <leader>m :MRU<CR>
let MRU_Window_Height = 25


" <leader>hh switches from C module to header (FSwitch plugin)
nnoremap <leader>hh  :FSHere<CR>

" <leader>w copies the current word to the w register.  
nnoremap <leader>w :let @w=expand("<cword>")<CR>
nnoremap <leader>W :let @w=expand("<cWORD>")<CR>

"  Expand the current window horizontally +20:
nnoremap <leader>> <C-W>20>
"  Shrink the current window horizontally -20:
nnoremap <leader>< <C-W>20<

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
colorscheme elflord


if has("gui_running")
	" Make font larger (gvim only on Linux)
	" See plugin/gtk2fontsize.vim
	"source ~/.vim/plugin/gtk2fontsize.vim
	nmap <leader>+ :LargerFont<CR> 
	nmap <leader>= :LargerFont<CR> 
	nmap <leader>- :SmallerFont<CR> 
    "set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
endif

set background=dark
syntax on

augroup  fmtOpts
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    " According to http://stackoverflow.com/a/8748154/237059, there's a bug in a
    " plugin which makes 'set formatoptions += {x}' malfunction.  Here's our
    " workaround:
    autocmd BufNewFile,BufRead * setlocal formatoptions+=cor

    let g:syntastic_cpp_compiler = 'g++'
    "let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
    "au BufNewFile,BufRead *.cpp set syntax=cpp11
augroup  END

" The clang_complete plugin needs the directory name containing libclang.so:
let g:clang_library_path='/opt/swt/lib'
let g:clang_complete_auto=1


" We do, in general, want formatoptions += c, o, r (see help fo-table).  This
" ensures that the comment leader is inserted in unsurprising ways when
" writing or editing comment blocks.
"set formatoptions += "c"  Disabled in favor of the autocmd hack above.
"set formatoptions += "o"
"set formatoptions += "r"

" When we're  in wrap mode, the per-line (instead of per-display) vertical
" movement can be disorienting.   This is cured by remapping j and k to gj and gk:
"noremap j gj
"noremap k gk

" Switch between .h and .cpp if they're in the same dir:
nnoremap <leader>x  :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>


" See http://superuser.com/a/418915 for this NERDtree workaround (needed on
" sunos, at least.  Probably others too)
let g:NERDTreeDirArrows=0
set wildmenu

"set makeprg=plink\ -d\ big2014.25-620474-20140617093254\ -a\ sundev1\ m_eqstst.mk
"set makeprg=plink\ m_eqstst.mk

"set makeprg=make
"set makeprg=~/bin/build-ssh\ sdv61\ eqstst

set makeprg=ssh\ -t\ sdv61\ '~/bin/buildsrv-send\ eqstst'
"set makeprg=ssh\ -t\ sdv61\ '~/bin/buildsrv-send\ test2'
"set makeprg=ssh\ -t\ sdv61\ '~/bin/buildsrv-send\ eqstst-all'
"set makeprg=ssh\ -t\ ibm9\ '~/bin/buildsrv-send\ eqstst'


source /bbsrc/princeton/skunk/vim/cursor.vim

