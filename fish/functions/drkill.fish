function drkill --description 'Kill all the docker processes'
  ps axuw | grep docker | grep -v grep | awk '{print $2}' | xargs kill -9
end
