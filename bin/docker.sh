
# Wait until the given URL is available
function wait_until_url_available {
  local url=$1
  local retries=60
  while [[ $retries > 0 ]] ; do
    retries=$[$retries-1]
    local rc=$(curl -Is $url | head -n 1|cut -d$' ' -f2)
    if [[ $rc == 200 ]] ; then
      return
    fi
    sleep 5
  done
  exit 1
}

# Stop containers which name contains the given text
function docker::stop_containers {
  docker stop $(docker ps -q --filter="name=$1")
}

# Remove containers which name contains the given text
function docker::rm_containers {
  docker rm $(docker ps -a -q --filter="name=$1")
}

function docker::log_containers {
  for container in $(docker ps -q --filter="name=$1"); do
    echo 'Container: ' $(docker inspect --format='{{.Name}}' $container)
    docker logs $container
  done
}

# Remove volumes which name contains the given text
function docker::rm_volumes {
  docker volume rm $(docker volume ls -q --filter="name=$1")
}

# inspect docker container ip
function docker::container_ip {
  docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $1
}

# inspect docker container full cmd
function docker::container_cmd {
  docker inspect -f "{{.Name}} {{.Config.Cmd}}" $1
}