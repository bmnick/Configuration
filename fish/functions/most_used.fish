function most_used
	history | awk '{print $2 $3}' | awk 'BEGIN {FS="|"}{print $1}' | sort | uniq -c | sort -n | tail | sort -nr 
end
