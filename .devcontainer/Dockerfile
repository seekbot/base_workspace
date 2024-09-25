# ROS2 DISTRO
ARG ROS_DISTRO=humble
FROM osrf/ros:${ROS_DISTRO}-desktop-full

# Workspace directories (Change directory names as needed)
ARG base_ws_dir=ros2-devcont-template
ENV BASE_WS_DIR=${base_ws_dir}
ARG ros_ws_dir=ros2_ws
ENV ROS_WS_DIR=${ros_ws_dir}

# Add non-root user with same credential as host
ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=${USER_UID}
RUN if ! id -u $USER_UID  >/dev/null 2>&1; then \
    groupadd --gid ${USER_GID} ${USERNAME} && \
    useradd -s /bin/bash --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME};\
    fi

# Sudo support for non-root user
RUN apt-get update && \
    apt-get install -y sudo && \
    echo "${USERNAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} && \
    chmod 0440 /etc/sudoers.d/${USERNAME}

# Install additional packages here
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3-pip python-is-python3 ssh git gedit neovim
ENV SHELL /bin/bash

# Create ROS workspace & src directory
WORKDIR /${BASE_WS_DIR}/${ROS_WS_DIR}/src

# Switch to user from root
USER ${USERNAME}

CMD [ "/bin/bash" ]