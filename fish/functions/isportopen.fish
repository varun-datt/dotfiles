function is-port-open --description 'Checks if port is open'
  curl -ks $argv; echo Connected.; or echo Fail. 
end
