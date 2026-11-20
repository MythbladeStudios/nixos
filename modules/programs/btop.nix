{ pkgs, username, ... }: {

  hjem.users.${username} = {
    packages = [ pkgs.btop ];

    xdg.config.files."btop/btop.conf".text = ''
      color_theme = "noctalia"
      theme_background = False
    '';
  };
}

