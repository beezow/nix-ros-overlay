
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, map-server, cmake-modules, tf2-geometry-msgs, roslint, sensor-msgs, catkin, tf2-ros, tf2, rostest, nav-msgs, neonavigation-common, map-organizer-msgs, pcl-ros, eigen-conversions, roscpp, geometry-msgs, eigen }:
buildRosPackage {
  pname = "ros-lunar-map-organizer";
  version = "0.3.1";

  src = fetchurl {
    url = https://github.com/at-wat/neonavigation-release/archive/release/lunar/map_organizer/0.3.1-0.tar.gz;
    sha256 = "a4bd4fdd6ae684a0188d40223bc0ad7d3384b241aae8995b529f865ac239999f";
  };

  buildInputs = [ map-server cmake-modules tf2-geometry-msgs sensor-msgs tf2-ros tf2 nav-msgs neonavigation-common map-organizer-msgs pcl-ros eigen-conversions roscpp geometry-msgs eigen ];
  checkInputs = [ rostest roslint ];
  propagatedBuildInputs = [ map-server cmake-modules tf2-geometry-msgs sensor-msgs tf2-ros tf2 nav-msgs neonavigation-common map-organizer-msgs pcl-ros eigen-conversions roscpp geometry-msgs eigen ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Layered costmap organizer package'';
    #license = lib.licenses.BSD;
  };
}
