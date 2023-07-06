sudo add-apt-repository ppa:oibaf/graphics-drivers
sudo add-apt-repository ppa:nilarimogard/webupd8 -y
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo add-apt-repository ppa:atareao/telegram
sudo add-apt-repository ppa:alexlarsson/flatpak
sudo add-apt-repository ppa:libreoffice/ppa
sudo add-apt-repository ppa:mozillateam/ppa
sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
### VScode
sudo apt-get install wget gpg -ys
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
###Wine
wget https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/'
### Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

sudo apt-get update