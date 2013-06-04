function openbyname
	find . -name "$argv" | xargs -n 1 open
end
