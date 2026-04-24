#!/usr/bin/env bash

cat << 'EOF'
▗▄▄▄  ▗▄▖▗▄▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖   ▗▄▄▄▖
▐▌  █▐▌ ▐▌ █  ▐▌     █  ▐▌   ▐▌
▐▌  █▐▌ ▐▌ █  ▐▛▀▀▘  █  ▐▌   ▐▛▀▀▘
▐▙▄▄▀▝▚▄▞▘ █  ▐▌   ▗▄█▄▖▐▙▄▄▖▐▙▄▄▖

------------ STARTING ------------

EOF

ok()   { echo -e "\e[32mOK\e[0m"; }
step() { printf "%-28s" "$1";     }

step "Resetting symlinks"
rm -rf "$HOME/.bashrc"
rm -rf "$HOME/.config/i3"
rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/.config/alacritty"
rm -rf "$HOME/.config/fontconfig"
ok

step "Resetting Neovim"
rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/share/nvim
rm -rf $HOME/.cache/nvim
rm -rf $HOME/.local/state/nvim
ok

step "Creating symlinks"
ln -s $HOME/dotfile/bashrc       $HOME/.bashrc
ln -s $HOME/dotfile/i3           $HOME/.config/i3
ln -s $HOME/dotfile/nvim         $HOME/.config/nvim
ln -s $HOME/dotfile/alacritty    $HOME/.config/alacritty
ln -s $HOME/dotfile/fontconfig   $HOME/.config/fontconfig
ok

step "Installing NerdFont"
wget  -qO $HOME/dotfile/fontconfig/Terminus.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Terminus.zip
unzip -qo $HOME/dotfile/fontconfig/Terminus.zip -d $HOME/dotfile/fontconfig/
rm    -f  $HOME/dotfile/fontconfig/Terminus.zip
rm    -f  $HOME/dotfile/fontconfig/LICENSE.txt
rm    -f  $HOME/dotfile/fontconfig/README.md
ok

echo -e "\e[32m+--------------------------------+\e[0m"
echo -e "\e[32m| ✔ Setup completed successfully |\e[0m"
echo -e "\e[32m+-----------  FINISH  -----------+\e[0m"
echo ""
