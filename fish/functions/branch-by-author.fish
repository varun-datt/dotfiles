# Defined in - @ line 0
function branch-by-author --description alias\ branch-by-author\ git\ for-each-ref\ --format=\'\%\(committerdate\)\ \%09\ \%\(authorname\)\ \%09\ \%\(refname\)\'\ \|\ sort\ -k5n\ -k2M\ -k3n\ -k4n\ \|\ grep
	git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort -k5n -k2M -k3n -k4n | grep $argv;
end
