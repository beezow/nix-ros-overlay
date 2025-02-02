
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, geometry-msgs, openssl, ros-babel-fish-test-msgs, rosapi, roscpp, roscpp-tutorials, rosgraph-msgs, roslib, rostest, std-msgs, std-srvs, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-ros-babel-fish";
  version = "0.9.2-r1";

  src = fetchurl {
    url = "https://github.com/StefanFabian/ros_babel_fish-release/archive/release/noetic/ros_babel_fish/0.9.2-1.tar.gz";
    name = "0.9.2-1.tar.gz";
    sha256 = "b744a0b74ee7d6073440f24092a51d614ee1ac29b1653a13d695c27dc0ece8f5";
  };

  buildType = "catkin";
  checkInputs = [ geometry-msgs ros-babel-fish-test-msgs rosapi roscpp-tutorials rosgraph-msgs rostest std-msgs std-srvs visualization-msgs ];
  propagatedBuildInputs = [ actionlib openssl roscpp roslib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A runtime message handler for ROS.
    Allows subscription, publishing, calling of services and actions with messages known only at runtime.'';
    license = with lib.licenses; [ mit ];
  };
}
