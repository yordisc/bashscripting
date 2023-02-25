### fig


sudo apt-get install terminator
sudo apt-get install picom

# Unistall
curl -fSsL https://fig.io/uninstall.sh | bash
rm -r ~/.fig/shell

# Install
bash <(curl -fSsL https://fig.io/headless.sh) && exec $SHELL

################################################################
echo "shadow-exclude = [
  "class_g = 'Fig' && class_i = 'fig' && role = 'autocomplete'"
];

focus-exclude = [
  "class_g = 'Fig' && class_i = 'fig' && role = 'autocomplete'"
];

blur-background-exclude = [
  "class_g = 'Fig' && class_i = 'fig_desktop' && role = 'autocomplete'"
];" >> $HOME/.config/picom/picom.conf 
###################################################################

fig login