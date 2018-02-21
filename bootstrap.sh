#!/bin/bash
set -euxo pipefail

sudo apt update
sudo apt-get install     apt-transport-https     ca-certificates     curl     software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo add-apt-repository ppa:nathan-renniewaldock/flux
sudo add-apt-repository ppa:gezakovacs/ppa
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -

wget https://pkg.tarsnap.com/tarsnap-deb-packaging-key.asc
sudo apt-key add tarsnap-deb-packaging-key.asc
echo "deb http://pkg.tarsnap.com/deb/$(lsb_release -s -c) ./" | sudo tee -a /etc/apt/sources.list.d/tarsnap.list

wget https://dl.google.com/go/go1.10.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.10.linux-amd64.tar.gz

sudo apt update
sudo apt install xmonad docker-ce docker-compose arandr stow nodejs python-dev python-pip python3-dev python3-pip golang-go golang-go.tools zsh build-essential cmake powertop laptop-mode-tools neovim lynx jq htop autoconf ffmpeg imagemagick abook fluxgui urlscan pass direnv task libfreetype6-dev libfontconfig1-dev xclip unetbootin weechat tarsnap tmux cargo mutt

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

curl -sSL https://github.com/passff/passff/releases/download/1.0.0/install_host_app.sh | bash -s -- firefox

cd ~/repos/dotfiles
./install.sh
cd ~

go get github.com/davidbanham/abook_adder

sudo usermod -aG docker $USER
sudo systemctl enable docker
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
npm install -g typescript coffeescript yarn livedown coffee-script nesh
sudo pip3 install --upgrade neovim
sudo pip install neovim
sudo pip install --upgrade git+git://github.com/tbabej/tasklib@develop
pip install --user --upgrade sqlparse

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# For wee-slack
sudo pip install websocket-client

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

curl -O https://prerelease.keybase.io/keybase_amd64.deb
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f
run_keybase

curl https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest > ~/.bin/ecs-cli && chmod +x ~/.bin/ecs-cli
curl https://raw.githubusercontent.com/silinternational/ecs-deploy/develop/ecs-deploy > ~/.bin/ecs-deploy && chmod +x ~/.bin/ecs-deploy
curl https://github.com/davidbanham/monty/raw/master/binaries/monty-linux-amd64 > ~/.bin/monty && chmod +x ~/.bin/monty
cargo install watchexec

curl -L https://github.com/docker/machine/releases/download/v0.12.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
chmod +x /tmp/docker-machine &&
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

cd ~/repos
git clone --recursive https://github.com/lolilolicon/FFcast.git
cd FFcast
./bootstrap
./configure --prefix /usr --libexecdir /usr/lib --sysconfdir /etc --enable-xrectsel
make
sudo make install
cd ~

cd ~/repos
git clone https://github.com/jwilm/alacritty.git
cd alacritty
cargo build --release
sudo cp target/release/alacritty /usr/local/bin
cp Alacritty.desktop ~/.local/share/applications
cd ~

cd /tmp
wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
unzip 1.050R-it.zip
mkdir -p ~/.fonts
cp source-code-pro-*-it/OTF/*.otf ~/.fonts/
fc-cache -f -v
cd ~

go get github.com/davidbanham/termcolour

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.0/ripgrep_0.8.0_amd64.deb
sudo dpkg -i ripgrep_0.8.0_amd64.deb
rm ripgrep_0.8.0_amd64.deb

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt update && sudo apt install google-cloud-sdk
gcloud config set project speedtest-186210
gcloud auth login
sudo apt-get install kubectl
gcloud container clusters get-credentials speedtest --zone australia-southeast1-a
