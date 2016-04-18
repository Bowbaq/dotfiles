set -ex

if [ ! -d "$HOME/.bootstrap" ]; then
  git clone --recursive https://github.com/Bowbaq/dotfiles.git "$HOME"
else
  cd "$HOME"
  git pull origin master
fi

(cd .bootstrap; bash bootstrap.sh)
