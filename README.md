Check out the rest of my dotfiles here:
* [https://github.com/BurnzZ/dotfiles](https://github.com/BurnzZ/dotfiles)
* [https://github.com/BurnzZ/tmux-setup](https://github.com/BurnzZ/tmux-setup)

These people inspired almost all of my dotfiles:
* [Paul Irish](https://github.com/paulirish/dotfiles)
* [Cătălin Mariș](https://github.com/alrra/dotfiles)
* [Tom Vincent](https://github.com/tlvince/vim-config)
* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)

# Installation

```sh
git clone https://github.com/BurnzZ/vim-setup.git ~/.vim
ln -fs ~/.vim/.vimrc ~/.vimrc

cd ~/.vim
git submodule update --init
```

You can update all plugins using:
`git submodule foreach git pull origin master`


# Notes
-
Make sure you're using *Vim 7.4.x* or above.
