{ pkgs, username, ... }: {

  hjem.users.${username} = {
    packages = [ pkgs.kitty ];

    xdg.config.files."kitty/kitty.conf".text = ''
      font_family Maple Mono NF
      font_size 11.0

      shell_integration no-cursor
      background_opacity 0.9
      window_padding_width 20
      confirm_os_window_close 0

      disable_ligatures always
      strip_trailing_spaces smart

      cursor_shape underline
      cursor_blink_interval 0.5
      cursor_trail 3
      cursor_trail_decay 0.1 0.4

      scrollback_lines 10000
      scrollbar_handle_opacity 0
      scrollbar_track_opacity 0
      scrollbar_track_hover_opacity 0

      detect_urls yes
      url_style curly
      enable_audio_bell no

      include themes/noctalia.conf
    '';
  };
}

