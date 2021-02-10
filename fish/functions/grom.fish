function grom --description 'Git checkout master, pull, change back to current branch'
  set branch (git_default_branch)

  if test $status -eq 1
    echo 'Error: Could not determine default branch. Is this a git repo?'
    return $status
  end

  echo Fetching changes from origin
  git fetch origin
  echo \nRebasing...
  git rebase origin/$branch ;and npmrefresh
end
