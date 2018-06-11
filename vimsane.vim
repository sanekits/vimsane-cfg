" vimsane.vim vim: textwidth=75 :
" Les Matheson - lmatheson4@bloomberg.net
"
" Extreme basics:
" ==============
"    Enter insert mode:     i
"    Leave insert mode:     <ESC>
"    Write file to disk:    :w[enter]
"    Change window right:   Ctrl+L
"    Change window left:    Ctrl+H
"    Exit vim:              :q[enter]

" What is vimsane?
" ================
" vimsane is a Bloomberg-oriented, pre-packaged Vim configuration offered
" to those who want to learn the Vim editor but don't understand Vim well
" enough to set it up sanely.
"
" Vim can be intimdating and frustrating to new users, and the learning
" curve is long, so Vimsane exists to help you become reasonably competent
" quickly. By bundling some help with a few popular vim plugins and sane
" configuration choices, the initial learning curve is made gentler for
" newcomers.
"
" While you can use vimsane as your daily editor for the long term, you're
" encouraged to learn how to customize and extend Vim, and you'll probably
" want to leave vimsane behind as you do that.  This is training wheels,
" not a racing bike.
"
" If you're brand new, it's recommended to print these instructions and
" keep them handy while you're working.

" Sales pitch:
" ============
" The time spend learning Vim is an investment. One must accept that
" productivity will drop before it recovers: ordinary things will take a
" long time, and you'll think 'I could have been done by now with a GUI
" editor!' 
"
" But that's a short-sighted viewpoint: yes, the GUI will get you to the
" boarding gate quicker, but it's a long flight.  Presumably you will be a
" software engineer for decades, and on that scale, the advantages of Vim
" proficiency will beat all GUI editor choices by a huge margin.
"
" With Vim, you and the editor will become a single deeply interwoven
" system that evolve together and go everywhere as a unit. You'll complete
" each other's thoughts, you'll share socks, you'll become Edward
" Scissorhands watching your ideas turn into code with no consciousness of
" the mechanical process involved. 
"
" Your hands and the keyboard will merge and you'll stop spending precious
" mental energy and movement time on the interface between your brain and
" the code.  No GUI will ever become a direct pipe from your mind to the
" text like that. This is why something as ugly and unfriendly as Vim
" continues to thrive year after year, even as wave after wave of sexier
" alternatives proliferate.
"
" So I encourage you to bite the bullet and take your pain -- learn The One
" True Editor(tm), and meld with the machine.  It only hurts for a while,
" and vimsane will reduce some of that sting. After that, you'll fly past
" your GUI-bound peers and smile with merciful pity in your eye: `you poor
" things!'

" What about emacs?
" ================= 
" Yes, there's another `editor' called emacs which has ensnared many of the
" unenlightened. `emacs' is an acronym that expands to various metaphors
" that express how it kills the spirit and pollutes the basic bodily
" fluids.  If you go that way, expect no mercy from the gods when your soul
" is finally judged.  But hey: it's a free country.

" Just the basic concepts:
" ========================

" Vim is a modal editor: the meaning of keys is radically affected by the
" current mode.  If you just start typing without knowing what mode you're
" in, you will almost surely be surprised by the outcome.
"
" There are two modes that are most important: 'normal' mode is anything
" but normal to those who arrive from other editors -- in normal mode, your
" fingers are talking to the control logic of the editor, issuing commands
" to move around in documents, change files, reposition windows, reformat,
" and so forth.  
"
" Everything in Vim is tuned to the idea that you do not want to move your
" hands far from the home row on the keyboard -- being a touch typist is
" pretty much assumed.  (Note: If you aren't a touch typist, and you've
" chosen programming as a career, stop worrying about Vim and learn to type
" properly first.) 
"
" Since there are a limited number of keys in close proximity to the home
" row, the meaning of those keys in normal mode is opaque and must be
" learned the old-fashioned way, but once learned, the practice of those
" operations is very efficient.
"
" The other really-important mode is 'insert mode': this is where you type
" and your keystrokes are mostly turned into text in an unsurprising way.
" Insert mode is not 'pure' -- Vim provides interpretation for certain key
" sequences that goes beyond simply 'insert the keystroke into the document
" as a character', and you can customize insert mode extensively too.
"
" But in general, you use insert mode to enter text, and you use normal
" mode to do almost everything else, and you switch between these modes
" rapidly and frequently... always aware of the current mode, your fingers
" learn patterns that encode this knowledge and you stop thinking about it
" after a while.
"
" Other modes you'll learn as you go. But when using Vim, the most important
" thing to know is `am I in insert mode or normal mode'? With vimsane,
" you'll see the text `--INSERT--' at the lower left corner of the window
" when you're insert mode.

