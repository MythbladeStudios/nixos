{ pkgs, username, ... }: {

  hjem.users.${username} = {
    packages = [ pkgs.jujutsu ];

    xdg.config.files."jj/config.toml".text = ''
      [user]
      name = "MythbladeStudios"
      email = "201421987+MythbladeStudios@users.noreply.github.com"
    '';
  };
}

