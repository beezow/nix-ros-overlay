
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cppunit, cmake, ros, catkin }:
buildRosPackage {
  pname = "ros-lunar-bfl";
  version = "0.7.0";

  src = fetchurl {
    url = https://github.com/ros-gbp/bfl-release/archive/release/lunar/bfl/0.7.0-0.tar.gz;
    sha256 = "02930745a24727863d41f471795e56c9ec24ef4303430d8b7e92a42cdbddfa0b";
  };

  buildInputs = [ cppunit ros ];
  propagatedBuildInputs = [ cppunit catkin ros ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''This package contains a recent version of the Bayesian Filtering
  Library (BFL), distributed by the Orocos Project.  For stability
  reasons, this package is currently locked to revision 31655 (April
  19, 2010), but this revision will be updated on a regular basis to
  the latest available BFL trunk.  This ROS package does not modify
  BFL in any way, it simply provides a convenient way to download and
  compile the library, because BFL is not available from an OS package
  manager.  This ROS package compiles BFL with the Boost library for
  matrix operations and random number generation.'';
    #license = lib.licenses.LGPL;
  };
}
