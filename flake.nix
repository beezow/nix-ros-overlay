{
  description = "ROS overlay for the Nix package manager";

  inputs = {
    nixpkgs.url = "github:beezow/nixpkgs/nix-ros";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    with flake-utils.lib;
    eachSystem allSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ self.overlay ];
      };
    in {
      legacyPackages = pkgs.rosPackages;
    }) // {
      overlay = import ./overlay.nix;
      nixosModule = import ./modules;
    };
}
