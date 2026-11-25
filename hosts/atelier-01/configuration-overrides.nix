{ pkgs, username, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./partitions.nix
    ../../modules/programs/sunshine.nix
  ];

  networking.hostName = "atelier-01";

  hardware.amdgpu = {
    initrd.enable = true;
    overdrive.enable = true;
  };

  services = {
    easyeffects.enable = true; # cloud lifter replacement
    lact.enable = true; # undervolting
  };

  environment.systemPackages = [ pkgs.ddcutil ]; # monitor brightness
  hjem.users.${username}.packages = with pkgs; [
    audacity
    blender
    godot # game development
    # jetbrains.idea
    ladybird # new web browser
    # orca-slicer # 3d printing
  ];
}

