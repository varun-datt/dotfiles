# Defined in - @ line 0
function lo --description 'alias lo=git log --oneline'
	git log --oneline --decorate $argv;
end
