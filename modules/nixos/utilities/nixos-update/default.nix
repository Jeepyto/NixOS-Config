{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.callPackage ../../../../pkgs/nixos-update.nix {})
  ];
}
