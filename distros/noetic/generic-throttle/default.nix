
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, python3Packages, rospy, rostopic }:
buildRosPackage {
  pname = "ros-noetic-generic-throttle";
  version = "0.6.27-r1";

  src = fetchurl {
    url = "https://github.com/ipa320/cob_command_tools-release/archive/release/noetic/generic_throttle/0.6.27-1.tar.gz";
    name = "0.6.27-1.tar.gz";
    sha256 = "97ef0975e870870524ee365abfb050edc20e53c9b6b2e2f9b1755f1925274bf2";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ cv-bridge rospy rostopic ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''This package provides a throttle for ROS topics'';
    license = with lib.licenses; [ asl20 ];
  };
}
