{ pkgs, ... }:
{
  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.excludePackages = [ pkgs.xterm ];
  services.gnome.gnome-browser-connector.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-music
    gnome-maps
    gnome-weather
    gnome-contacts
    gnome-characters
    gnome-clocks
    gnome-connections
    gnome-font-viewer
    gnome-logs
    simple-scan
    epiphany
    showtime
    decibels
    baobab
    gnome-user-share
    yelp
    snapshot
    gnome-calendar
  ];

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.caffeine
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.quick-settings-audio-panel
    gnomeExtensions.vitals
    gnomeExtensions.bluetooth-battery-meter
    iconpack-obsidian
    file-roller
    git
    btop
    vlc
    mesa-demos
    winetricks
  ];

  documentation.nixos.enable = false;
  
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  services.displayManager.autoLogin = {
    enable = true;
    user = "jeepyto";
  };

  programs.dconf.enable = true;
  
  programs.dconf.profiles.gdm.databases = [{
    settings = {
      "org/gnome/desktop/peripherals/keyboard" = {
        numlock-state = true;
      };
    };
  }];
  programs.dconf.profiles.user.databases = [{
    settings = {
      "org/gnome/desktop/peripherals/keyboard" = {
        numlock-state = true;
      };
    };
  }];
}
