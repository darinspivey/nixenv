function dockerclean --description 'Clear some space'
  docker volume rm (docker volume ls -q)
end
