cd ~
pipx install black
pipx install isort
pipx install pyright

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

sudo apt update -y
sudo apt install -y yadm
sudo add-apt-repository -y ppa:maveonair/helix-editor
sudo apt install -y helix

wget https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz
tar -xvf zellij*.tar.gz
chmod +x zellij
sudo mv -f zellij /usr/bin/

[ -f .bashrc ] && mv .bashrc .backup_bashrc
yadm clone -f https://github.com/neerajanil/dotfiles

chmod u+x "$HOME/.scripts/*"

mkdir -p ~/.dscripts
touch ~/.dscripts/dscript.sh

zellij setup --generate-completion bash > $HOME/.dscripts/zcomp.sh
echo "source $HOME/.dscripts/zcomp.sh" >> $HOME/.dscripts/dscript.sh

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> $HOME/.dscripts/dscript.sh
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install broot
broot --print-shell-function bash > $HOME/.dscripts/brcomp.sh
echo "source $HOME/.dscripts/brcomp.sh" >> $HOME/.dscripts/dscript.sh

brew install nushell
zellij options --default-shell  nu

sudo -p mkdir /usr/fpath
sudo cp -a ~/.scripts/. /usr/fpath/
sudo cp ~/.config/broot/zellij.conf /usr/fpath
sudo cp ~/.layouts/code.kdl /usr/fpath
