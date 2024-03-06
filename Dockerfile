ARG UBUNTU_VERSION=22.04

FROM damanikjosh/virtualgl-turbovnc:virtualgl3.1-ubuntu${UBUNTU_VERSION}
LABEL authors="Joshua J. Damanik"

ARG ROS_DISTRO=humble

ENV DEBIAN_FRONTEND noninteractive

# Install ros2
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null \
    && apt-get update && apt-get install -y --no-install-recommends \
    ros-${ROS_DISTRO}-desktop \
    ros-dev-tools \
    && rm -rf /var/lib/apt/lists/*

ENV ROS_DISTRO=${ROS_DISTRO}
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]