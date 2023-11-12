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
