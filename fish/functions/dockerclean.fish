function dockerclean --description 'Clear some space'
  #docker volume rm (docker volume ls -q)
  #docker rmi (docker images -f dangling=true -q)
  docker system prune -f
end
