
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, diagnostic-msgs, geometry-msgs, roslint, pythonPackages, message-filters, message-generation, message-runtime, eigen-conversions, std-srvs, tf2-geometry-msgs, rosbag, catkin, tf2-ros, nav-msgs, xmlrpcpp, std-msgs, roscpp, nodelet, cmake-modules, libyamlcpp, sensor-msgs, geographic-msgs, diagnostic-updater, tf2, rostest, eigen, rosunit }:
buildRosPackage {
  pname = "ros-lunar-robot-localization";
  version = "2.5.6";

  src = fetchurl {
    url = https://github.com/cra-ros-pkg/robot_localization-release/archive/release/lunar/robot_localization/2.5.6-0.tar.gz;
    sha256 = "43fdd160854708d2fb07ebdf5a854931136c714d66bcb9a55f33f5d323435dfb";
  };

  buildInputs = [ std-srvs tf2-geometry-msgs tf2-ros nav-msgs xmlrpcpp std-msgs diagnostic-msgs nodelet roscpp geometry-msgs cmake-modules roslint libyamlcpp sensor-msgs message-filters eigen-conversions geographic-msgs diagnostic-updater tf2 message-generation eigen pythonPackages.catkin-pkg ];
  checkInputs = [ rostest rosbag rosunit ];
  propagatedBuildInputs = [ std-srvs tf2-geometry-msgs tf2-ros nav-msgs xmlrpcpp std-msgs diagnostic-msgs nodelet roscpp geometry-msgs cmake-modules libyamlcpp sensor-msgs message-filters geographic-msgs diagnostic-updater tf2 message-runtime eigen eigen-conversions ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Provides nonlinear state estimation through sensor fusion of an abritrary number of sensors.'';
    #license = lib.licenses.BSD;
  };
}
