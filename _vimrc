set nocompatible

set directory=.,$TEMP
set viminfo+=n$VIM/_viminfo

" disable beeps
autocmd GUIEnter * set vb t_vb=
set noerrorbells

source $VIM/vimfiles/vimrc
