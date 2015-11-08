set nocompatible

set directory=.,$TEMP
set viminfo+=n$VIM/_viminfo

" enable Python 3 support
" required for correct python-mode pyflakes syntax checking of Python 3 code
" must be 32-bit Python 3.2 (that's what gVim was compiled for at the time)
let $PATH.=";C:\\Python32"

" disable beeps
autocmd GUIEnter * set vb t_vb=
set noerrorbells

source $VIM/vimfiles/vimrc
