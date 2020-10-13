function npmrefresh --description 'Blow away npm modules and re-install them'
  if not test -d node_modules
    echo 'node_modules directory not detected.  Are you in the project root dir?!'
    return 1
  end

  echo 'Clearing existing node_modules...'
  rm -rf node_modules
  echo Refreshing node_modules...
  if test -f package-lock.json
    npm ci
  else
    npm install
  end
end
