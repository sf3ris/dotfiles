#! /bin/bash

backup_dir=~/dotfiles_backup
echo "Cleaning up backup directory"
rm -rf $backup_dir/*

files="zshrc config/nvim tmux.conf yabairc skhdrc"
current_dir=$(pwd)

echo "Creating $backup_dir to backup current dotfiles"
mkdir -p $backup_dir
echo "Done!"

rm -rf ~/.tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd ~
for file in $files; do
  echo "================= $file ================================="
  echo "Moving current $file dotfile to $backup_dir"
  mv ~/.$file $backup_dir/

  echo "Creating symlink between $current_dir/$file with ~/.$file"
  ln -s $current_dir/$file ~/.$file

  echo ""
done

if ! command -v zsh; then
  echo "\e[1;31m Please install zsh \e[0m"
fi

if ! command -v yabai; then
  echo "\e[1;31m Please install yabai for macOS tiling manager"
fi

if ! command -v skhd; then
  echo "\e[1;31m Please install skhd for macOS keybindings"
fi



