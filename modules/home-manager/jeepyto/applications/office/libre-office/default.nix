{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice-fresh
    hunspell
    hunspellDicts.fr-any
  ];
}