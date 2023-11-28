# ros2-docker-desktop

Run ROS 2 in docker container on Desktop

## Container with `ros` user (uid 1000)

Build the docker image as `ros2dockerdesktop` and run as follows with ros user:

```
docker run -it --user ros -v $PWD/src:/src --network=host --ipc=host ros2dockerdesktop
```

## Graphics and GPU support

```
docker run -it --user ros \
    -v $PWD/src:/src \
    --network=host --ipc=host \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --env=DISPLAY \
    ros2dockerdesktop
```


```
docker run -it --user ros \
    -v $PWD/src:/src \
    --network=host --ipc=host \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --env=DISPLAY \
    --gpus all \
    --runtime=nvidia \
    --env="QT_X11_NO_MITSHM=1" \
    --env="NVIDIA_DRIVER_CAPABILITIES=all" \
    --env="NVIDIA_VISIBLE_DEVICES=all" \
    --device=/dev/dri:/dev/dri \
    ros2dockerdesktop
```