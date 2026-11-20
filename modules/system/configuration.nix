{ pkgs, lib, username, ... }: {

  imports = [
    ./bootloader.nix
    ./cachix.nix
    ./dconf.nix
    ./fonts.nix
    ./greeter.nix
    ./mimeapps.nix
    ./packages.nix
    ./portals.nix
    ./security.nix
    ./services.nix
    ./session.nix
    ./zram.nix
  ];

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    channel.enable = false;
    optimise.automatic = true;
  };

  documentation = {
    enable = false;
    man.enable = lib.mkForce false;
  };

  users.users.${username} = {
    description = "Michael James";
    isNormalUser = true;
    extraGroups = [ "input" "audio" "video" "wheel" "networkmanager" "yeetmouse" ];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [""]; # ssh-keygen on both atelier-01 and voyageur-02
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  system.stateVersion = "26.05";
}

