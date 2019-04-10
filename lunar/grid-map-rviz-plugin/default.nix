
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, grid-map-ros, rviz, qt5, grid-map-msgs }:
buildRosPackage {
  pname = "ros-lunar-grid-map-rviz-plugin";
  version = "1.6.1";

  src = fetchurl {
    url = https://github.com/anybotics/grid_map-release/archive/release/lunar/grid_map_rviz_plugin/1.6.1-0.tar.gz;
    sha256 = "1e2d768563d851726d9a26597b78e75a95540f42ef1b3209096e3cf42e596ad6";
  };

  buildInputs = [ grid-map-msgs grid-map-ros rviz qt5.qtbase ];
  propagatedBuildInputs = [ grid-map-ros rviz grid-map-msgs qt5.qtbase ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''RViz plugin for displaying grid map messages.'';
    #license = lib.licenses.BSD;
  };
}
