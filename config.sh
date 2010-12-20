#!/bin/bash

# ensure we have hg/zsh or apt-get to get hg/zsh
if 	builtin type -P git &> /dev/null &&
 	builtin type -P vim &> /dev/null &&
	builtin type -P zsh &> /dev/null; then
	echo "You've got everything installed, starting to clone over the config repository"
else
	if builtin type -p apt-get &> /dev/null; then
		echo "You're missing some software, is it ok to install it? [y/N]"
		read confirm
		if [ $confirm = 'y' ]; then
			sudo `which apt-get` install vim zsh git
		else
			# They're finicky, let them install the crap
			echo "Get the required software installed and try again:"
			echo "    git"
			echo "    vim"
			echo "    zsh"
			exit 1
		fi
	else
		# we cannot get everything running right, time to fail out horribly
		echo "You're missing required software and it's not an apt-get based system"
		echo "Get the required software installed and try again:"
		echo "    git"
		echo "    vim"
		echo "    zsh"
		exit 1
	fi
fi

`which git` clone git://github.com/bmnick/Configuration.git ~/config
