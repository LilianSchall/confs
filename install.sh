files="config vimrc Xauthority Xinitrc Xresources";

for word in $files; do
	echo 'ln -s' "$(pwd)/$word" "$HOME/.$word";
    ln -s "$(pwd)/$word" "$HOME/.$word";
done

./setting-up-nix.sh
