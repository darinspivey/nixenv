function gcm --description 'Git checkout master'
  git checkout master
  git pull origin master -r
  npmrefresh
end
