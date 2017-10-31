" vim: textwidth=75 : 
"
"   >> Operation notes ------------------ 
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

"Plugin 'manual-repos/vim-colors-solarized'  " @altercation/vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'
    set background=dark
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1

Plugin 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_show_hidden=1
    let g:ctrlp_root_markers=['.taskrc','.git']
    let g:ctrlp_types=['buf','fil','tag']


Plugin 'haya14busa/incsearch.vim'
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)


Plugin 'scrooloose/nerdtree'
    " See http://superuser.com/a/418915 for this NERDtree workaround (needed on
    " sunos, at least.  Probably others too)
    "let g:NERDTreeDirArrows=0
    set encoding=utf-8
    let NERDTreeShowHidden=1    " Show hidden files

    "noremap <C-n> :NERDTreeToggle<CR>

Plugin 'guns/xterm-color-table.vim'
Plugin 'jlanzarotta/bufexplorer'
  let g:bufExplorerShowRelativePath=1  " Show relative paths.
  let g:bufExplorerSortBy='mru'        " Sort by most recently used.


Plugin 'Stabledog/vim-airline'

Plugin 'vim-airline/vim-airline-themes'
  " vim-airline color tweaking...
  ": AirlineTheme 'kolor'
  let g:airline_theme='kolor'

Plugin 'enricobacis/vim-airline-clock'
Plugin 'junegunn/vim-peekaboo'
"Plugin 'kshenoy/vim-signature '
    nmap <leader>` :SignatureListGlobalMarks<CR>  " vim-signature mapping

" Plugin 'manual-repos/syntastic'
"Plugin 'manual-repos/vim-snippets'
"Plugin 'manual-repos/w0rp/ale'  " ALE: Asynchronous Lint Engine

if has("python")
"    Plugin 'SirVer/ultisnips' " Depends on honza/vim-snippets
        "  Note: on my vaiop cygwin, I had to symlink from
        "  bundle/vim-snippets/UltiSnips to ~/.vim/UltiSnips to get this working.
        "  If python isn't compiled into vim, UltiSnips will not work.   On Cygwin,
        "  you have to build vim manually:  http://stackoverflow.com/a/14059666/237059
endif

    "  Use :UltiSnipsEdit to see the snippets available
    "  Use <c-j> to trigger expansion of a snippet key, e.g.:
    "       1. Insert 'map' in the code
    "       2. Press Ctrl+J to expand it as shown in the snippet definition.
    "       3. Use Ctrl+J again to go to the next param field in the snippet,
    "       if any.
    "       4. Use <Ctrl+K> to go backward in param field

"-- someday.  Requires compiled clang  component:
"Plugin 'manual-repos/YouCompleteMe'  " @Valloric/YouCompleteMe
    " The clang_complete plugin needs the directory name containing libclang.so:
    let g:clang_library_path='/opt/swt/lib'
    let g:clang_complete_auto=1

    " Taglist plugin:
"Plugin 'file:///home/lmatheson4/.vim/manual-repos/taglist_46'


  " Easy motion uses <leader><leader>{object} as its basic input model.
  " So ",,j" will highlight lines and ",,w" will do the same for words.
"Plugin 'file:///home/lmatheson4/.vim/manual-repos/vim-easymotion'
"Plugin 'file:///home/lmatheson4/.vim/manual-repos/ZoomWin'

" Use :Bdelete to close a buffer without closing the window too:
"Plugin 'file:///home/lmatheson4/.vim/manual-repos/vim-bbye'

"  UltiSnips settings:
"  ------------------
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"     let g:UltiSnipsExpandTrigger="<c-j>"
"     let g:UltiSnipsJumpForwardTrigger="<c-j>"  "  Hop from $1 to $2, etc in a snippet
"     let g:UltiSnipsJumpBackwardTrigger="<c-k>"

    " If you want :UltiSnipsEdit to split your window.
    "let g:UltiSnipsEditSplit="vertical"


