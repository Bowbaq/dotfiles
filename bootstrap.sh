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

# Install oh-my-zsh to beautify and manage zsh
curl -L http://install.ohmyz.sh | sh

# install brew taps, needs to be fixed properly later
while read in; do brew tap "$in"; done < Taps

# Install brews
brew install $(cat Brewfile | grep -v "#")

# Install casks
brew cask install $(cat Caskfile | grep -v "#")
brew cask alfred link
brew cleanup; brew cask cleanup

# Set standard settings
source 'settings.sh'
source 'symlink-dotfiles.sh'

# Update OS X
sudo softwareupdate -i -a
