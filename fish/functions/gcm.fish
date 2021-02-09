function gcm --description 'Git checkout master'
  set BRANCH (git_default_branch)

  if test $status -eq 1
    echo 'Error: Could not determine default branch. Is this a git repo?'
    return $status
  end

  git checkout $BRANCH
  git pull origin $BRANCH -r
  npmrefresh
end
