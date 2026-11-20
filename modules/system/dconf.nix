{ lib, ... }:

let
  settings = {
    "org/gnome/desktop/wm/preferences".button-layout = ":";

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Tela-circle";
      gtk-enable-primary-paste = false;
     };

    "org/gnome/TextEditor" = {
      show-line-numbers = true;
      indent-style = "space";
      tab-width = lib.gvariant.mkUint32 2;
      style-variant = "follow";
      restore-session = false;
      highlight-current-line = true;
      auto-indent = false;
      spellcheck = true;
      custom-font = "Maple Mono NF 11";
    };
  };
in

{
  programs.dconf = {
    enable = true;
    profiles.user.databases = [ { inherit settings; } ];
  };
}