" Practice as a practice:
" ======================
" Nobody can pour the Vim manual into their brain in a brief period of
" time.  You should expect that you'll learn stuff, use it on a daily
" basis, then learn more stuff and practice that to integrate it with your
" muscle memory.  This will occur over and over again -- each new wave of
" skills will make you more efficient, but you need to keep taking on those
" next waves: once you get competent at what you already know, reach out
" and grab some more tips and start using them on a daily basis.
"
" Practice is a long-term commitment here: if you get complacent and think
" `my Vim skills are good enough now', then you'll waste much of the power
" of Vim and not achieve the productivity gains that pay for the learning
" curve.  If that happens, then you've tormented yourself with an ugly
" editor in order to be no more productive than one of those GUI snails.

" About vimtutor
" ==============

" If you run 'vimtutor' from the unix shell, you'll get the classic vim
" tutor, which munges your configuration a bit and then loads a copy of a
" static tutorial file -- so you can mess up the file without losing
" anything important as you read and practice its instructions.
"
"   $ vimtutor
"
" This is worth 30 min of your time to practice the basic commands.  It
" doesn't go very deep, but it does a decent first whack and helps you to
" function in vim if you're totally new.
"
" Recommended: study the cheatsheet
" =================================
" https://github.com/sanekits/vimtips/blob/master/vim-cheatsheet.png


" Why CAPSLOCK is Satan:
" ====================== 

"  In Vim's normal mode, a capital letter has a completely different
"  meaning than a lower-case letter most of the time.  To maximize the
"  value of home-row proximity, many Vim (and emacs) programmers use their
"  operating system's keyboard controls to re-map the Capslock key to
"  become <ESC> or <CTRL>, which produces more efficient hand positioning
"  for rapid work.
"
"  But if the Vim user moves to a different computer, the Capslock becomes
"  Capslock again, and their hard-won finger skills become deadly:
"  accidentally hitting the Capslock key because they're used to it being
"  friendly, they decimate their document with errant capital letters in
"  normal mode.
"
"  My solution to this is analog but effective: I keep an office binder
"  clip with me, and break off the end of a wooden coffee stirrer, using
"  the pair to clamp the Capslock key into the inactive state.  While I
"  lose a bit of efficiency from the loss of my nearby <CTRL> key, I regain
"  my sanity by not throwing errant capital letters at normal mode.
"
"  Really, though, Capslock is a rarely used key that does not deserve such
"  a prominent and valuable piece of real estate on the keyboard, even for
"  non-Vim users.  If it must exist, it should be far from the home row.
"  That's why it's Satan: bad design, oft repeated.
"
"  There is another solution for those who use X-window terminals like
"  xterm or gnome-terminal: add the following to your shell's init file
"  (e.g. ~/.bashrc), to tell the X keyboard handler to ignore Capslock
"  by adding the following to your shell startup file (e.g. ~/.bashrc, 
"  ~/.kshrc, or  ~/.profile, etc)
"
"       xmodmap -e "remove lock = Caps_Lock"
"
"  </Preaching>


