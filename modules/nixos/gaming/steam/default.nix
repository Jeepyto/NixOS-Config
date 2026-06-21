{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    # Variables d'environnement appliquees a tous les jeux lances via Steam,
    # gaming-mode %COMMAND% a placer en option de lancement pour activer gamemode 
    # et passer le profil d'alimentation en mode performance
    package = pkgs.steam.override {
      extraEnv = {
        MANGOHUD = true;
        OBS_VKCAPTURE = true;
        PROTON_PRIORITY_HIGH = true;
        PROTON_FSR4_UPGRADE = true;
      };
    };
  };
  hardware.steam-hardware.enable = true;
}
