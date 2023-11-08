# docker image for ros2 (humble) dev environment

This image is only tested on linux (x11) hosts.

### `features`
- ros env with x11 gui support
- gazebo setup

#### WIP
<!-- to update later  -->

## How to build ?

clone the repo
```
git clone https://github.com/shvass/ros-env-img.git  &&  cd ros-env-img
```

Three scripts are provided
- `./build.sh`  (to build the image)
- `./run.sh`      (run a temporary instance of the image)
- `./rund.sh  container-name  extra-params`   (run a detached instance for long term dev env)

```
./build.sh
```