function nb --description 'Create a new branch, nuke node_modules, and npm install'
  set -l name $argv[1]
  if not test $name
    echo 'Usage: nb [ticket/identifier]'
    return
  end

  if git ls-remote --exit-code --heads origin refs/heads/main > /dev/null
    set branch 'main'
  else if git ls-remote --exit-code --heads origin refs/heads/master > /dev/null
    set branch 'master'
  else
    echo "Neither branch 'master' nor 'main' was found!"
    return 1
  end

  git checkout $branch
  git pull -r
  git checkout -b darinspivey/$name ;and git branch -u origin/$branch ;and npmrefresh
end