" _level1_
" ====================================================
" Level 1:  Basic things you really should learn first
" ====================================================
"
"  *VS* : This marker indicates something that only works if you're using
"         vimsane.
" 
"   Mode switching:
"   - - - - - - - -
"   i --> Enter insert mode (so you can modify text)
"
"   <ESC> --> Return to normal mode ( OR...)
"   jk    --> Return to normal mode *VS*
"
"
"   File operations:
"   - - - - - - - -
"   :args [file*]  --> Open one or more files, with name matching
"   :w [filename]  --> Write current file to disk
"   <F10> --> Show a list of open files *VS* with selection prompt.
"   :b [number or filename-fragment]  --> Switch to matching file
"
"
"   Quitting Vim:
"   - - - - - - -
"   :q   --> Exit vim, prompt for save if necessary
"   :qa! --> Exit without saving anything
"   
"
"   Moving the cursor:
"   - - - - - - - - - 
"   h,l,k,j --> Basic cursor movements for left, right, up, and down
"
"
"   Undo
"   - - -
"   Ctrl-z  --> Undo a change *VS*
"   Ctrl-r  --> Redo a change
"
"
"   Copy/paste
"   - - - - - -
"   V -->   Select a block of text: V (and then move up or down 
"           to extend the selection.)
"
"   y -->   copY selected block of text (i.e. "yank")
"   d -->   Delete selected block of text (i.e. "cut")
"   p -->   Paste text
"
"   F2 -->  Toggle paste-mode *VS*. (If you paste with the middle-mouse
"           button from another application, you want to be in paste
"           mode first so the indenting of the pasted text doesn't
"           get messed up.)
"
"
"   

" =======================================
" Level 2:  A bit more advanced:
" =======================================
"
"
" F3  --> Build menu (if filetype=cpp)
" F4  --> Goto next compile error 
" ,F4 --> Goto previous compile error 

"
" Normalize split sizes, handy when resizing a terminal:
"
"   ctrl+w = 
"
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

" ===========================
" Level 3:  Onward and upward
" ===========================
"
"   File operations:
"   - - - - - - - -
"   ,.  --> Open directory browser at current dir *VS*
"   ,m  --> Open recent-files list *VS*
"   ,n  --> Open browser of currently-loaded files *VS*


set nocompatible  " Keep this at the top of the file. We don't do vi compatibility


call DebugMsg( "Loading [" . expand('<sfile>') . "]" )

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

" In vim's defaults, the normal-mode 's' is mapped to 'substitute chars'.
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


" We do, in general, want formatoptions += c, o, r (see help 
" fo-table).  This ensures that the comment leader is inserted in 
" unsurprising ways when writing or editing comment blocks:
set formatoptions += "c" 
set formatoptions += "o"
set formatoptions += "r"



" The default colorscheme for vimsane.  Try :colorscheme <tab> to
" cycle through the available choices.
colorscheme industry1

if &diff " If we're started in diff mode, choose a useful 
         " color scheme, instead of the default.
    colorscheme blue
endif

" The vimdiff colors are truly horrid.  Here's a fix from
" http://stackoverflow.com/questions/1862423/how-to-tell-which-commit-a-tag-points-to-in-git

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red




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
	" If you don't need these other gui-ish hacks, or just
	" want to prove your street cred, you can turn them off in gvim:
	"
    "     set guioptions-=m  "remove menu bar
    "     set guioptions-=T  "remove toolbar
    "     set guioptions-=r  "remove right-hand scroll bar
    "     set guioptions-=L  "remove left-hand scroll bar

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

" Plugins are extension scripts produced by 3rd parties that add
" features to vim.  Vimsane includes a few of the most popular
" plugins pre-configured, you can see what they 
" are in ~/.vim/manual-repos/plugin-list.vim
if filereadable(expand("$VIMHOME/load-plugins.vim"))
    source $VIMHOME/load-plugins.vim
endif


" ,m -> Load the most-recently-used (MRU) window.
" (See plugins/mru.vim)
nnoremap <leader>m :MRU<CR>
let MRU_Window_Height = 25




" Some helpers for fsd training.  If you're not an FSD trainee,
" you can remove this without loss:
if filereadable(expand("$VIMHOME/fsd-train.vim"))
    source $VIMHOME/fsd-train.vim  
endif



" If you create a ~/.taskrc directory (or ./.taskrc within your
" working dir), we'll load any scripts that have a .vim extension.
" This is handy for your project-specific or directory-specific
" settings.  You could, for example, have a script that loads
" all of the .cpp/.h/.mk files, but ignores those generated by
" bas_codegen.py:
"
" This can be turned off in the parent script by undefining
" 'load_taskrcs':
if exists("g:load_taskrcs") 
    if g:load_taskrcs
        source $VIMHOME/load-task-rcs.vim
        call LoadTaskRcs("~/.taskrc")
        call LoadTaskRcs(".taskrc")
    endif
else
    echom "Skipped LoadTaskRcs:0"
endif

let g:vimsane_loaded=1



