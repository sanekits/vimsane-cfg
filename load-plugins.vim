" load-plugins.vim
filetype off

if exists("&macmeta")
    set macmeta " Interpret option key as alt on macos
    nnoremap å :echo "macmeta is on"<CR>
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin management: see this include file...
source $VIMHOME/manual-repos/plugin-list.vim  " Use external plugins list

" End of vundle initialization
call vundle#end()
filetype plugin indent on  " required

