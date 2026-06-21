{ pkgs, ... }:
{
  users.users."jeepyto" = {
    isNormalUser = true;
    description  = "Jeepyto Sajkrohn";
    extraGroups  = [ "networkmanager" "wheel" ];
    shell        = pkgs.fish;
  };
}
