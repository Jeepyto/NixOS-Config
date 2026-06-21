{ pkgs }:

pkgs.writeShellScriptBin "nixos-update" ''
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  YELLOW='\033[1;33m'
  NC='\033[0m'

  OLD_SYSTEM=$(readlink -f /run/current-system)

  echo -e "''${YELLOW}Verification de la connectivite reseau...''${NC}"
  COUNTER=0
  while true; do
    if ${pkgs.iputils}/bin/ping -c1 -W2 1.1.1.1 >/dev/null 2>&1 && \
       ${pkgs.iputils}/bin/ping -c1 -W2 cache.nixos.org >/dev/null 2>&1; then
      echo -e "''${GREEN}Reseau disponible.''${NC}"
      break
    fi
    COUNTER=$((COUNTER+1))
    if [ $COUNTER -ge 12 ]; then
      echo -e "''${RED}Pas de reseau apres 60s, abandon.''${NC}"
      exit 1
    fi
    sleep 5
  done

  echo -e "''${YELLOW}Mise a jour du flake.lock...''${NC}"
  sudo ${pkgs.nix}/bin/nix flake update --flake /etc/nixos

  echo -e "''${YELLOW}Rebuild en cours...''${NC}"
  sudo ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch --flake /etc/nixos#nixos
  REBUILD_STATUS=$?

  NEW_SYSTEM=$(readlink -f /run/current-system)

  if [ $REBUILD_STATUS -eq 0 ]; then
    if [ "$OLD_SYSTEM" = "$NEW_SYSTEM" ]; then
      echo -e "''${GREEN}Systeme deja a jour, rien a changer.''${NC}"
    else
      echo -e "''${GREEN}Mise a jour reussie. Differences :''${NC}"
      ${pkgs.nix}/bin/nix store diff-closures "$OLD_SYSTEM" "$NEW_SYSTEM"
    fi
  else
    echo -e "''${RED}Echec de la mise a jour (voir les logs ci-dessus).''${NC}"
    exit $REBUILD_STATUS
  fi
''
