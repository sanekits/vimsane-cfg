" ~/.vim/lmath-vimrc.vim
"
set nocompatible

let g:debug_enable=0

function! DebugMsg(msg)
    if exists("g:debug_enable")
        if g:debug_enable
            echom( "DebugMsg: [" . a:msg . "]")
        endif
    else
        echom "nope"
    endif

endfunction

call DebugMsg("Loading " . expand("<sfile>"))

" Capture the path of our own script for later refresh.
let g:vimrc_script_path = expand('<sfile>:p')
let $VIMHOME=expand('<sfile>:p:h')

let g:load_taskrcs=1
source $VIMHOME/vimsane.vim


" Reminders
" .........
"
"    Reformat sentence:  gqis
"            paragraph: gqip
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
" Enter ex mode: Q
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
"
" Tip: run one or more ex commands on startup, from shell:
"   $ vim -c "set makeprg=bin/build" -c "set nowrap" *.c *.h


au BufRead,BufNewFile *.jrnl  setfiletype jrnl

let g:tex_flavor = "latex"


" Execute (with vim ex commandline) the command text currently selected:
vnoremap <leader>v :<C-U>exec expand(getreg('*'))<CR>



" <leader>a/z are used for faster up/down:
" nnoremap <leader>a 15k
" nnoremap <leader>z 15j
" vnoremap <leader>a 15k
" vnoremap <leader>z 15j


" nnoremap <M-8> :colorscheme morning<CR>
" nnoremap <C-M-8> :colorscheme industry<CR>



"set mouse=a
set grepprg=ack


" Grep for the current word in current dir
"command! GrepWordHere grep '\b<cword\b' *
"nnoremap gR :grep '\<cword\>' *<CR>

"nnoremap gR :exec 'grep "' . expand('<cword>') . '" *<CR>'


set undofile
set undodir=~/.vimundo/



" We don't want no stinkin 'u' for 'undo'.
nnoremap u <Nop>




" Insert mode, make preceding word uppercase:
inoremap <leader>U <Esc>mvviwU`va
" Normal mode, make preceding word uppercase:
nnoremap <leader>u viwue
nnoremap <leader>U viwUe


" Use <Ctrl+F9> repeatedly to double-width a text block.  (i.e. d o u b l e - w i d t h )
nnoremap <C-F9> a<space><ESC>l


" map grok wrapper....
" Full text search:
nnoremap <leader>oga :!env grok <C-R>=shellescape(expand("<cword>"))<CR> \| less -ir<CR>
" definition search:
nnoremap <leader>ogd :!env grok -d <C-R>=shellescape(expand("<cword>"))<CR> \| less -ir<CR>
" symbol reference search:
nnoremap <leader>ogs :!env grok -r <C-R>=shellescape(expand("<cword>"))<CR> \| less -ir<CR>




" Gtags helpers:
"==============
    
"invoke Gtags [cursor-symbol] to find definition:
"map <C-[> :GtagsCursor<CR>  



" GIT commands:
" command! Gitadd cd %:p:h | ! git add %
" Make a script executable:

" command! Gitstatus ! git status

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



" The Astyle command will reformat the file
command! Astyle w | !astyle %; rm %.orig



" In visual mode, Shift-F8 will reformat the highlighted text:
vnoremap <S-F8> :!astyle<CR>



command! La w | ! ls -a %:p:h
command! Lirt w | ! ls -lirt %:p:h
"# Write a root-owned file:
command! Sudowrite w !sudo tee %
"# Reload .vimrc
command! Revimrc source ~/.vimrc




" Use CTRL-Q to mimic CTRL-V -- because that's what we're used to 
nnoremap <C-Q>		<C-V>


" How could someone use 's' for anything except "save"??  To substitute
" chars, we prefer '-' (think "strikeout")
nnoremap - s
nnoremap s :w<CR>




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



" Note on MoboXterm, I had to symlink from ~/.vim/colors to /usr/share/vim/vim74/colors 
" to get  any colorscheme to work.  This symlink is masked by .gitignore in .vim
"colorscheme desert

if has("gui_running")
	set guifont=Monospace\ 11
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
endif


" augroup  fmtOpts
"     autocmd!
"     autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"     " According to http://stackoverflow.com/a/8748154/237059, there's a bug in a
"     " plugin which makes 'set formatoptions += {x}' malfunction.  Here's our
"     " workaround:
"     autocmd BufNewFile,BufRead * setlocal formatoptions+=cor
" 
"     "let g:syntastic_cpp_compiler = 'g++'
"     "let g:syntastic_cpp_compiler = 'clang++'
"     "let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"     "au BufNewFile,BufRead *.cpp set syntax=cpp11
" augroup  END

" The clang_complete plugin needs the directory name containing libclang.so:
let g:clang_library_path='/opt/swt/lib'
let g:clang_complete_auto=1


function! EditSymfileUnderCursor()
    " cWORD gets the WORD at cursor:
    let l:xpath=expand("<cWORD>")
    " Invoke print-symbol-summary -p for the word under cursor.  That
    " script is in riddle/bin: 
    let l:sumfile=system( "print-symbol-summary " . l:xpath . " -p")
    " Split the window, load the file:
    exec ":sp " l:sumfile  
endfunction



"source $VIMHOME/all_color_codes.vim  " See this file for color code definitions


hi x019_Blue3 ctermfg=19 guifg=#0000af "rgb=0,0,175

colorscheme industry


