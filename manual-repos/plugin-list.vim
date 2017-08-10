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
"           - [no internet?] manually copy the entire manual-repos/ tree to the target machine from a working machine.
"           - !! Don't use vundle's PluginInstall, but do use PluginList after vim restart
"           
"       >> Adding a plugin:
"           - Add an entry to manual-repos/plugin-list.vim
"           - [no internet? ] Manually clone the [user/reponame] dir under manual-repos
"           - Re-run manual-repos/update-from-internet.sh 
"
"       >> Uninstalling vundle plugins:
"            - Comment out from plugin-list.vim
"            - rm the dirs in .vim/bundle and the symlinks+source dirs  in manual-repos/
"            - Run :PluginClean
"
Plugin 'manual-repos/nerdtree'  " @scrooloose/nerdtree 
Plugin 'manual-repos/xterm-color-table.vim' " @guns/xterm-color-table.vim
Plugin 'manual-repos/bufexplorer' " @jlanzarotta/bufexplorer
Plugin 'manual-repos/QFGrep' " @sk1418/QFGrep
Plugin 'manual-repos/vim-airline' " @Stabledog/vim-airline
Plugin 'manual-repos/vim-airline-themes' " @vim-airline/vim-airline-themes
Plugin 'manual-repos/vim-peekaboo' " @junegunn/vim-peekaboo


