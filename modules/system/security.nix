{ ... }: {

  security = {
    rtkit.enable = true;
    sudo.extraConfig = "Defaults pwfeedback";
    pam.services.greetd.enableGnomeKeyring = true;
  };
}

