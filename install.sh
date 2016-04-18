set -ex

if [ ! -d "$HOME/.osx-bootstrap" ]; then
  git clone --recursive https://github.com/Bowbaq/osx-bootstrap.git "$HOME/.osx-bootstrap"
else
  cd "$HOME/.osx-bootstrap"; git fetch; git reset --hard origin/master
fi

cd "$HOME/.osx-bootstrap"
bash bootstrap.sh
