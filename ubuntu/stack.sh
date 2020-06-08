# Defaults and Dependencies
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common snapd

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
echo "-------------------------------------- Instalando Docker --------------------------------------"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
echo "-------------------------------------- Instalando MySQL Workbench --------------------------------------"
sudo apt-get install -y mysql-workbench
echo "-------------------------------------- Instalando Brave --------------------------------------"
sudo apt-get install -y brave-browser
echo "-------------------------------------- Instalando Peek --------------------------------------"
sudo apt-get install -y peek

# Docker Compose
echo "-------------------------------------- Instalando Docker Compose --------------------------------------"
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

sudo echo "{\"graph\": \"/home/pedro/docker\"}" > /var/lib/docker/daemon.json

echo "-------------------------------------- Instalando Slack --------------------------------------"
sudo snap install slack --classic
echo "-------------------------------------- Instalando Skype --------------------------------------"
sudo snap install skype --classic
echo "-------------------------------------- Instalando RocketChat --------------------------------------"
sudo snap install rocketchat-desktop

echo "-------------------------------------- Configurando Usuário do GIT --------------------------------------"
git config --global user.name "Pedro Schneider"
git config --global user.email "pedro.schneider@cwi.com.br"

echo "-------------------------------------- Adicionando frescura da Branch --------------------------------------"
cat <<EOT >> ~/.bashrc

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
EOT

source ~/.bashrc

echo "-------------------------------------- Instalando Chrome --------------------------------------"
echo "Para instalar o Chrome, você precisa fazer o download do .deb na pasta Downloads"
echo "O Firefox será aberto já na página de download, apenas salve o arquivo em '~/Downloads/google-chrome-stable_current_amd64.deb' e feche o Firefox"
firefox https://www.google.com/intl/pt-BR/chrome/
sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb
sudo apt-get install -f

echo "-------------------------------------------------------------------------------------------"
echo "-------------------------------------- Reinicie o PC --------------------------------------"
echo "-------------------------------------------------------------------------------------------"
