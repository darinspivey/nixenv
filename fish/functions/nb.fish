function nb --description 'Create a new branch, nuke node_modules, and npm install'
  set -l name $argv[1]
  if not test $name
    echo 'Usage: nb [ticket/identifier]'
    return
  end

  set -l branch (git_default_branch)

  if test $status -eq 1
    echo 'Error: Could not determine default branch. Is this a git repo?'
    return $status
  end

  git checkout $branch
  git pull -r
  git checkout -b darinspivey/$name ;and git branch -u origin/$branch ;and npmrefresh
end
