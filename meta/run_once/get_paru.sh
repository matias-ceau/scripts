# Install rust/cargo if you don't have them
sudo pacman -S --needed base-devel rust

# Clone and build paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
