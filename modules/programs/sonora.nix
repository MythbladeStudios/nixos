{ inputs, username, ... }: {

  imports = [ inputs.sonora.nixosModules.default ];

  programs.sonora = {
    enable = true;
  };

  programs.sonora.settings = {
    font = "Adwaita Sans";
    local_folders = [ "/home/${username}/Music/Vibin'" ];
    added_nav = [ "settings" ];
    close_to_tray = true;

    discord_presence = true;
    discord_name = "music";
    discord_sonora_button = false;
    discord_provider_button = false;
  };

  programs.sonora.settings.appearance = {
    theme = "noctalia";
    rounding = "subtle";
    player_bar_time_left = true;

    visualizer_style = "bars";
    visualizer_screens.cover = true;
    visualizer_screens.lyrics = true;
    visualizer_screens.queue = true;
  };
}

