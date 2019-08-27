function cleanbr --wraps "git branch"
  if count $argv > /dev/null
    echo git fetch...
    git fetch
    for branch in $argv
      echo Deleting branch $branch...
      sleep 5
      if git branch -r | grep "origin/$branch"
        git push origin :$branch --no-verify
      else
        echo No remote branch found
      end
      if git branch | grep "$branch"
        git branch -D $branch
      else
        echo No local branch found
      end
    end
  else
    echo Empty bro
  end
end
