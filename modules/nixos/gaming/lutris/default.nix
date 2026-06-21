{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.lutris.override {
      extraPkgs = pkgs: with pkgs; [
        vulkan-loader
        libva
      ];
    })
  ];
}
