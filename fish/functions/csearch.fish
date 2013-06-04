function csearch
	mdfind -onlyin . -0 $argv[1] | xargs -0 grep -C 6 --color=always $argv[1] | sed s=`pwd`=.=
end
