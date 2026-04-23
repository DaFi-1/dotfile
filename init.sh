
rm -rf $HOME/.bashrc
rm -rf $HOME/.config/i3
rm -rf $HOME/.config/alacritty

ln -s $HOME/dotfile/bashrc   $HOME/.bashrc
ln -s $HOME/dotfile/i3        $HOME/.config/i3
ln -s $HOME/dotfile/alacritty $HOME/.config/alacritty
