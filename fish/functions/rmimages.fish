function rmimages --description 'Remove all docker images'
  docker images -q | xargs docker rmi
end
