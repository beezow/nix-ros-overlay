
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, hardware-interface, control-toolbox, catkin, qb-device-hardware-interface, roscpp, transmission-interface }:
buildRosPackage {
  pname = "ros-lunar-qb-hand-hardware-interface";
  version = "2.0.0-r1";

  src = fetchurl {
    url = https://bitbucket.org/qbrobotics/qbhand-ros-release/get/release/lunar/qb_hand_hardware_interface/2.0.0-1.tar.gz;
    sha256 = "7b098f8ed2cea969b529b65c5ca89fa1a18c9b40cf7d8b735f2553c19c1fbb55";
  };

  buildInputs = [ hardware-interface transmission-interface control-toolbox roscpp qb-device-hardware-interface ];
  propagatedBuildInputs = [ hardware-interface transmission-interface control-toolbox roscpp qb-device-hardware-interface ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains the hardware interface for qbrobotics® qbhand device.'';
    #license = lib.licenses.BSD 3-Clause;
  };
}
