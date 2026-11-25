{ pkgs, username, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./partitions.nix
  ];

  networking.hostName = "voyageur-02";

  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver # VA-API driver | moonlight dependency
  ];

  services = {
    thermald.enable = true;
    # printing.enable = true; # disabled atm | no printer
  };

  hjem.users.${username}.packages = with pkgs; [
    libreoffice # office suite
    moonlight-qt # client for desktop streaming
    snapshot # camera
  ];
}

