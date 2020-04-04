function drstopall --description 'Stop all running docker containers'
  docker ps | awk '{print $1}' | xargs docker stop
end
