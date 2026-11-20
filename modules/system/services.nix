{ ... }: {

  networking.networkmanager.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services = {
    greetd.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
    gvfs.enable = true;
    btrfs.autoScrub.enable = true;
    gnome.gnome-keyring.enable = true;
    blueman.enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
    settings.PasswordAuthentication = false;
  };
}

