#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" > /tmp/homebrew-install.log
fi

# Install homebrew packages
brew install grc coreutils spark

# Install cask
brew install caskroom/cask/brew-cask

# Install cask apps
brew cask install dropbox
brew cask install google-drive
brew cask install google-chrome
brew cask install firefox
brew cask install iterm2
brew cask install atom
brew cask install hipchat
brew cask install dashlane
brew cask install spotify
brew cask install vlc
brew cask install utorrent
brew cask install adobe-creative-cloud
brew cask install steam
brew cask install flash
brew cask install imageoptim

# Install other apps
brew install hub
brew install rbenv
brew install rbenv-gem-rehash
brew install ruby-build
brew install mongodb
brew install redis
brew install elasticsearch
brew install gpg
brew install node
brew install openssl

exit 0
