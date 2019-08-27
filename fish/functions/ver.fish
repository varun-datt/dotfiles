# Defined in - @ line 0

function ver --description 'Current and latest version'
  set -lx GREENC '\033[0;32m'
  set -lx REDC '\033[0;31m'
  set -lx NC '\033[0m'

  echo -e "\n$GREENC \rCurrent:$NC";
  # awk to get the lines after the 1; grep regex highlight
  cat version | awk 'NR>=2' | grep --color -z -P '([0-9]+(\.[0-9]+)+)|((?<=$SOMETHING ).+)|((?<=$SOMETHING )[0-9]+)'
  echo -e "\n$GREENC \rAvailable:$NC";
  if count $argv > /dev/null
    set -lx temp (curl -s --request GET \
      --url "some_url" \
      --header 'content-type: application/json' | jq -r '.data[0] | "\(.id) \(.attributes.updated)"')
    set -lx temp (string split " " $temp)
    echo -e "$argv $REDC$temp[1]$NC $temp[2]"
  else
    # ls -t to sort the folders (to get last modified); sed to replace the end of the line with a wild card string
    # use xargs to provide the wild card to ls -t and use head to get the first sorted entry
    # awk to format and grep to highlight
    ls -td -- some_folder/8.1.* | sed 's|$|/*/SOMETHING_*_SOMETHING/install|' | xargs -I@ sh -c 'ls -tld @ | head -n 1' |  awk '{printf "%3s %2s %4s \t%s\n",$6,$7,$8,$9}' | grep '\([0-9]*\.\+[0-9]\+\)\+_\([0-9]\+\)';
    echo
  end
end