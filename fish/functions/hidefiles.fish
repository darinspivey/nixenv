function hidefiles --description 'Hide hidden files'
  defaults write com.apple.finder AppleShowAllFiles -bool false
  killall Finder
end
