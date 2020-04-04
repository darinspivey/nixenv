function drclear
    docker network ls | grep dockerrunner | awk '{print $1}' | xargs docker network rm
end
