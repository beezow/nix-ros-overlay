
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, roscpp, roslint, sensor-msgs, serial }:
buildRosPackage {
  pname = "ros-melodic-um7";
  version = "0.0.6-r1";

  src = fetchurl {
    url = "https://github.com/ros-drivers-gbp/um7-release/archive/release/melodic/um7/0.0.6-1.tar.gz";
    name = "0.0.6-1.tar.gz";
    sha256 = "2def3dc297cb32a419cfed279aa05796da9a1129ea6d27a77ca28cc084ae5d39";
  };

  buildType = "catkin";
  buildInputs = [ message-generation ];
  checkInputs = [ roslint ];
  propagatedBuildInputs = [ message-runtime roscpp sensor-msgs serial ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The um7 package provides a C++ implementation of the CH Robotics serial protocol, and a
    corresponding ROS node for publishing standard ROS orientation topics from a UM7.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
