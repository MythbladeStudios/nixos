{ pkgs, username, ... }: {

  hjem.users.${username} = {
    packages = [ pkgs.starship ];

    xdg.config.files."starship.toml".text = ''
      add_newline = false
      format = "  $cmd_duration $directory\n$character"

      [package]
      disabled = true

      [character]
      success_symbol = "[ ](bold fg:240)"
      error_symbol = "[ ](bold fg:240)"

      [cmd_duration]
      min_time = 0
      format = "[](bold fg:255)[ $duration](bold bg:255 fg:240)[](bold fg:255)"

      [directory]
      home_symbol = " "
      read_only = ""
      style = "bg:255 fg:240"
      truncation_length = 2
      truncation_symbol = ".../"
      format = "[](bold fg:255)[󰉋 → $path]($style)[](bold fg:255)"
      disabled = false

      [directory.substitutions]
      "Desktop" = "   "
      "Documents" = "  "
      "Downloads" = "  "
      "Music" = " 󰝚 "
      "Pictures" = "   "
      "Videos" = "   "

      [fill]
      symbol = " "
      style = "fg:245"

      [username]
      style_user = "bold bg:255 fg:240"
      style_root = "red bold"
      format = "[](bold fg:255)[$user]($style)[](bold fg:255)"
      show_always = true

      [time]
      format = " [\\[ $time \\]]($style) "
      time_format = "%I:%M %p"
  '';
  };
}

