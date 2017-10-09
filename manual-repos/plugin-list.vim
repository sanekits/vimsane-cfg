" Repos to fetch from Internet to manual-repos:
"
"   Note that the comments for each plugin contain the github-relative path,
"   and our update-from-internet script creates a symlink in manual-repos/
"   which points to the git working tree for each repo.
"
"   >> Operation notes
"   ------------------
"       >> Setting up a new machine:
"           - [internet connected?] Run manual-repos/update-from-internet.sh
"           - [no internet?] manually copy the plugin subdirs in manual-repos/* to the target machine from a working machine, 
"                 then run "./update-from-internet.sh --local"
"           - !! Don't use vundle's PluginInstall, but do use PluginList after vim restart
"           
"       >> Adding a plugin:
"           - Add an entry to manual-repos/plugin-list.vim
"           - [no internet? ] Manually clone the source  repo into manual-repos/[user]/[product]
"           - Re-run manual-repos/update-from-internet.sh (with --local if  no internet)
"
"       >> Uninstalling vundle plugins:
"            - Comment out from plugin-list.vim
"            - rm the symlink in .vim/bundle and the symlinks+source dirs  in manual-repos/
"            - Run :PluginClean
"
Plugin 'manual-repos/Vundle.vim' " @gmarik/Vundle.vim
Plugin 'manual-repos/vim-colors-solarized'  " @altercation/vim-colors-solarized
    set background=dark
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1

Plugin 'manual-repos/ctrlp.vim'  " @ctrlpvim/ctrlp.vim
    let g:ctrlp_show_hidden=1
    let g:ctrlp_root_markers=['.taskrc','.git']
    let g:ctrlp_types=['buf','fil','tag']




Plugin 'manual-repos/nerdtree'  " @scrooloose/nerdtree 
    " See http://superuser.com/a/418915 for this NERDtree workaround (needed on
    " sunos, at least.  Probably others too)
    "let g:NERDTreeDirArrows=0
    set encoding=utf-8
    let NERDTreeShowHidden=1    " Show hidden files

    "noremap <C-n> :NERDTreeToggle<CR>

Plugin 'manual-repos/xterm-color-table.vim' " @guns/xterm-color-table.vim
Plugin 'manual-repos/bufexplorer' " @jlanzarotta/bufexplorer
  let g:bufExplorerShowRelativePath=1  " Show relative paths.
  let g:bufExplorerSortBy='mru'        " Sort by most recently used.


Plugin 'manual-repos/vim-airline' " @Stabledog/vim-airline

Plugin 'manual-repos/vim-airline-themes' " @vim-airline/vim-airline-themes
  " vim-airline color tweaking...
  ": AirlineTheme 'kolor'
  let g:airline_theme='kolor'
Plugin 'manual-repos/vim-airline-clock' " @enricobacis/vim-airline-clock
Plugin 'manual-repos/vim-peekaboo' " @junegunn/vim-peekaboo
Plugin 'manual-repos/vim-signature' " @kshenoy/vim-signature 
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
Plugin 'manual-repos/YouCompleteMe'  " @Valloric/YouCompleteMe
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


