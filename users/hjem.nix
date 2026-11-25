{ inputs, pkgs, username, dotfiles, ... }:

let cursor-theme = "windows-11-concept-cursors"; in

{
  imports = [ inputs.hjem.nixosModules.default ];

  hjem.users.${username} = {
    directory = "/home/${username}";

    packages = with pkgs; [
      adw-gtk3
      tela-circle-icon-theme
    ];

    files."Pictures/Wallpapers".source = "${dotfiles}/wallpapers";

    xdg.config.files = {
      "noctalia".source = "${dotfiles}/noctalia";
      "umbriel".source = "${dotfiles}/umbriel";

      "user-dirs.dirs".text = ''
        XDG_DESKTOP_DIR="$HOME/Desktop"
        XDG_DOCUMENTS_DIR="$HOME/Documents"
        XDG_DOWNLOAD_DIR="$HOME/Downloads"
        XDG_MUSIC_DIR="$HOME/Music"
        XDG_PICTURES_DIR="$HOME/Pictures"
        XDG_PROJECTS_DIR="$HOME/Projects"
        XDG_SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"
        XDG_TEMPLATES_DIR="$HOME/Templates"
        XDG_VIDEOS_DIR="$HOME/Videos"
      '';
    };

    xdg.data.files = {
      "icons/${cursor-theme}-dark".source = "${dotfiles}/cursors/${cursor-theme}-dark";
      "icons/${cursor-theme}-light".source = "${dotfiles}/cursors/${cursor-theme}-light";
    };

    files = { # hide apps in noctalia's launcher
      ".local/share/applications/btop.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=btop++
        NoDisplay=true
      '';

      ".local/share/applications/blueman-manager.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=blueman-manager
        NoDisplay=true
      '';

      ".local/share/applications/dev.noctalia.Noctalia.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Noctalia
        NoDisplay=true
      '';
    };
  };
}

