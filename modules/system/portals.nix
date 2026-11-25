{ ... }: {

  xdg.portal = {
    enable = true;
    config.umbriel = {
      default = [ "umbriel" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "luciole" ];
    };
  };
}

