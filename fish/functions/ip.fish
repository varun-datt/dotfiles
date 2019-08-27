# Defined in - @ line 1
function ip
	set _ipa (ifconfig | grep inet | awk '{print $2}' | tail -n1);
	if count $argv > /dev/null
	  echo "http://$_ipa:8080/login?hostname=$argv"
	else
	  echo $_ipa
  end
end
