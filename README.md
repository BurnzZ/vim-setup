Check out the rest of my dotfiles here:
[https://github.com/BurnzZ/dotfiles.git](https://github.com/BurnzZ/dotfiles.git)

These people inspired almost all of my dotfiles:
* [Paul Irish](https://github.com/paulirish/dotfiles)
* [Cătălin Mariș](https://github.com/alrra/dotfiles)
* [Tom Vincent](https://github.com/tlvince/vim-config)

# Installation

```sh
git clone https://github.com/BurnzZ/vim-setup.git ~/.vim
ln -fs ~/.vim/.vimrc ~/.vimrc
git submodule update --init
```

You can update all plugins using:
`git submodule foreach git pull origin master`

---
*slight* Issues
-
When using Vim versions below than *7.4.x*, the colorscheme `molokai` won't work.
