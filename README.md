# NixOS Config — jeepyto

Configuration NixOS personnelle, gérée avec [flakes](https://nixos.wiki/wiki/Flakes), [home-manager](https://github.com/nix-community/home-manager) et [agenix](https://github.com/ryantm/agenix) pour la gestion des secrets.

## Stack

- **NixOS 26.05**
- **home-manager** pour la config utilisateur (`jeepyto`)
- **agenix** pour chiffrer les secrets (mots de passe, identifiants de connexion)
- **nix-cachyos-kernel** pour le kernel
- **flakes** comme point d'entrée unique

## Structure

```
.
├── flake.nix                  # Point d'entrée : inputs (nixpkgs, home-manager, agenix...) et outputs
├── flake.lock                 # Versions verrouillées des inputs
├── hardware-configuration.nix # Généré automatiquement par nixos-generate-config, ne pas modifier à la main
├── secrets.nix                # Déclaration agenix : quelle clé publique déchiffre quel secret
├── dbeaver-secrets.age        # Secret chiffré (identifiants DBeaver), illisible sans la clé privée
│
├── modules/
│   ├── nixos/                 # Modules système (niveau OS)
│   │   ├── dev/                   # Outils de développement (DBeaver avec secrets injectés)
│   │   ├── gaming/                 # Steam, Lutris, optimisations performance
│   │   ├── streaming/              # OBS Studio
│   │   ├── studio/                 # Blender
│   │   ├── system/                 # Boot, kernel, réseau, agenix, services, utilisateurs
│   │   ├── environnement/          # Environnement de bureau (GNOME)
│   │   ├── utilities/               # Scripts utilitaires (mise à jour système)
│   │   └── vm/                      # Config VMware
│   │
│   └── home-manager/          # Modules utilisateur (niveau home-manager, pour jeepyto)
│       └── jeepyto/
│           ├── applications/        # Apps : communication (Discord, Element), navigateur (Firefox),
│           │                        #        dev (VSCode, RealVNC), office (LibreOffice), studio (FreeCAD)
│           └── configuration/       # Réglages perso : fish, fastfetch, GNOME, MangoHud
│
└── pkgs/                      # Paquets custom ou overrides
    ├── game-performance.nix
    ├── nixos-update.nix
    └── system-age.nix
```

Ce dépôt est public en lecture pour permettre à d'autres utilisateurs NixOS de s'en inspirer, mais reste un projet personnel : je suis seul à fusionner les changements.
