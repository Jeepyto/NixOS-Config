{ ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # stateVersion : date de la première installation, ne pas changer
  system.stateVersion = "26.05";
}

