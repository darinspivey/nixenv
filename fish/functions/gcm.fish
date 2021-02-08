function gcm --description 'Git checkout master'
  if git ls-remote --exit-code --heads origin refs/heads/master > /dev/null
    set branch 'master'
  else if git ls-remote --exit-code --heads origin refs/heads/main > /dev/null
    set branch 'main'
  else
    echo "Neither branch 'master' nor 'main' was found!"
    return 1
  end
  
  git checkout $branch
  git pull origin $branch -r
  npmrefresh
end
