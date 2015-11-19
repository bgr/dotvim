About
=====
My Vim settings and plugins


Setting up
==========

    git clone https://github.com/bgr/dotvim.git ~/.vim
    git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
    cd ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    sudo apt-get install xclip  # for yanking to system clipboard
    # launch Vim and run :BundleInstall


Vundle commands
===============
:BundleUpdate        - update bundles
:BundleList          - list configured bundles
:BundleInstall(!)    - install (update) bundles
:BundleSearch(!) foo - search (or refresh cache first) for foo
:BundleClean(!)      - confirm (or auto-approve) removal of unused bundles

NOTE: comments after Bundle commands are not allowed
see :h vundle for more details or https://github.com/gmarik/vundle wiki


gVim on Windows
===============

  * Remove existing `vimfiles` directory
  * Clone this repo using that name
  * Check out the `windows` branch which has the vimrc tweaked for Windows
  * Replace the default `_vimrc` with the one on that branch

It might be the case that gVim won't pick up the `_vimrc` from `$VIM` if you
have an existing `.vimrc` in `%userprofile%`, which is used by e.g. Git Bash's
vim. What you can do is edit the shortcut to gVim to pass it the correct file,
e.g. `-u c:\vim\_vimrc`. Also edit the starting directory while you're there.
