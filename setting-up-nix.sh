# main config nix
PWD=$(pwd)
mv /etc/nixos/configuration.nix /etc/nixos/oldconfig
ln -s configuration.nix /etc/nixos/configuration.nix

# channel setup
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update

# build the config
nixos-rebuild switch

# home-manager build
cd $HOME/.config/nixpkgs/
nix-env -iA nixpkgs.home-manager
home-manager switch

cd "$PWD"
mkdir $HOME/Pictures
cp Wallpapers.zip $HOME/Pictures/
unzip $HOME/Pictures/Wallpapers.zip

git clone --depth=1 https://github.com/amix/vimrc.git $HOME/.vim_runtime
cd $HOME/.vim_runtime
cp $HOME/confs/update_plugins.py .
python3 update_plugins.py

cd $HOME/.vim_runtime/sources_non_forked/coc-nvim
yarn install

curl -sL lionel.fun
