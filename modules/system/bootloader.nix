{ ... }: {

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 5;
    consoleMode = "auto";
    editor = false;
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
    timeout = 3;
  };
}

