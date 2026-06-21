{ pkgs, ... }:
{
  programs.gamemode = {
    enable = true;
    settings = {
      general.renice = 10;
      gpu.amd_performance_level = "high";
    };
  };
  
  services.power-profiles-daemon.enable = true;

  environment.systemPackages = [
    (pkgs.callPackage ../../../../pkgs/game-performance.nix {})
  ];
}
