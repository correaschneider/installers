#!/bin/bash

wget -O Postman.tar.gz https://dl.pstmn.io/download/latest/linux64
sudo tar -xzf Postman.tar.gz -C /opt
rm Postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman
wget -O postman.png https://camo.githubusercontent.com/47fd1d298d73fdac1823af35ac3e3cfdbfdb9d44/68747470733a2f2f7777772e676574706f73746d616e2e636f6d2f696d672d72656272616e642f6c6f676f2e706e67
sudo mv postman.png /opt/Postman/postman.png
cat > ~/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/postman.png
Terminal=false
Type=Application
Categories=Development;
EOL