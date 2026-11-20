{ inputs, username, dotfiles, ... }: {

  imports = [ inputs.noctalia-greeter.nixosModules.default ];

  services.displayManager.noctalia-greeter = {
    enable = true;
    passwordless-sync-users = [ username ];

    settings = {
      user.default = username;
      session.default = "umbriel";

      appearance = {
        scheme = "Synced";
        password_style = "default";
        hide_logo = true;
        power_buttons_position = "bottom-right";
        scheme_selector_position = "hidden";
        corner_radius_scale = 5;
        font_family = "Adwaita Sans";
      };

      clock = {
        enabled = true;
        position = "above-panel";
        time_format = "%I:%M %p";
        date_format = "%A, %B %d";
      };

      output = {
        layout = "DP-1:0,0; DP-2:2560,0";
        scales = "DP-1:1; DP-2:1";
        scale = 1;
      };

      idle.timeout = 300; # 5m

      cursor = {
        theme = "windows-11-concept-cursors-dark";
        path = "${dotfiles}/cursors";
        size = 24;
      };

      keyboard = {
        layout = "us";
        numlock = true;
      };

      auth.allow_empty_password = false;
    };
  };
}

