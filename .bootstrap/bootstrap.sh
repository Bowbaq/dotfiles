set -ex

# install homebrew
`which -s brew`
if [[ $? != 0 ]]; then
    echo ''
    echo '##### Installing Homebrew'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo ''
    echo '##### Updating & hecking homebrew installation'
    brew update
    brew doctor
fi

if [ ! -d "$HOME/.oh-my-zsh"]; then
  echo ''
  echo '##### Installing oh-my-zsh'
  curl -L http://install.ohmyz.sh | sh
else
  echo ''
  echo '##### Updating oh-my-zsh'
  env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
fi

# install brew taps, needs to be fixed properly later
for TAP in $(grep . Taps | grep -v "#"); do
  brew tap "$TAP"
done

# Install brews
for BREW in $(grep . Brewfile | grep -v "#"); do
  brew install "$BREW"
done

# Install casks
for CASK in $(grep . Caskfile | grep -v "#"); do
  brew cask install "$CASK"
done
brew cleanup; brew cask cleanup

# Set standard settings
source 'settings.sh'
source 'symlink-dotfiles.sh'

# Update OS X
sudo softwareupdate -i -a