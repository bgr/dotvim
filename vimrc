" use Vim settings, this must be first
set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'tpope/vim-pathogen.git'
Bundle 'klen/python-mode.git'
Bundle 'leafgarland/typescript-vim.git'
Bundle 'elzr/vim-json.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'vim-scripts/swap-parameters.git'
Bundle 'derekwyatt/vim-scala.git'
Bundle 'peterhoeg/vim-qml'
Bundle 'kien/ctrlp.vim'

filetype plugin indent on
syntax on


" make backspace behave in a sane manner
set backspace=indent,eol,start

" sane up/down
nnoremap j gj
nnoremap k gk

set number
set ruler

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Show invisible characters
set listchars=tab:→\ ,eol:¬
set list

set colorcolumn=80

" use kj as Esc
inoremap kj <Esc>

" switch : and ;
noremap ; :
noremap : ;

" file path tab completion like in bash
set wildmode=longest,list
"set wildmode=longest,list,full

" set terminal titlebar
set title

" always show status bar
set laststatus=2

" my bogus 'smooth' scrolling
let g:smooth_scroll_lines = 7

function! SmoothScroll(dir)
    for i in range(1,g:smooth_scroll_lines)
        if a:dir
            exe "normal 3\<C-Y>"
        else
            exe "normal 3\<C-E>"
        endif
        redraw
        sleep 25m
    endfor
endfunction

nnoremap <C-D> :call SmoothScroll(0)<CR>
nnoremap <C-U> :call SmoothScroll(1)<CR>


" disable folding
set nofoldenable

" F9 for compiling
noremap <F9> :make<Return>:cw<Return>

" alt-up/down for going through errors in location list window
noremap <M-UP> :lprevious<Return>
noremap <M-DOWN> :lnext<Return>

" show QuickFix if :make finished with errors
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


" when saving current session with 'mksession!' 
" remember only open files/windows/tabs, no remaps or any other stuff
set sessionoptions=curdir,resize,tabpages,winsize

" press _ to underline the currenly selected line with any character
" this will wait for user input for the character to use for underlining
command -nargs=1 Underline :normal yyp<C-V>$r<args>
nnoremap _ :Underline


""" Filetype specific stuff:

" recognize TypeScript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript


" PyLint
" E201, E202 - space before parens
" E303 - too many blank lines
" W806 - retarded pyflakes says _ is assigned but never used
" E221 - multiple spaces before operator
let g:pymode_lint_ignore = "E201,E202,E303,W806,E221"

" ignore extensions
set wildignore+=*.swp,*.pyc,*.class

" NERDTree ignore extension
let NERDTreeIgnore = ['\.pyc$', '\.class$']

" press F2 to toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"" color settings, assumes that terminal's ANSI color pallete is set 
"" to values from Solarized theme
"colorscheme solarized
"set background=dark
"set t_Co=16
"hi NonText ctermfg=238
"hi SpecialKey ctermfg=238

" disable Python docs preview window from coming up when pressing . key
set completeopt-=preview
