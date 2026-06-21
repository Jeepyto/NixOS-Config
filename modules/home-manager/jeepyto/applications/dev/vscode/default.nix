{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-fr
      jnoortheen.nix-ide
      ms-python.python
      ecmel.vscode-html-css
    ];
  };
  
  xdg.configFile."Code/argv.json".text = builtins.toJSON {
    locale = "fr";
  };
}
