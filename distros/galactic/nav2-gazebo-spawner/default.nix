
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-lint-auto, ament-lint-common, pythonPackages, rclpy, std-msgs }:
buildRosPackage {
  pname = "ros-galactic-nav2-gazebo-spawner";
  version = "1.0.8-r1";

  src = fetchurl {
    url = "https://github.com/SteveMacenski/navigation2-release/archive/release/galactic/nav2_gazebo_spawner/1.0.8-1.tar.gz";
    name = "1.0.8-1.tar.gz";
    sha256 = "c39156475df3d313df0e07e2b207f97d3a25eb3a44e641a7c46c07d6f2c6f919";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-lint-auto ament-lint-common pythonPackages.pytest ];
  propagatedBuildInputs = [ rclpy std-msgs ];

  meta = {
    description = ''Package for spawning a robot model into Gazebo for Nav2'';
    license = with lib.licenses; [ asl20 ];
  };
}
