{ pkgs, lib, ... }:
{
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos;
    
    settings.cgroup_realtime_workaround = lib.mkForce false;
  };

  systemd.services.ananicy-cpp.serviceConfig.Delegate = "cpu cpuset io memory pids";
}
