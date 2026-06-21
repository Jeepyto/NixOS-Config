{ ... }:
{
  # ── FASTFETCH ──
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/master/doc/json_schema.json";
      logo = {
        padding = {
          top = 2;
        };
      };
      modules = [
        "break"
        "break"
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "display"
        "de"
        "wm"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "swap"
        "disk"
        "locale"
        {
          type = "command";
          key = "NixOS depuis";
          keyColor = "cyan";
          text = "system-age";
        }
        "break"
        "break"
      ];
    };
  };
}