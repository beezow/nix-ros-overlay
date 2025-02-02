
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, builtin-interfaces, controller-manager, diff-drive-controller, joint-state-broadcaster, pythonPackages, rclpy, robot-state-publisher, tf2-ros, webots-ros2-control, webots-ros2-driver }:
buildRosPackage {
  pname = "ros-galactic-webots-ros2-turtlebot";
  version = "1.2.2-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/webots_ros2-release/archive/release/galactic/webots_ros2_turtlebot/1.2.2-1.tar.gz";
    name = "1.2.2-1.tar.gz";
    sha256 = "f2cf7a6cc0fc5bf5f18642df5bba7fd95e7b2a0d28ebbe093d774b3a0dfdfe86";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ builtin-interfaces controller-manager diff-drive-controller joint-state-broadcaster rclpy robot-state-publisher tf2-ros webots-ros2-control webots-ros2-driver ];

  meta = {
    description = ''TurtleBot3 Burger robot ROS2 interface for Webots.'';
    license = with lib.licenses; [ asl20 ];
  };
}
