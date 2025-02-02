
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake, octomap }:
buildRosPackage {
  pname = "ros-melodic-dynamic-edt-3d";
  version = "1.9.7-r1";

  src = fetchurl {
    url = "https://github.com/ros-gbp/octomap-release/archive/release/melodic/dynamic_edt_3d/1.9.7-1.tar.gz";
    name = "1.9.7-1.tar.gz";
    sha256 = "b716b393f7a79fbcf653cb96ed7ce995ef0d02f29653db7ecf7087259a31322d";
  };

  buildType = "cmake";
  propagatedBuildInputs = [ catkin octomap ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''The dynamicEDT3D library implements an inrementally updatable Euclidean distance transform (EDT) in 3D. It comes with a wrapper to use the OctoMap 3D representation and hooks into the change detection of the OctoMap library to propagate changes to the EDT.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
