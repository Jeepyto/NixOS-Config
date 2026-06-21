{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pkgsRocm.blender
  ];
  
  systemd.tmpfiles.rules = [
    "L+ /opt/rocm/hip - - - - ${pkgs.rocmPackages.clr}"
  ];
}
