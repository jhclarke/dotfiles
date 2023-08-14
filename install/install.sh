#!/bin/sh


# Install all necessary Arch packages, especially `stow`.

./install_arch_packages.sh

stow --dotfiles bash
stow --dotfiles emacs
stow --dotfiles email
stow --dotfiles firefox
stow --dotfiles git
stow --dotfiles lisp
stow --dotfiles ruby
stow --dotfiles x-windows

# Link ~/.bash_profile -> ~/.bashrc
rm -f ~/.bash_profile
ln -s ~/.bashrc ~/.bash_profile

# Install Ruby gems
./install_ruby_gems.sh

# Install Python packages 
./install_python_packages.sh

# Install Node packages
./install_node_packages.sh

