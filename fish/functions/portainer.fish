function portainer --desc 'portainer is a docker container manager'
 docker run -d -p 9191:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
end
