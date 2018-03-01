About
=====
My Vim settings and plugins


Setting up gVim on Windows
==========================

  * Install gVim (preferably in C:\ to avoid admin permission problems with
    Program Files)
  * Remove existing `vimfiles` directory
  * Clone this repo using name `vimfiles`
  * Check out the `windows` branch which has the vimrc tweaked for Windows
  * Replace the default `_vimrc` with the one on that branch

It might be the case that gVim won't pick up the `_vimrc` from `$VIM` if you
have an existing `.vimrc` in `%userprofile%`, which is used by e.g. Git Bash's
vim. What you can do is edit the shortcut to gVim to pass it the correct file,
e.g. `-u c:\vim\_vimrc`. You can also change the starting directory while
you're there, if you want.

Once you manage to run gVim with correct vimrc loaded, you can finish setting up:

  * git clone https://github.com/VundleVim/Vundle.vim vimfiles/bundle/Vundle.vim
  * launch Vim and run :BundleInstall


Vundle commands
===============

    :BundleUpdate        - update bundles
    :BundleList          - list configured bundles
    :BundleInstall(!)    - install (update) bundles
    :BundleSearch(!) foo - search (or refresh cache first) for foo
    :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles

NOTE: comments after Bundle commands are not allowed
see :h vundle for more details or https://github.com/gmarik/vundle wiki
