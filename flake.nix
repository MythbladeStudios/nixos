{ 
  inputs = {

    disko = { # partitions
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = { # fuck yeah, no more homemanager :p
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    luciole = { # file manager
      url = "github:noctalia-dev/luciole";
    };

    millennium = { # modded steam client
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    };

    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-26.05";
    };

    noctalia = { # desktop shell
      url = "github:noctalia-dev/noctalia/cachix";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
    };

    proton-cachyos = {
      url = "github:Daaboulex/proton-cachyos-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sonora = { # music player
      url = "github:sonorahq/sonora";
    };

    umbriel = { # window manager
      url = "github:noctalia-dev/umbriel/cachix";
    };

    yeetmouse = { # better mouse accel
      url = "github:AndyFilter/YeetMouse?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations = nixpkgs.lib.genAttrs [ "atelier-01" "voyageur-02" ] (hostName:
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          username = "mythblade";
          dotfiles = "/etc/nixos/users/dotfiles";
        };

        modules = [
          ./modules/system/configuration.nix
          ./hosts/${hostName}/configuration-overrides.nix
          ./users/hjem.nix
        ];
      }
    );
  };
}

