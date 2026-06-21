{ pkgs, ... }:
{
  # Enable hardware accelerated graphics drivers (Mesa) for AMD GPU,
  # including 32-bit support for games/apps that need it.
  hardware.graphics = {
    enable      = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr
      rocmPackages.clr.icd
      # Driver VAAPI radeonsi (Mesa) : indispensable pour l'encodage materiel sur OBS
      libva
      libva-utils
    ];
  };

  environment.variables = {
    MESA_SHADER_CACHE_MAX_SIZE = "12G";
    # Force le bon driver VAAPI pour les GPU AMD (radeonsi via Mesa).
    LIBVA_DRIVER_NAME = "radeonsi";
  };
  
  # Force le rendu Wayland natif (Ozone) plutot que XWayland pour les apps
  # Electron compatibles (VS Code, Discord, etc.) : reduit la latence
  # d'affichage et la charge GPU/CPU pour le rendu de l'interface, sur une
  # session GNOME en Wayland (Mutter).
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
