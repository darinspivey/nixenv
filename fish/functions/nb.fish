function nb --description 'Create a new branch, nuke node_modules, and npm install'
  set -l name $argv[1]
  if not test $name
    echo 'Usage: nb [ticket/identifier]'
    return
  end

  git checkout master
  git pull
  git checkout -b darin.spivey/$name ;and git branch -u origin/master ;and npmrefresh
end
