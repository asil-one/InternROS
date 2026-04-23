FROM --platform=linux/amd64 tiryoh/ros2-desktop-vnc:humble
# 1. Setup Environment
ENV TURTLEBOT3_MODEL=waffle
WORKDIR /home/ubuntu/workspace
# 2. Install EVERYTHING via apt-get (No compiling from source needed!)
RUN apt-get update && apt-get install -y \
ros-humble-navigation2 \
ros-humble-nav2-bringup \
ros-humble-dynamixel-sdk \
ros-humble-turtlebot3-msgs \
ros-humble-turtlebot3 \
ros-humble-turtlebot3-simulations \
ros-humble-gazebo-ros-pkgs \
python3-colcon-common-extensions \
git \
&& rm -rf /var/lib/apt/lists/*
# 3. Automatically source ROS for the user
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc && \
echo "export TURTLEBOT3_MODEL=waffle" >> ~/.bashrc
