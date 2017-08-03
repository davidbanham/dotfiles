sudo apt update
sudo apt-get install     apt-transport-https     ca-certificates     curl     software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo add-apt-repository ppa:longsleep/golang-backports
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "deb http://repo.sinew.in/ stable main" > enpass.list
sudo mv ./enpass.list /etc/apt/sources.list.d/enpass.list
wget -O - https://dl.sinew.in/keys/enpass-linux.key | apt-key add -
sudo chown root:root /etc/apt/sources.list.d/enpass.list
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt update
sudo apt install xmonad docker-ce docker-compose arandr enpass stow nodejs python-dev python-pip python3-dev python3-pip golang-go golang-go.tools ack-grep zsh build-essential cmake powertop laptop-mode-tools neovim lynx jq htop autoconf ffmpeg imagemagick

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cd ~/repos/dotfiles
./install.sh
cd ~

sudo usermod -aG docker $USER
sudo systemctl enable docker
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
npm install -g typescript coffeescript yarn
sudo pip3 install --upgrade neovim
cd .config/nvim/plugged/YouCompleteMe/
./install.py --gocode-completer --clang-completer --tern-completer --racer-completer

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

curl https://glide.sh/get | sh

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
