set -ex

git clone --recursive https://github.com/Bowbaq/osx-bootstrap.git "$HOME/.osx-bootstrap"
cd "$HOME/.osx-bootstrap"
bash bootstrap.sh
