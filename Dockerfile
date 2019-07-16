FROM osrf/ros:indigo-desktop-full
RUN echo 'export ROS_IP=192.168.0.1 export ROS_MASTER_URI=http://192.168.0.1:11311' >> /opt/ros/indigo/setup.sh &&     echo 'echo 192.168.0.1 ilife >> /etc/hosts' >> /opt/ros/indigo/setup.sh

command:
xhost + && sudo docker run -it \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"  -v ~/.rviz/default.rviz:/root/.rviz/default.rviz \
    ros:ilife_x900 \
    bash -c "rosrun rviz rviz /root/.rviz/default.rviz"

