image_name=ghcr.io/mlflow/mlflow:v2.7.1
docker run -it -d --rm \
    --gpus all \
    --privileged \
    --hostname in_docker \
    --add-host in_docker:127.0.0.1 \
    --add-host $(hostname):127.0.0.1 \
    --shm-size 2G \
    -e DISPLAY \
    -p 6019:22 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /media:/media \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --name mlflow_client \
    -v /mnt:/mnt \
    -v /home/zebin/work/mlflow:/mlflow \
    -w /mlflow \
    $image_name \
    /bin/bash
