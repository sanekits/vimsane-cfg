" ~/.vim/load-plugins.vim
"

call DebugMsg("Loading " . expand('<sfile>') )


if exists("&macmeta")
    set macmeta " Interpret option key as alt on macos
    nnoremap å :echo "macmeta is on"<CR>
endif

"call Stubx( expand("x1: $VIMHOME -- ") . &runtimepath )
filetype off " Vundle requires this.
set rtp+=$VIMHOME/Vundle.vim

" The argument to vundle#begin allows you to redirect the root
" of all plugins managed by vundle:
call vundle#begin( expand("$LmHome/.vim/bundle"))
"call Stubx( "x2: " . &runtimepath )



" Plugin management: see this include file...
source $VIMHOME/plugin-list.vim  " Use external plugins list


" End of vundle initialization
call vundle#end()
"call Stubx( "x3: " . &runtimepath )

filetype plugin indent on  " required

