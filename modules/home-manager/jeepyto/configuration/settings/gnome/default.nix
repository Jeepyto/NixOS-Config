{ ... }:
{
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "com.obsproject.Studio.desktop"
        "element-desktop.desktop"
        "discord.desktop"
        "steam.desktop"
        "code.desktop"
        "dbeaver.desktop"
        "realvnc-vncviewer.desktop"
        "blender.desktop"
        "org.freecad.FreeCAD.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Console.desktop"
      ];
      disable-user-extensions = false;
      enabled-extensions = [
        "caffeine@patapon.info"
        "appindicatorsupport@rgcjonas.gmail.com"
        "dash-to-dock@micxgx.gmail.com"
        "quick-settings-audio-panel@rayzeq.github.io"
        "Vitals@CoreCoding.com"
        "Bluetooth-Battery-Meter@maniacx.github.com"
      ];
    };
    "org/gnome/desktop/interface" = {
      icon-theme = "Obsidian";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      focus-mode = "click";
      visual-bell = false;
    };
  };
}