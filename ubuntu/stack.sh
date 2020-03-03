# Defaults and Dependencies
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common snapd

# Sublime Text 3
echo "-------------------------------------- Preparando Sublime Text 3 --------------------------------------"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# VSCode
echo "-------------------------------------- Preparando VSCode --------------------------------------"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Docker
echo "-------------------------------------- Preparando Docker --------------------------------------"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Brave
echo "-------------------------------------- Preparando Brave --------------------------------------"
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Peek
echo "-------------------------------------- Preparando Peek --------------------------------------"
sudo add-apt-repository ppa:peek-developers/stable

# Update and install
echo "-------------------------------------- UPDATE --------------------------------------"
sudo apt-get update
echo "-------------------------------------- Instalando VSCode --------------------------------------"
sudo apt-get install -y code
echo "-------------------------------------- Instalando Sublime Text 3 --------------------------------------"
sudo apt-get install -y sublime-text sublime-merge
echo "-------------------------------------- Instalando Docker --------------------------------------"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
echo "-------------------------------------- Instalando MySQL Workbench --------------------------------------"
sudo apt-get install -y mysql-workbench
echo "-------------------------------------- Instalando Brave --------------------------------------"
sudo apt-get install -y brave-browser
echo "-------------------------------------- Instalando Peek --------------------------------------"
sudo apt-get install -y peek

echo "-------------------------------------- Instalando Teams --------------------------------------"
sudo snap install teams-for-linux --beta
echo "-------------------------------------- Instalando Slack --------------------------------------"
sudo snap install slack --classic
echo "-------------------------------------- Instalando Skype --------------------------------------"
sudo snap install skype --classic
echo "-------------------------------------- Instalando Spotify --------------------------------------"
sudo snap install spotify
echo "-------------------------------------- Instalando RocketChat --------------------------------------"
sudo snap install rocketchat-desktop
echo "-------------------------------------- Instalando Insomnia --------------------------------------"
sudo snap install insomnia
echo "-------------------------------------- Instalando Postman --------------------------------------"
sudo snap install postman

echo "-------------------------------------- Configurando Usuário do GIT --------------------------------------"
git config --global user.name ""
git config --global user.email ""

echo "-------------------------------------- Adicionando frescura da Branch --------------------------------------"
cat <<EOT >> ~/.bashrc

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
EOT

source ~/.bashrc

echo "-------------------------------------- Instalando Chrome --------------------------------------"
echo "Não esqueça de instalar o Chrome Manualmente, acesse o site: https://www.google.com/intl/pt-BR/chrome/"
