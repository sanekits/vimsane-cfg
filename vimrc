" Les Matheson's .vimrc
"
set nocompatible  " Keep this as first line always

set cmdheight=2   " A bit more room for the command line
let mapleader=','

let $VIMHOME=expand('<sfile>:p:h')

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
"   :cold  << Go to previous quickfix contents
"   :cnew  >> Go to newer quickfix contents
"
" List all matching tags:
"   :tselect {name}
"
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
" Plugin managment: see this include file...

source $VIMHOME/manual-repos/plugin-list.vim  " Use external plugins list

" End of vundle initialization
call vundle#end()
filetype plugin indent on  " required

"==========   Vundle end ========================

" Fix the markdown mapping for 'md' extension:
au BufRead,BufNewFile *.md set filetype=markdown

au BufRead,BufNewFile *.jrnl  setfiletype jrnl

let g:tex_flavor = "latex"

" Experimenting with .vim/syntax/cel.vim
"au BufRead,BufNewFile *.stc setfiletype cel


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
    \   "csc2": '# ',
    \   "go": '// ',
    \   "java": '// ',
    \   "javascript": '// ',
    \   "make": '# ',
    \   "php": '// ',
    \   "python": '# ',
    \   "ruby": '# ',
    \   "tex": '%',
    \   "vim": '" ',
    \   "sh": '# ',
    \   "plaintex": '% ',
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

" <leader>. -> open file browser in current dir
nnoremap <leader>. :e .<CR>

" Window switching is easier if you just take over the Ctrl+Dir sequence:
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" <leader>a/z are used for faster up/down:
nnoremap <leader>a 15k
nnoremap <leader>z 15j
vnoremap <leader>a 15k
vnoremap <leader>z 15j



"let g:Powerline_symbols = "fancy"

" We always want a status line:
set laststatus=2   

" Smart tabbing / autoindenting
set autoindent
set copyindent

"" Allow backspace to back over lines
set backspace=indent,eol,start

set shiftwidth=4
set shiftround
set tabstop=4
set expandtab
set textwidth=256

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
set grepprg=ack


filetype plugin indent on
set history=1000
set undolevels=1000
set undofile
set undodir=~/.vimundo/

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
set tags=tags;/

"  Don't ever, ever, ever beep or flash at me:
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Page up, page down:
nnoremap fu <C-U>   
nnoremap fd <C-D>   
vnoremap fu <C-U>   
vnoremap fd <C-D>   



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

" map grok wrapper....
" Full text search:
nnoremap <leader>oga :!env grok <C-R>=shellescape(expand("<cword>"))<CR> \| less -ir<CR>
" definition search:
nnoremap <leader>ogd :!env grok -d <C-R>=shellescape(expand("<cword>"))<CR> \| less -ir<CR>
" symbol reference search:
nnoremap <leader>ogs :!env grok -r <C-R>=shellescape(expand("<cword>"))<CR> \| less -ir<CR>




" In normal mode, hitting Esc turns off search highlights:
"  BAD MAPPING:  nmap <ESC> :nohl<CR>

" Change to directory containing current file, for current window only:
noremap <leader>cd :lcd %:p:h<CR>:pwd<CR>

" Fix C# triple-slash comment headers:
let g:load_doxygen_syntax=1

" Gtags helpers:
"==============
    
"invoke Gtags [cursor-symbol] to find definition:
"map <C-[> :GtagsCursor<CR>  



" GIT commands:
command! Gitadd cd %:p:h | ! git add %
" Gitsync adds the current file to git and commits+pushes, all in one step:
command! Gitsync ! cd %:p:h ; git add % ; git commit % -m "Gitsync from vim" ;  git push origin

"# Change the directory of the current window based on loaded file path:
command! Lcd lcd %:p:h 
command! Dirhere e %:p:h 
command! Ddd w | ! nohup dddbash % &
command! Run ! %
command! Chmodx ! chmod +x %

function! s:ToxCore(dirFragment)
    let s:dirn=systemlist('rbuzz_rcd ' . a:dirFragment . " 1")[0]
    exe "lcd " . s:dirn
    echo "Changed dir to [" . s:dirn . "]"
endfunction

command! -nargs=1 Tox call s:ToxCore(<f-args>)

" Filelist invokes filelist-append.sh to add one or more files/groups to
" ./.filelist:
"  e.g.:  
"       :Filelist cpp h
"  
command! -nargs=1 Filelist execute "!filelist-append.sh" '<args>' | args .filelist


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


" The Astyle command will reformat the file
command! Astyle w | !astyle %; rm %.orig

" In visual mode, F8 will reformat the highlighted text:
vnoremap <F8> :!astyle<CR>
" Copy the current buffer's filename to the w register:
nnoremap <leader>F :let @w=expand("%:p:t")<CR>

" Replace the current word with contents of the w register:
nnoremap <leader>r viw"wp

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
"
" Find/Highlight text in braces[]:
nnoremap <leader>] /\[[^\]]*\]<cr>

" Sometimes you just need a pastebin in a browser, and you need
" it now:
command! Pastebin ! xdg-open http://pastebin.com
"noremap <leader>p :! xdg-open http://pastebin.com <CR><CR>

" <leader>p to reformat paragraph:
nnoremap <leader>p gqip

