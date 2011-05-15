## Requirements
- Ruby 1.8.7
- Ruby rake compiler
- ctags (yum install ctags on redhat based systems)
- vim must be compiled with ruby (for command-t) & python (gundo)
  - ./configure --enable-perlinterp --enable-pythoninterp --enable-rubyinterp

### On OSX, use <a href="http://mxcl.github.com/homebrew/">homebrew</a> to install vim (terminal & gui):

    brew install ruby
    brew install ctags
    brew install macvim --override-system-vim

## Install

    git clone git://github.com/tempire/dotvim.git .vim
    cd .vim
    git submodule init
    git submodule update

    cd bundle/command-t
    rake make # requires ruby gems

    ln -s ~/.vim/vimrc ~/.vimrc
