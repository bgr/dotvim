About
=====
My Vim settings and plugins


Setting up
==========

    git clone https://github.com/bgr/dotvim.git ~/.vim
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
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
