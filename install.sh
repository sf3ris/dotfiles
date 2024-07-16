#! /bin/bash

backup_dir=~/dotfiles_backup
files="zshrc config/nvim/templates config/nvim/lua tmux.conf tmux"
current_dir=$(pwd)

echo "Creating $backup_dir to backup current dotfiles"
mkdir -p $backup_dir
echo "Done!"

cd ~
for file in $files; do
  echo "================= $file ================================="
  echo "Moving current $file dotfile to $backup_dir"
  mv ~/.$file $backup_dir

  echo "Creating symlink between $current_dir/$file with ~/.$file"
  ln -s $current_dir/$file ~/.$file

  echo ""
done

