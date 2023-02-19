#Enable 32 bit architecture (if you haven't already):
sudo dpkg --add-architecture i386

#Upgrade your system:
sudo apt update && sudo apt upgrade

#Install support for 32-bit games:
sudo apt install libgl1-mesa-glx:i386 libgl1-mesa-dri:i386

#Install support for Vulkan API (will be functional only if you have a Vulkan capable GPU):
sudo apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386