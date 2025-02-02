
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, aws-common, catkin, gtest, roscpp, rostest }:
buildRosPackage {
  pname = "ros-melodic-aws-ros1-common";
  version = "2.0.3-r1";

  src = fetchurl {
    url = "https://github.com/aws-gbp/aws_ros1_common-release/archive/release/melodic/aws_ros1_common/2.0.3-1.tar.gz";
    name = "2.0.3-1.tar.gz";
    sha256 = "24a738e160ad02cdb48e5ff6334739193edc14583b90bce7d77c9f735b00864e";
  };

  buildType = "catkin";
  checkInputs = [ gtest rostest ];
  propagatedBuildInputs = [ aws-common roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Common utilities for ROS1 nodes using Amazon Web Services'';
    license = with lib.licenses; [ asl20 ];
  };
}
