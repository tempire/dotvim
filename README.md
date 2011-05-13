## Requirements
- Ruby 1.8.7
- Ruby rake compiler
- ctags (yum install ctags on redhat based systems)
- vim must be compiled with ruby (for command-t) & python (gundo)
  - ./configure --enable-perlinterp --enable-pythoninterp --enable-rubyinterp

## Install git subtree

  curl -k -L https://github.com/apenwarr/git-subtree/tarball/master 
    | tar --strip-components 1 -C $(\git --exec-path) -xzf - */git-subtree.sh
    && mv "$(\git --exec-path)"/git-subtree.sh "$(\git --exec-path)"/git-subtree

## dotvim

    git clone git://github.com/tempire/dotvim.git .vim
    cd .vim

    git submodule init
    git submodule update

    cd bundle/command-t
    rake make # requires ruby gems

    ln -s ~/.vim/vimrc ~/.vimrc
