" ~/.vim/load-lmath-plugins.vim
"
" Setup
" -----
" 1. mkdir -p ~/.vimtmp ~/.vim && cd .vim
" 2. git clone bbgithub:sanekits/Vundle.vim.git
" 3. ln -sf load-lmath-plugins.vim load-plugins.vim
" 4. Run vim and then ":PluginInstall"

call DebugMsg("Loading " . expand('<sfile>') )


if exists("&macmeta")
    set macmeta " Interpret option key as alt on macos
    nnoremap å :echo "macmeta is on"<CR>
endif

"call Stubx( expand("x1: $VIMHOME -- ") . &runtimepath )
set nocompatible
filetype off " Vundle requires this.
set rtp+=$VIMHOME/Vundle.vim

" The argument to vundle#begin allows you to redirect the root
" of all plugins managed by vundle:
call vundle#begin( expand("~/.vim/bundle"))
"call Stubx( "x2: " . &runtimepath )



" Plugin management: see this include file...
source $VIMHOME/plugin-list.vim  " Use external plugins list

" Enable the :Man command for manpage reading
" TODO: move this to vimsane?
runtime ftplugin/man.vim


" End of vundle initialization
call vundle#end()
"call Stubx( "x3: " . &runtimepath )

filetype plugin indent on  " required

