{ pkgs, ... }: {

  fonts.packages = with pkgs; [
    adwaita-fonts
    maple-mono.NF
    noto-fonts
    noto-fonts-cjk-sans
    twemoji-color-font # doesn't work on electron apps
  ];

  fonts.fontconfig.defaultFonts = {
    sansSerif = ["Adwaita Sans"];
    monospace = ["Maple Mono NF"];
    emoji = ["Twitter Color Emoji"];
  };
}

