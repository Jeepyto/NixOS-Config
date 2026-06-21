{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    languagePacks = [ "fr" ];

    profiles.default = {
      id = 0;
      settings = {
        "intl.locale.requested" = "fr";
      };
    };
  };
}
