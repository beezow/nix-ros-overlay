
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, rosconsole, cv-bridge, polled-camera, rosgraph-msgs, rospy, tf, gazebo-msgs, geometry-msgs, image-transport, message-generation, message-runtime, angles, std-srvs, camera-info-manager, trajectory-msgs, catkin, tf2-ros, gazebo-dev, nav-msgs, urdf, std-msgs, roscpp, nodelet, sensor-msgs, diagnostic-updater, rostest, dynamic-reconfigure }:
buildRosPackage {
  pname = "ros-lunar-gazebo-plugins";
  version = "2.7.6";

  src = fetchurl {
    url = https://github.com/ros-gbp/gazebo_ros_pkgs-release/archive/release/lunar/gazebo_plugins/2.7.6-0.tar.gz;
    sha256 = "214e34ebae590a3bdefa21e43e5388a79731df957bd4ca1cd745b027221c396e";
  };

  buildInputs = [ std-srvs rosconsole camera-info-manager trajectory-msgs cv-bridge polled-camera tf2-ros gazebo-dev rosgraph-msgs nav-msgs urdf rospy std-msgs dynamic-reconfigure roscpp nodelet tf gazebo-msgs geometry-msgs image-transport sensor-msgs diagnostic-updater message-generation angles ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ std-srvs rosconsole camera-info-manager trajectory-msgs cv-bridge polled-camera tf2-ros gazebo-dev rosgraph-msgs nav-msgs urdf rospy std-msgs dynamic-reconfigure roscpp nodelet tf gazebo-msgs geometry-msgs image-transport sensor-msgs diagnostic-updater message-runtime angles ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Robot-independent Gazebo plugins for sensors, motors and dynamic reconfigurable components.'';
    #license = lib.licenses.BSD, Apache 2.0;
  };
}
