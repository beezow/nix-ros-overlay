
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, poco, cmake-modules, boost, catkin, console-bridge }:
buildRosPackage {
  pname = "ros-lunar-class-loader";
  version = "0.3.9";

  src = fetchurl {
    url = https://github.com/ros-gbp/class_loader-release/archive/release/lunar/class_loader/0.3.9-0.tar.gz;
    sha256 = "8833b03c58e34cf3a40e42e5c0898f8294ae9f47a8128d23ae539546c6abdc32";
  };

  buildInputs = [ poco console-bridge cmake-modules boost ];
  propagatedBuildInputs = [ poco console-bridge boost ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The class_loader package is a ROS-independent package for loading plugins during runtime and the foundation of the higher level ROS &quot;pluginlib&quot; library. class_loader utilizes the host operating system's runtime loader to open runtime libraries (e.g. .so/.dll files), introspect the library for exported plugin classes, and allows users to instantiate objects of said exported classes without the explicit declaration (i.e. header file) for those classes.'';
    #license = lib.licenses.BSD;
  };
}
