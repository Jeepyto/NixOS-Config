{ config, pkgs, inputs, ... }:
{
  home.username = "jeepyto";
  home.homeDirectory = "/home/jeepyto";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    ./jeepyto
  ];
}