function push --description 'Push the current branch to gitlab'
  set -l current_branch (git branch | grep \* | cut -d ' ' -f2-)
  echo Branch is $current_branch
  npm run lint ;and git push -f origin $current_branch
end
