" vim: textwidth=75 : 
"
"   >> Plugin maintenance notes:
"
"       >> Setting up a new machine:
"
"           > Vundle needs to get to github.com to work properly.  If you're
"           behind a proxy, do this: 
"
"               git config --global http.proxy [proxy address ]
"
"           > Clone Vundle itself:
"
"               cd ~/.vim
"               git clone 'https://github.com/VundleVim/Vundle.vim.git'
"               
"           > Start vim and run :PluginInstall
"           
"       >> Adding a plugin:
"           o  Add 'Plugin' statement below.  The name of the plugin is
"           normally the repo name on github.com, without the rest of the
"           URL.
"
"           o  Run ':PluginInstall' at the vim command line
"
"       >> Customizing a plugin:
"           o  Most plugins have options that can be set if you read the
"           help.  Recommended that you add the plugin-specific options
"           right after the Plugin definition below.
"
"       >> Disabling/removing a plugin:
"
"           o  Comment out the plugin definition and option settings, then
"           run ':PluginClean' at the vim command line.
"          
"


" =====================
"   vim-colors-solarized
" =====================
Plugin 'altercation/vim-colors-solarized'
    set background=dark
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1


"======================
"  tabular + vim-markdown
"======================
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'



" =====================
"   vim-fugitive
" =====================
    " Vim-fugitive is a git integration plugin from Tim Pope, who's sort of
    " an icon in the enclosed world of vim plugin-writers.
Plugin 'tpope/vim-fugitive'




" =====================
"   incsearch.vim
" =====================
    " incsearch.vim is a plugin which displays all matches as you type a
    " search string. This replaces the vim built-in incremental search if
    " the key mappings below are enabled.
Plugin 'haya14busa/incsearch.vim'
"     nnoremap /  <Plug>(incsearch-forward)
"     vnoremap /  <Plug>(incsearch-forward)
"     nnoremap ?  <Plug>(incsearch-backward)
"     vnoremap ?  <Plug>(incsearch-backward)
"     nnoremap g/ <Plug>(incsearch-stay)
"     vnoremap g/ <Plug>(incsearch-stay)




" =====================
"   nerdtree
" =====================
    " Nerdtree is a popular plugin which provides a file-browser interface
    " for choosing files to edit:
Plugin 'scrooloose/nerdtree'
    " See http://superuser.com/a/418915 for this NERDtree workaround (needed on
    " sunos, at least.  But why would anybody be using sunos??)
    " let g:NERDTreeDirArrows=0
    set encoding=utf-8
    let NERDTreeShowHidden=1    " Show hidden files




" =====================
"   xterm-color-table
" =====================
    " Use :XtermColorTable  to show all the colors.  Pretty, and sometimes
    " useful.
Plugin 'guns/xterm-color-table.vim'




" ======================
"    jedi-vim
" ======================
    " jedi-vim plugin:
"Plugin 'davidhalter/jedi-vim'
   " Their 'usages' default conflicts with bufexplorer
   " <leader>n:
"   let g:jedi#usages_command=""
"   let g:jedi#popup_on_dot=""




    "  BufExplorer lets you navigate through multiple buffers conveniently:
Plugin 'jlanzarotta/bufexplorer'
  let g:bufExplorerShowRelativePath=1  " Show relative paths.
  let g:bufExplorerSortBy='mru'        " Sort by most recently used.
  " bufexplorer gets quick access with ',n'
  nnoremap <silent> <leader>n :BufExplorer<CR>




" =====================
"   vim-airline
" =====================
  " Vim-airline is a popular plugin which puts a fancy status line
  " at the bottom of vim, with many options.
Plugin 'Stabledog/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
  " vim-airline color tweaking...
  ": AirlineTheme 'kolor'
  let g:airline_theme='kolor'

  " Airline has its own plugins! This one adds a clock:
Plugin 'enricobacis/vim-airline-clock'






" =====================
"   vim-peekaboo
" =====================
    " Vim-peekaboo shows a pop-up window displaying register contents when
    " you press Ctrl+R in insert mode, or quote(") in normal mode. You're
    " peeking at the registers.  Handy, and also helps you to learn the vim
    " register usage.
Plugin 'junegunn/vim-peekaboo'




" =====================
"   vim-signature
" =====================
Plugin 'kshenoy/vim-signature'
    nmap <leader>` :SignatureListGlobalMarks<CR>  




" =====================
"   syntastic
" =====================
" Plugin 'manual-repos/syntastic'





" =====================
"   vim-snippets
" =====================
"Plugin 'manual-repos/vim-snippets'



" =====================
"   ALE
" =====================
"Plugin 'manual-repos/w0rp/ale'   ALE: Asynchronous Lint Engine




" =====================
"   Ultisnips
" =====================
"    Plugin 'SirVer/ultisnips' " Depends on honza/vim-snippets
    "  Note: on my vaiop cygwin, I had to symlink from
    "  bundle/vim-snippets/UltiSnips to ~/.vim/UltiSnips to get this working.
    "  If python isn't compiled into vim, UltiSnips will not work.   On Cygwin,
    "  you have to build vim manually:  http://stackoverflow.com/a/14059666/237059


    "  Use :UltiSnipsEdit to see the snippets available
    "  Use <c-j> to trigger expansion of a snippet key, e.g.:
    "       1. Insert 'map' in the code
    "       2. Press Ctrl+J to expand it as shown in the snippet definition.
    "       3. Use Ctrl+J again to go to the next param field in the snippet,
    "       if any.
    "       4. Use <Ctrl+K> to go backward in param field



" =====================
"   Ctrl-P
" =====================
" Ctrl-P is popular, uncomment-this to enable it:
" Plugin 'ctrlpvim/ctrlp.vim'
"     let g:ctrlp_show_hidden=1
"     let g:ctrlp_root_markers=['.taskrc','.git']
"     let g:ctrlp_types=['buf','fil','tag']



" =====================
"   YouCompleteMe
" =====================
"-- (someday).  Requires compiled clang  component:
"Plugin 'manual-repos/YouCompleteMe'  " @Valloric/YouCompleteMe
    " The clang_complete plugin needs the directory name containing libclang.so:
    "     let g:clang_library_path='/opt/swt/lib'
    "     let g:clang_complete_auto=1




" =====================
"   Taglist
" =====================
    " Taglist plugin:
"Plugin 'file:///home/lmatheson4/.vim/manual-repos/taglist_46'



" =====================
"   typescript-vim
" =====================
    " typescript-vim plugin:
Plugin 'leafgarland/typescript-vim'



" =====================
"   easymotion
" =====================
    " easymotion plugin:
Plugin 'easymotion/vim-easymotion'


