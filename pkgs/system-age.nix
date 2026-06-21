{ pkgs }:
pkgs.writeShellScriptBin "system-age" ''
  nix_store="/nix/store"

  if [ ! -e "$nix_store" ]; then
    echo "inconnu"
    exit 0
  fi

  install_epoch=$(${pkgs.coreutils}/bin/stat -c %Z "$nix_store" 2>/dev/null)
  if [ -z "$install_epoch" ]; then
    echo "inconnu"
    exit 0
  fi

  now=$(date +%s)
  days_since=$(( (now - install_epoch) / 86400 ))
  echo "''${days_since} jours"
''

