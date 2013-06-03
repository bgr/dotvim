" use Vim settings, this must be first
set nocompatible

" Pathogen init
execute pathogen#infect()
execute pathogen#helptags()

filetype plugin indent on
filetype plugin on

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

" use kj as Esc
inoremap kj <Esc>

" switch : and ;
noremap ; :
noremap : ;

" file path tab completion like in bash
set wildmode=longest,list
"set wildmode=longest,list,full

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
" alt-up/down for going through errors in QuickFix window
noremap <F9> :make<Return>:cw<Return>
noremap <M-UP> :cprevious<Return>
noremap <M-DOWN> :cnext<Return>

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



"" color settings, assumes that terminal's ANSI color pallete is set 
"" to values from Solarized theme
"colorscheme solarized
"set background=dark
"set t_Co=16
"hi NonText ctermfg=238
"hi SpecialKey ctermfg=238