"command! Mdownview w | ! firefox  %
"command! Foxview w | ! firefox  %
"command! Term w | !terminator &
command! La w | ! ls -a %:p:h
"command! Multimarkdown w | ! multimarkdown % > /tmp/%:p:t.html && firefox /tmp/%:p:t.html &
command! Lirt w | ! ls -lirt %:p:h
"# Write a root-owned file:
command! Sudowrite w !sudo tee %
"# Reload .vimrc
command! Revimrc source ~/.vimrc
" Fix the dang keyboard mapping:
"command! Kbfix !source /home/lmatheson/.Xmodmap

" Riddlesnap takes a quick git snapshot of the state of riddle dir
command! Riddlesnap !$RIDDLE_HOME/bin/riddle-git-snapshot


" Run gvim with the current file
command! Gvim !gvim %

"  ,q is quit without saving:
noremap <leader>q :qa!<CR>
"  ,d to close window:
noremap <leader>d :close<CR>


" Use CTRL-Q to mimic CTRL-V -- because that's what we're used to 
noremap <C-Q>		<C-V>

" How could someone use 's' for anything except "save"??  To substitute
" chars, we prefer '-' (think "strikeout")
nnoremap - s
nnoremap s :w<CR>



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

" Doing ':Shell ls /' will load the ls output into a new
" buffer for edit/display.  Note that you can't pass wildcards to the args,
" haven't figured out why.
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'Cmd:  ' . a:cmdline)
  call setline(2, 'Expanded:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction



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
"colorscheme elflord
colorscheme solarized
if &diff
    colorscheme blue
endif

" Doing ':Shell ls /' will load the ls output into a new
" buffer for edit/display.  Note that you can't pass wildcards to the args,
" haven't figured out why.
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'Cmd:  ' . a:cmdline)
  call setline(2, 'Expanded:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction



" command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
" function! s:RunShellCommand(cmdline)
"   let isfirst = 1
"   let words = []
"   for word in split(a:cmdline)
"     if isfirst
"       let isfirst = 0  " don't change first word (shell command)
"     else
"       if word[0] =~ '\v[%#<]'
"         let word = expand(word)
"       endif
"       let word = shellescape(word, 1)
"     endif
"     call add(words, word)
"   endfor
"   let expanded_cmdline = join(words)
"   botright new
"   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
"   call setline(1, 'You entered:  ' . a:cmdline)
"   call setline(2, 'Expanded to:  ' . expanded_cmdline)
"   call append(line('$'), substitute(getline(2), '.', '=', 'g'))
"   silent execute '$read !'. expanded_cmdline
"   1
" endfunction

" Note on MoboXterm, I had to symlink from ~/.vim/colors to /usr/share/vim/vim74/colors 
" to get  any colorscheme to work.  This symlink is masked by .gitignore in .vim
"colorscheme desert

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
	nmap <leader>+ :LargerFont<CR> 
	nmap <leader>= :LargerFont<CR> 
	nmap <leader>- :SmallerFont<CR> 
	set guifont=Monospace\ 11
    set guioptions-=m  "remove menu bar
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

    "let g:syntastic_cpp_compiler = 'g++'
    "let g:syntastic_cpp_compiler = 'clang++'
    "let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
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
noremap j gj
noremap k gk

" Switch between .h and .cpp if they're in the same dir:
nnoremap <leader>x  :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>


" See http://superuser.com/a/418915 for this NERDtree workaround (needed on
" sunos, at least.  Probably others too)
let g:NERDTreeDirArrows=0
" wildmenu turns on the fancy visual display of <TAB> matches when doing
" command-line completion:
set wildmenu

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



" Same thing, but for start-of-paragraph, insert a <p/> above
nmap     <F12> <C-I>kO<p/><ESC>jj
"  Find a start-of-paragraph:
nmap   <C-P> /[0-9]\+<\/p<CR>

function! EditSymfileUnderCursor()
    " cWORD gets the WORD at cursor:
    let l:xpath=expand("<cWORD>")
    " Invoke print-symbol-summary -p for the word under cursor.  That
    " script is in riddle/bin: 
    let l:sumfile=system( "print-symbol-summary " . l:xpath . " -p")
    " Split the window, load the file:
    exec ":sp " l:sumfile  
endfunction

" Compile current module (convert  .h to .cpp automatically:)
"set makeprg=./compile-module\ %

" Position the cursor on a riddle symbol and use this to split/open the .summ:
nnoremap <leader>0 :call EditSymfileUnderCursor()<CR>

" If vim errors on startup, symlink: 'cd; ln ~/.vim/all_color_codes.vim ./'
source $VIMHOME/all_color_codes.vim  " See this file for color code definitions

hi x019_Blue3 ctermfg=19 guifg=#0000af "rgb=0,0,175

" The vimdiff colors are truly horrid.  Here's a fix attempt from
" http://stackoverflow.com/questions/1862423/how-to-tell-which-commit-a-tag-points-to-in-git

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red


set makeprg=make

" Generic build using local script:
"set makeprg=./build
"set makeprg=xbd5\ make\ --ccache\ -tS\ --check=gcc-wall\ xapapp3.tsk

" For eqstst, building a single module on linux:
"set makeprg=./xbuild.sh\ %
"
" --failpause means 'pause upon failure so I can read the outputr'
"set makeprg=./build\ --failpause
"set makeprg=./build
command! Roundtrip cd ~/riddle | ! bin/roundtrip



