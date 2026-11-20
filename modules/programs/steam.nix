{ pkgs, inputs, ... }: {

  nixpkgs.overlays = [
    inputs.millennium.overlays.default
    inputs.proton-cachyos.overlays.default
  ];

  hardware.steam-hardware.enable = true;

  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam; # modded steam client
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.steam.extraCompatPackages = with pkgs; [
    proton-cachyos-v3
    proton-cachyos
    proton-ge-bin
  ];

  environment.systemPackages = with pkgs; [
    mangohud # fps overlay
  ];
}

