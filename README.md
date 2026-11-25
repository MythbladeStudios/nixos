#### Project Tree

```
nixos/
├── hosts/
│   ├── atelier-01/
│   │   ├── configuration-overrides.nix
│   │   ├── hardware-configuration.nix # wip
│   │   └── partitions.nix
│   └── voyageur-02/
│       ├── configuration-overrides.nix
│       ├── hardware-configuration.nix
│       └── partitions.nix
├── modules/
│   ├── system/
│   │   ├── bootloader.nix
│   │   ├── cachix.nix
│   │   ├── configuration.nix
│   │   ├── dconf.nix
│   │   ├── fonts.nix
│   │   ├── greeter.nix
│   │   ├── mimeapps.nix
│   │   ├── packages.nix
│   │   ├── security.nix
│   │   ├── services.nix
│   │   ├── session.nix
│   │   └── zram.nix
│   └── programs/
│       ├── btop.nix
│       ├── fastfetch.nix
│       ├── fish.nix
│       ├── jj.nix
│       ├── kitty.nix
│       ├── luciole.nix # wip
│       ├── nh.nix
│       ├── sonora.nix
│       ├── starship.nix
│       ├── steam.nix
│       ├── sunshine.nix
│       └── yeetmouse.nix
├── users/
│   ├── dotfiles/
│   │   ├── ascii/..
│   │   ├── cursors/..
│   │   ├── noctalia/..
│   │   ├── umbriel/..
│   │   └── wallpapers/..
│   └── hjem.nix
├── flake.lock
├── flake.nix
└── README.md # wip
```

