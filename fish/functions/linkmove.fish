function linkmove
	test -e $argv[1] -a -e $argv[2]; and mv $argv[1] $argv[2]; and ln -s $argv[2]/(basename $argv[1]) (dirname $argv[1]);
end
