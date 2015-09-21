Check out the rest of my dotfiles here:
[https://github.com/BurnzZ/dotfiles.git](https://github.com/BurnzZ/dotfiles.git)

These people inspired almost all of my dotfiles:
* [Paul Irish](https://github.com/paulirish/dotfiles)

# Installation

Make sure you had setup [Pathogen](https://github.com/tpope/vim-pathogen.git).

```sh
git clone https://github.com/BurnzZ/vim-setup.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
git submodule update --init
```

You can update all plugins using:
`git submodule foreach git pull origin master`

---
*slight* Issues
-
When using Vim versions below than *7.4.x*, the colorscheme `molokai` won't work.
