{
  description = "NixOS jeepyto";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    trcc-linux.url = "github:Lexonight1/thermalright-trcc-linux";
    agenix.url = "github:ryantm/agenix";
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nix-cachyos-kernel, trcc-linux, agenix, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs pkgs-unstable; };
      modules = [
        {
          nixpkgs.config.allowUnfree = true;
        }
        home-manager.nixosModules.default
        trcc-linux.nixosModules.default
        agenix.nixosModules.default
        ./hardware-configuration.nix
        ./modules
        {
          nixpkgs.overlays = [
            nix-cachyos-kernel.overlays.pinned
          ];
          nix.settings = {
            substituters = [
              "https://attic.xuyh0120.win/lantian"
            ];
            trusted-public-keys = [
              "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
            ];
          };
        }
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs pkgs-unstable; };
            users.jeepyto = ./modules/home-manager;
          };
        }
      ];
    };
  };
}
