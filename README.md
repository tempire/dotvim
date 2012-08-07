## Requirements
- ctags (yum install ctags on redhat based systems)
- vim must be compiled with perl & python (gundo)
  - ./configure --enable-perlinterp --enable-pythoninterp

### On OSX, use <a href="http://mxcl.github.com/homebrew/">homebrew</a> to install vim (terminal & gui):

    brew install ctags
    brew install macvim --override-system-vim

## Install

    git clone git://github.com/tempire/dotvim.git .vim
    cd .vim
    git submodule init
    git submodule update

    ln -s ~/.vim/vimrc ~/.vimrc

## Customization

    ~/.vim/vimrc.$USER

If your shell login is *purl*, create the file *~/.vim/vimrc.purl*.

All custom vim configuration will override the dotvim defaults.

<img src="http://images.tempi.re/dotvim_screenshot_1_for_github_readme_2012-08-06-20120806-185029.jpg" />

<img src="http://images.tempi.re/dotvim_screenshot_2_for_github_readme_2012-08-06-20120806-185109.jpg" />

<img src="http://images.tempi.re/dotvim_screenshot_3_for_github_readme-20120806-185308.jpg" />
