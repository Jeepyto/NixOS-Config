{ pkgs, ... }:
let
  system-age = pkgs.callPackage ../../../../pkgs/system-age.nix {};
in
{
  programs.fish.enable = true;
  
  environment.systemPackages = [
    system-age
  ];
  
  # Lance fastfetch automatiquement a chaque ouverture de terminal interactif
  programs.fish.interactiveShellInit = ''
    set fish_greeting
    fastfetch
  '';  
}
  
