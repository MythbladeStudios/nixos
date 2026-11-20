{ ... }: {

  services.sunshine = { # desktop streaming
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };
}

