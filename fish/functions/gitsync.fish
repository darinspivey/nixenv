function gitsync --description 'Sync the current branch to be just like origin'
  set -l current_branch (git branch | grep \* | cut -d ' ' -f2-)

  echo You have requested to sync branch \"$current_branch\" to origin\?

  if read_confirm
    echo 'Bailing out.'
    return
  end if

  git fetch origin
  git reset --hard origin/$current_branch
  echo 'Cleaning up local files...'
  git clean -f
end
