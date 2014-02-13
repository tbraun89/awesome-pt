#!/bin/bash

case "$1" in
	undo)
		if [ -d ~/.config/awesome.t ]
		then
			echo "Undo awesome test install."
			
			rm -rf ~/.config/awesome
			mv ~/.config/awesome.t ~/.config/awesome
		else
			echo "No test installtion, nothing to do."
		fi
	;;

	*)
		if [ ! -d ~/.config/awesome.t ]
		then
			echo "Backup old awesome installtion."
			mv ~/.config/awesome ~/.config/awesome.t
		fi
		
		echo "Creating test installation."
		rm -rf ~/.config/awesome
		mkdir ~/.config/awesome
		cp -r . ~/.config/awesome
	;;
esac

echo 'awesome.restart()' | awesome-client

exit 0
