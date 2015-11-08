" use Vim settings, this must be first
set nocompatible

" Vundle
filetype off
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
call vundle#begin("$VIM/vimfiles/bundle/")

" let Vundle manage Vundle
Bundle 'VundleVim/Vundle.vim'

Bundle 'tpope/vim-pathogen.git'
Bundle 'klen/python-mode.git'
Bundle 'leafgarland/typescript-vim.git'
Bundle 'elzr/vim-json.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/nerdcommenter.git'
" plugin below causes errors on Windows
" Bundle 'vim-scripts/swap-parameters.git'
Bundle 'derekwyatt/vim-scala.git'
Bundle 'peterhoeg/vim-qml'
Bundle 'kien/ctrlp.vim'
Bundle 'jdonaldson/vaxe'
Bundle 'godlygeek/tabular'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-ragtag'
Bundle 'zeis/vim-kolor'

call vundle#end()
filetype plugin indent on

" force Unix line endings on Windows
set fileformat=unix
set fileformats=unix,dos

syntax on

" make backspace behave in a sane manner
set backspace=indent,eol,start

" sane up/down
nnoremap j gj
nnoremap k gk

colorscheme kolor
set guifont=Consolas:h12

set number
set ruler

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" show invisible characters
set listchars=tab:»\ ,eol:¬
set list

" show 80 character margin
set colorcolumn=80
hi ColorColumn ctermbg=0

" disable folding
set nofoldenable

" use kj as Esc
inoremap kj <Esc>

" switch : and ;
noremap ; :
noremap : ;

" close tab with \q
noremap <leader>q :tabclose<CR>


" file path tab completion like in bash
set wildmode=longest,list
"set wildmode=longest,list,full

" set terminal titlebar
set title

" always show status bar
set laststatus=2


" clipboard
" F2 to toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
" yank in visual mode to pipe to clipboard (requires xclip to be installed)
vnoremap y y:call system("xclip -selection clipboard", @")<CR>


" F9 for compiling
noremap <F9> :make<Return>:cw<Return>

" Alt-Up/Down for going through Location List window
noremap <A-UP> :lprevious<Return>
noremap <A-DOWN> :lnext<Return>

" Shift-Alt-Up/Down for going through QuickFix List window
noremap <S-A-UP> :cprevious<Return>
noremap <S-A-DOWN> :cnext<Return>

" Go through tabs
noremap <PageUp> <C-PageUp>
noremap <PageDown> <C-PageDown>

" show QuickFix if :make finished with errors
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" search and replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/


" when saving current session with 'mksession!'
" remember only open files/windows/tabs, no remaps or any other stuff
set sessionoptions=curdir,resize,tabpages,winsize

" press _ to underline the currenly selected line with any character
" this will wait for user input for the character to use for underlining
command! -nargs=1 Underline :normal yyp<C-V>$r<args>
nnoremap _ :Underline


" ignore extensions
set wildignore+=*.swp,*.pyc,*.class

" NERDTree ignore extension
let NERDTreeIgnore = ['\.pyc$', '\.class$']


" change default split behavior
set splitbelow
set splitright

" navigate window splits easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" tab for toggling previous window
"nnoremap <Tab> <C-w>p

" spell check
nnoremap <F7> :setlocal spell! spelllang=en_us<CR>

" spell checking color
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=6 ctermbg=0 term=underline cterm=underline

" color of matching parentheses
highlight MatchParen ctermfg=yellow ctermbg=red


" recognize TypeScript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript


" PyLint
" E201, E202 - space before parens
" E303 - too many blank lines
" W806 - retarded pyflakes says _ is assigned but never used
" E221 - multiple spaces before operator
" E265 - block comment should start with '# '
" E731 - do not assign a lambda expression, use a def
let g:pymode_lint_ignore = "E201,E202,W806,E221,E265,E731"

" disable Python docs preview window from coming up when pressing .
set completeopt-=preview



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

" allow to write to file when forgot to run vim using sudo
cmap w!! w !sudo tee > /dev/null %


" quicker grep - assumes current file's extension if not explicitly given
function! Bgrepfunc(search_for, ...)
    let file_pattern = "**"  " search all files by default
    if a:0 == 1  " extension was explicitly given, use it for searching
        let file_pattern = file_pattern . "/*." . a:1
    else
        let parts = split(@%, "[.]")
        if len(parts) > 1  " file has extension, use that for searching
            let file_pattern = file_pattern . "/*." . parts[-1]
        endif
    endif
    let cmd = "vimgrep /" . a:search_for . "/ " . file_pattern
    echom "Executing search command: " . cmd

    try
        exe "tabnew"
        exe cmd
    catch /E480:/
        echom "No match"
        exe "q"
    endtry
endfunction

command! -nargs=+ Bgrep call Bgrepfunc(<f-args>)


" open unstaged git files
function! Unstagedfunc()
    let cmd = "git status --short --untracked-files=no | awk ' { print $2 } '"
    "let output = system(cmd)
    let paths = split(system(cmd), "\n")

    if len(paths) > 0
        for path in paths
            exe "tabedit " . path
        endfor
        echom "Opened " . len(paths) . " files"
    else
        echom "No unstaged files"
    endif
endfunction

command! Unstaged call Unstagedfunc()


" trim whitespace
command! Trimwhitespace :%s/\s\+$//e


" show warning that file has been changed externally
autocmd WinEnter * checktime
autocmd BufWinEnter * checktime
autocmd CursorHold * checktime

"" Solarized theme settings for terminal
"" assumes that terminal's ANSI color pallete is set to values from Solarized theme
"colorscheme solarized
"set background=dark
"set t_Co=16
"hi NonText ctermfg=238
"hi SpecialKey ctermfg=238

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab


" prevents freezing due to 'Regenerate rope autoimport cache'
let g:pymode_rope_autoimport = 0
