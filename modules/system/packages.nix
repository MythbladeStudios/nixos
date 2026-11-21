{ pkgs, inputs, username, ... }: {

  imports = [
    inputs.noctalia.nixosModules.default
    inputs.umbriel.nixosModules.default

    ../programs/btop.nix # resource monitor
    ../programs/fastfetch.nix
    ../programs/fish.nix
    ../programs/jj.nix
    ../programs/kitty.nix
    ../programs/luciole.nix # file manager
    ../programs/nh.nix # yet another nix helper
    ../programs/sonora.nix # music player
    ../programs/starship.nix
    ../programs/steam.nix
    ../programs/yeetmouse.nix # better mouse acceleration
  ];

  programs = { # using ../users/dotfiles/noctalia & umbriel
    noctalia.enable = true;
    umbriel.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  hjem.users.${username}.packages = with pkgs; [
    aseprite # pixel art
    blockbench
    cine # video player
    decibels # audio player
    equibop # discord client
    # fluxer | waiting for it to be packaged
    fzf # file search dependency | noctalia plugin
    # gnome-calendar | don't really use atm
    gnome-text-editor
    jq # json parcer | required for some noctalia templates
    librewolf # web browser
    loupe # image viewer
    obsidian # markdown notes
    obs-studio
    pandora-launcher # minecraft launcher
    papers # document viewer
    proton-vpn
    # rpi-imager
  ];

  environment.systemPackages = with pkgs; [
    bat # better version of cat
    curl
    dix # compares nix builds
    eza # better ls & tree
    ffmpeg
    git # sonora dependency | not sure why it doesn't work with jj :p
    # nixd # nix language server
  ];
}

