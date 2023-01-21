yay install lib32-nvidia-utils nvidia
sudo pacman -S lib32-mesa lib32-keyutils lib32-nvidia-utils lib32-nvidia-cg-toolkit opencl-nvidia vulkan-headers
sudo usermod -a -G seat username
sudo systemctl enable seatd
sudo pacman -S nvidia nvidia-dkms
