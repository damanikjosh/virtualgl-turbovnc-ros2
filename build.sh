#!/bin/bash

docker build -t damanikjosh/virtualgl-turbovnc-ros2:latest -t damanikjosh/virtualgl-turbovnc-ros2:iron --build-arg="UBUNTU_VERSION=22.04" --build-arg="ROS_DISTRO=iron" .
docker build -t damanikjosh/virtualgl-turbovnc-ros2:humble --build-arg="UBUNTU_VERSION=22.04" --build-arg="ROS_DISTRO=humble" .
docker build -t damanikjosh/virtualgl-turbovnc-ros2:galactic --build-arg="UBUNTU_VERSION=20.04" --build-arg="ROS_DISTRO=galactic" .
docker build -t damanikjosh/virtualgl-turbovnc-ros2:foxy --build-arg="UBUNTU_VERSION=20.04" --build-arg="ROS_DISTRO=foxy" .
docker push damanikjosh/virtualgl-turbovnc-ros2 --all-tags