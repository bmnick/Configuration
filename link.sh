# set up home
homedir=`echo ~`

for file in `ls $homedir/config/dotfiles`
do
	if [ -e "$homedir/.$file" ]; then
		echo "$file is already in home"
		echo "mv $homedir/.$file $homedir/~$file"
		mv "$homedir/.$file" "$homedir/~$file"
	fi
	echo "cp $homedir/config/dotfiles/$file $homedir/.$file"
	cp -R "$homedir/config/dotfiles/$file" "$homedir/.$file"
done

# handle special files
echo "cp $homedir/config/spfiles/Reflection.class $homedir/Reflection.class"
cp "$homedir/config/spfiles/Reflection.class" "$homedir/Reflection.class"
echo "cp $homedir/config/.oh-my-zsh $homedir/.oh-my-zsh"
cp -R "$homedir/config/.oh-my-zsh" "$homedir/.oh-my-zsh"
echo "cp $homedir/config/spfiles/prose.zsh-theme $homedir/.oh-my-zsh/themes/prose.zsh-theme"
cp "$homedir/config/spfiles/prose.zsh-theme" "$homedir/.oh-my-zsh/themes/prose.zsh-theme"
