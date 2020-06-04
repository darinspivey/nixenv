function remco --description 'Check out a remote branch locally'
	git fetch --all
  git checkout -b $argv origin/$argv
  npmrefresh
end
