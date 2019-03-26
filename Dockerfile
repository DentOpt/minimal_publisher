FROM ros:crystal

# install ros build tools
RUN apt-get update \
    && apt-get install -y python3-colcon-common-extensions \
    && rm -rf /var/lib/apt/lists/*

# clone ros package repo
ENV ROS2_WS  /home/ros2_ws
RUN mkdir -p ${ROS2_WS}/src/minimal_publisher
COPY ./ ${ROS2_WS}/src/minimal_publisher
# build repo
RUN cd ${ROS2_WS} \
 	&& colcon build \
 	&& source ${ROS2_WS}/install/setup.bash


CMD ["bash"]

