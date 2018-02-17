#!/bin/bash

wget https://download.robomongo.org/1.1.1/linux/robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz
sudo tar -xzf robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz -C /opt
rm robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz
sudo mkdir /opt/robo3t-1.1.1-linux-x86_64-c93c6b0//lib/BKP/
sudo mv /opt/robo3t-1.1.1-linux-x86_64-c93c6b0/lib/libstdc++* /opt/robo3t-1.1.1-linux-x86_64-c93c6b0//lib/BKP/
sudo ln -s /opt/robo3t-1.1.1-linux-x86_64-c93c6b0/bin/robo3t /usr/bin/robo3t
wget https://robomongo.org/static/robomongo-128x128-129df2f1.png
sudo mv robomongo-128x128-129df2f1.png /opt/robo3t-1.1.1-linux-x86_64-c93c6b0/robomongo-128x128.png
cat > ~/.local/share/applications/robo3t.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Robo3T
Exec=robo3t
Icon=/opt/robo3t-1.1.1-linux-x86_64-c93c6b0/robomongo-128x128.png
Terminal=false
Type=Application
Categories=Development;
EOL