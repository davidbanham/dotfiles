sudo apt update
sudo apt-get install     apt-transport-https     ca-certificates     curl     software-properties-common
sudo add-apt-repository ppa:longsleep/golang-backports
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "deb http://repo.sinew.in/ stable main" > enpass.list
sudo mv ./enpass.list /etc/apt/sources.list.d/enpass.list
sudo chown root:root /etc/apt/sources.list.d/enpass.list
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt update
sudo apt install xmonad docker-ce docker-compose arandr enpass stow nodejs python-dev python-pip python3-dev python3-pip python-neovim python3-neovim golang-go ack-grep zsh build-essential cmake powertop laptop-mode-tools

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
npm install -g typescript
npm install -g coffeescript
sudo pip3 install --upgrade neovim
cd .config/nvim/plugged/YouCompleteMe/
./install.py --gocode-completer --clang-completer --tern-completer --racer-completer

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
