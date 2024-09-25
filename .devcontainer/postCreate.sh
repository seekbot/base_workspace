#!/bin/bash

# Colcon sub-directory base paths
BUILD_PATH=/${BASE_WS_DIR}/${ROS_WS_DIR}/build
INSTALL_PATH=/${BASE_WS_DIR}/${ROS_WS_DIR}/install
LOG_PATH=/${BASE_WS_DIR}/{$ROS_WS_DIR}/log

# Ensure ROS workspace and src sub-directory exists
mkdir -p /${BASE_WS_DIR}/${ROS_WS_DIR}/src

# Update rosdep & install dependencies
sudo rosdep update
sudo rosdep install --from-paths /${BASE_WS_DIR}/{$ROS_WS_DIR}/src --ignore-src -y

# Change workspace directory ownership
sudo chown -R $(whoami) /${BASE_WS_DIR}/{$ROS_WS_DIR}

# Colcon build
colcon --log-base $LOG_PATH build --symlink-install \
    --build-base $BUILD_PATH --install-base $INSTALL_PATH \
    --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

# Source ROS and add to .bashrc
echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc
echo "source /$BASE_WS_DIR/$ROS_WS_DIR/install/setup.bash" >> ~/.bashrc