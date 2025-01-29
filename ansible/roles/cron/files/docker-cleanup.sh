#! /bin/bash

max_container_ttl=$1
docker_stop_wait_time=$2

readarray -t container_list < <(docker ps -aq)
for container_id in "${container_list[@]}"; do
    echo -e "Checking container: \033[33m\033[1m${container_id}\033[0m"
    container_status=$(docker container inspect --format="{{.State.Status}}" "${container_id}")
    echo "Status is: ${container_status}"
    if [[ "${container_status}" == "exited" || "${container_status}" == "dead" ]]; then
        echo "Removing ${container_status} container ${container_id}"
        docker rm "${container_id}"
    elif [[ "${container_status}" == "running" || "${container_status}" == "paused" || "${container_status}" == "removing" || "${container_status}" == "created" || "${container_status}" == "restarting" ]]; then
        running_time=$(( $(date +%s) - $(date -d "$(docker container inspect --format='{{.State.StartedAt}}' "${container_id}")" +%s) ))
        echo "Running for ${running_time} seconds."
        if [[ ${running_time} -gt "${max_container_ttl}" ]]; then
            echo "Stopping container ${container_id}"
            docker stop -t "${docker_stop_wait_time}" "${container_id}"
            echo "Removing exited container ${container_id}"
            docker rm "${container_id}"
        else
            echo "Not yet at time limit. Not removed."
        fi
    fi
done

docker volume prune -f
