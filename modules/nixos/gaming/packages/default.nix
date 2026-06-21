{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dualsensectl
    vkbasalt
    vulkan-tools
    umu-launcher
    wineWow64Packages.stable
  ];
}
