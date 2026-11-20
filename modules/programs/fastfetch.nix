{ pkgs, lib, username, dotfiles, ... }: {

  hjem.users.${username} = {
    packages = [ pkgs.fastfetch ];

    xdg.config.files."fastfetch/config.jsonc" = {
      type = "copy";
      permissions = "644";
      generator = lib.generators.toJSON { };
      value = {
        logo = {
          source = "${dotfiles}/ascii/nixos-dots.txt";
          color = {
            "1" = "blue";
            "2" = "cyan";
            "3" = "blue";
            "4" = "cyan";
            "5" = "blue";
            "6" = "cyan";
          };
          padding = {
            top = 2;
            left = 1;
            right = 2;
          };
        };

        display.separator = " ";

        modules = [
          {type = "title"; format = "{#1}╭───────────── {#}{host-name-colored}";}

          {type = "os"; key = "{#separator}┊  {#keys} System:";}
          {type = "kernel"; key = "{#separator}┊  {#keys} Kernel:";}
          {type = "packages"; key = "{#separator}┊  {#keys}󰏖 Packages:"; format = "{all}";}
          {type = "uptime"; key = "{#separator}┊  {#keys}󰅐 Uptime:";}
          {type = "command"; key = "{#separator}┊  {#keys}󰃭 OS Age:"; text = "echo $(( ($(date +%s) - $(stat -c %W /)) / 86400 )) days";}
          {type = "custom"; format = "{#1}┊";}

          {type = "de"; key = "{#separator}┊  {#keys}󰧨 DE:";}
          {type = "wm"; key = "{#separator}┊  {#keys}󱂬 WM:";}
          {type = "display"; key = "{#separator}┊  {#keys}󰹑 Display:";}
          {type = "terminal"; key = "{#separator}┊  {#keys}󰆍 Terminal:";}
          {type = "shell"; key = "{#separator}┊  {#keys}󰞷 Shell:";}
          {type = "terminalfont"; key = "{#separator}┊  {#keys}󰛖 Font:";}
          {type = "custom"; format = "{#1}┊";}

          {type = "cpu"; key = "{#separator}┊  {#keys} CPU:";}
          {type = "gpu"; key = "{#separator}┊  {#keys} GPU:";}
          {type = "memory"; key = "{#separator}┊  {#keys} Memory:";}
          {type = "swap"; key = "{#separator}┊  {#keys} Swap:";}
          {type = "battery"; key = "{#separator}┊  {#keys} Battery:";}
          {type = "disk"; key = "{#separator}┊  {#keys}󰉉 Storage (/):"; folders = "/";}
          {type = "custom"; format = "{#1}┊";}

          {type = "colors"; key = "{#separator}┊ "; symbol = "circle";}

          {type = "custom"; format = "{#1}╰────────────────────────────────";}
        ];
      };
    };
  };
}

