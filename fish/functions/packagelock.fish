function packagelock --description 'Backs out changes to package-lock.json'
  if git ls-files | grep package-lock.json
    echo 'Reverting changes to package-lock.json'
    git checkout -- package-lock.json
  else
    echo 'This package doesn\'t already have package-lock.json in its repo, so I won\'t add it now.  Run \'npm i\' if you want to create it.'
    rm package-lock.json
  end
end
