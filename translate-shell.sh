#!/bin/bash 
### Hecho por Yordis Cujar
### https://ubunlog.com/translate-shell-traduce-terminal/
cd ~
git clone https://github.com/soimort/translate-shell
cd translate-shell
make
sudo make install
cd ~
rm -r translate-shell
cd ~