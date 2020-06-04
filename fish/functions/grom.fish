function grom --description 'Git checkout master, pull, change back to current branch'
  #set -l current_branch (git branch | grep \* | cut -d ' ' -f2-)
  #git checkout master
  #git pull origin master
  #git checkout $current_branch
  echo Fetching changes from origin
  git fetch origin
  echo \nRebasing...
  git rebase origin/master ;and npmrefresh
end

