{
  description = "A basic ros flake to spawn a ros enabled shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.ros-overlay.url = "github:beezow/nix-ros-overlay";
  outputs = { self, nixpkgs, flake-utils, ros-overlay }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      ros = ros-overlay.legacyPackages.${system}.noetic;
    in {
      devShell = pkgs.mkShell {
        nativeBuildInputs = [

 	];
        buildInputs = [
          ros.gazebo-ros
        ];
       
	#set ROS environment vars
	ROS_HOSTNAME = "localhost";
	ROS_MASTER_URI = "http://localhost:11311";

        #setup nvidia offload
        __VK_LAYER_NV_optimus = "NVIDIA_only";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
	__NV_PRIME_RENDER_OFFLOAD_PROVIDER = "NVIDIA-G0";
	__NV_PRIME_RENDER_OFFLOAD = 1;
	
        shellHook = ''
	  source devel/setup.bash
        '';
      };
    });
}
