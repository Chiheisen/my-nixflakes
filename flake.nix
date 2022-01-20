{
  description = "My (mostly gaming) nix pkgs";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };

  outputs = inputs @ { self, nixpkgs, utils, ... }:
    utils.lib.mkFlake
      {
        inherit self inputs;

        supportedSystems = [ "i686-linux" "x86_64-linux" ];
        channels.nixpkgs.overlaysBuilder = _: [ (import ./pkgs { inherit inputs self; }) ];
        overlays = utils.lib.exportOverlays { inherit (self) pkgs inputs; };
        outputsBuilder = channels: rec {
          packages = utils.lib.exportPackages self.overlays channels;
        };
      };
}
